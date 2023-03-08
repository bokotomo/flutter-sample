import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/templates/task/organisms/no_data_annotation.dart'
    show TaskNoDataAnnotation;
import 'package:gamer_reflection/components/templates/task/organisms/task_list.dart'
    show TaskList;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/molecules/button_period_filter.dart'
    show ButtonPeriodFilter;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/templates/task/hooks.dart'
    show useHooks;

///
Widget view(
  List<DomainReflection> reflections,
  BuildContext context,
  Function(BuildContext, int) pushTaskDetail,
  int periodIndex,
  Function(int) changePeriodIndex,
) {
  final layoutChild = reflections.isEmpty
      ? const TaskNoDataAnnotation()
      : TaskList(
          reflections: reflections,
          onPressedTask: (int index) =>
              pushTaskDetail(context, reflections[index].id),
        );

  final body = ListView(
    children: [
      SpacerHeight.m,
      const Center(
        child: BasicText(text: "振り返り名A", size: "M"),
      ),
      SpacerHeight.s,
      ButtonPeriodFilter(
        index: periodIndex,
        onPressedAll: () => {changePeriodIndex(0)},
        onPressedThreeMonth: () => {changePeriodIndex(1)},
        onPressedMonth: () => {changePeriodIndex(2)},
      ),
      SpacerHeight.s,
      layoutChild,
    ],
  );

  return BaseLayout(
    title: "タスク",
    child: body,
  );
}

/// テンプレート: タスク一覧
class TemplateTask extends HookWidget {
  const TemplateTask({
    super.key,
    required this.reflections,
    required this.pushTaskDetail,
  });

  /// 振り返り一覧
  final List<DomainReflection> reflections;

  /// クリックした
  final void Function(BuildContext context, int taskId) pushTaskDetail;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(reflections);

    return view(
      hooks.filteredReflections,
      context,
      pushTaskDetail,
      hooks.periodIndex,
      hooks.changePeriodIndex,
    );
  }
}
