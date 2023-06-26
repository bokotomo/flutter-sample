import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Padding, EdgeInsets, Column, Expanded;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/task/organisms/no_data_annotation.dart'
    show TaskNoDataAnnotation;
import 'package:gamer_reflection/components/templates/task/organisms/task_list.dart'
    show TaskList;
import 'package:gamer_reflection/components/templates/task/organisms/bottom_buttons.dart'
    show BottomButtons;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/widget.dart'
    show ButtonPeriodFilter;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/domain/task/reflection.dart'
    show DomainTaskReflection;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  void Function(BuildContext context, int taskId) pushTaskDetail,
  Period period,
  List<DomainTaskReflection> filteredReflections,
  bool isSelectedGood,
  Future<void> Function() onPressedAll,
  Future<void> Function() onPressedThreeMonth,
  Future<void> Function() onPressedMonth,
  Future<void> Function() onPressedBad,
  Future<void> Function() onPressedGood,
  void Function(String?) onChangeReflectionGroup,
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
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
        ),
        child: SelectReflectionGroup(
          reflectionGroups: reflectionGroups,
          onChanged: onChangeReflectionGroup,
        ),
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

  final content = Column(
    children: <Widget>[
      Expanded(child: body),
      BottomButtons(
        isSelectedGood: isSelectedGood,
        onPressedBad: () => onPressedBad(),
        onPressedGood: () => onPressedGood(),
      ),
    ],
  );

  return BaseLayout(
    title: "解決案",
    isBackGround: true,
    child: content,
  );
}
