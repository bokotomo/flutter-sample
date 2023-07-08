import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Padding, EdgeInsets, Column, Expanded;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/solution/organisms/no_data_annotation.dart'
    show SolutionNoDataAnnotation;
import 'package:gamer_reflection/components/templates/solution/organisms/solution_list.dart'
    show SolutionList;
import 'package:gamer_reflection/components/templates/solution/organisms/bottom_buttons.dart'
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
import 'package:gamer_reflection/domain/solution/reflection.dart'
    show DomainSolutionReflection;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  AppLocalizations i18n,
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  void Function(BuildContext, int) pushSolutionDetail,
  Period period,
  List<DomainSolutionReflection> filteredReflections,
  bool isSelectedGood,
  Future<void> Function() onPressedAll,
  Future<void> Function() onPressedThreeMonth,
  Future<void> Function() onPressedMonth,
  Future<void> Function() onPressedBad,
  Future<void> Function() onPressedGood,
  void Function(String?) onChangeReflectionGroup,
) {
  final list = SolutionList(
    reflections: filteredReflections,
    onPressed: (int index) => pushSolutionDetail(
      context,
      filteredReflections[index].id,
    ),
  );
  final layoutChild = filteredReflections.isEmpty
      ? SolutionNoDataAnnotation(
          i18n: i18n,
        )
      : list;

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
    title: "解決案", // TODO: 言語
    isBackGround: true,
    child: content,
  );
}
