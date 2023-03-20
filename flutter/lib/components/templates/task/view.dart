import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Padding, EdgeInsets;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/task/organisms/no_data_annotation.dart'
    show TaskNoDataAnnotation;
import 'package:gamer_reflection/components/templates/task/organisms/task_list.dart'
    show TaskList;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/widget.dart'
    show ButtonPeriodFilter;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  BuildContext context,
  void Function(BuildContext context, int taskId) pushTaskDetail,
  List<DomainReflection> reflections,
  int periodIndex,
  List<DomainReflection> filteredReflections,
  void Function(int) changePeriodIndex,
) {
  final list = TaskList(
    reflections: reflections,
    onPressedTask: (int index) => pushTaskDetail(
      context,
      reflections[index].id,
    ),
  );
  final layoutChild = reflections.isEmpty ? const TaskNoDataAnnotation() : list;

  final body = ListView(
    children: [
      SpacerHeight.m,
      const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
        ),
        child: SelectReflectionGroup(),
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
