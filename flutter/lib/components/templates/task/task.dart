import 'package:flutter/material.dart';
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

///
Widget view(
  List<DomainReflection> reflections,
  BuildContext context,
  Function(BuildContext context, int taskId) pushTaskDetail,
) {
  final layoutChild = reflections.isEmpty
      ? const TaskNoDataAnnotation()
      : TaskList(
          reflections: reflections,
          onPressedTask: (int index) =>
              pushTaskDetail(context, reflections[index].id),
        );

  return BaseLayout(
    title: "タスク",
    child: ListView(
      children: [
        const BasicText(text: "振り返り名A", size: "M"),
        SpacerHeight.s,
        const ButtonPeriodFilter(index: 0),
        SpacerHeight.s,
        layoutChild,
      ],
    ),
  );
}

/// テンプレート: タスク一覧
class TemplateTask extends StatelessWidget {
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
    return view(
      reflections,
      context,
      pushTaskDetail,
    );
  }
}
