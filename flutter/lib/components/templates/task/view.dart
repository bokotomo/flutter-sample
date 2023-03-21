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
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  BuildContext context,
  void Function(BuildContext context, int taskId) pushTaskDetail,
  Period period,
  List<DomainReflection> filteredReflections,
  void Function() onPressedAll,
  void Function() onPressedThreeMonth,
  void Function() onPressedMonth,
) {
  final tasklist = TaskList(
    reflections: filteredReflections,
    onPressedTask: (int index) => pushTaskDetail(
      context,
      filteredReflections[index].id,
    ),
  );
  final layoutChild =
      filteredReflections.isEmpty ? const TaskNoDataAnnotation() : tasklist;

  final body = ListView(
    children: [
      SpacerHeight.m,

      /// 振り返りグループ選択ボタン
      const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
        ),
        child: SelectReflectionGroup(),
      ),

      SpacerHeight.s,

      /// 期間選択ボタン
      ButtonPeriodFilter(
        period: period,
        onPressedAll: () => onPressedAll(),
        onPressedThreeMonth: () => onPressedThreeMonth(),
        onPressedMonth: () => onPressedMonth(),
      ),

      SpacerHeight.s,

      /// 振り返り一覧
      layoutChild,
    ],
  );

  return BaseLayout(
    title: "タスク",
    child: body,
  );
}
