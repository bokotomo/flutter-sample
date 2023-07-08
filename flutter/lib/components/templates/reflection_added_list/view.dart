import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Column, Expanded, Padding, EdgeInsets;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/reflection_added_list/molecules/button_candidate.dart'
    show ButtonCandidate;
import 'package:gamer_reflection/components/common/atoms/button/done.dart'
    show ButtonDone;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(
  AppLocalizations i18n,
  BuildContext context,
  bool isSavePage,
  List<DomainReflectionAdded> reflections,
  Future<bool> Function(BuildContext) onWillPop,
  void Function(String) onClickRemove,
  void Function(BuildContext) onPressedReflectionDone,
) {
  ListView column = ListView(
    children: [
      Column(
        children: [
          for (int i = 0; i < reflections.length; i++) ...{
            const Bar(
              color: ConstantColorButton.taskListBorder,
            ),
            ButtonCandidate(
              text: reflections[i].text,
              isThin: i % 2 == 0,
              count: reflections[i].count,
              isSavePage: isSavePage,
              onClickRemove: () => onClickRemove(reflections[i].text),
            ),
          },
          const Bar(
            color: ConstantColorButton.taskListBorder,
          )
        ],
      ),
      SpacerHeight.xl,
    ],
  );

  final content = Column(
    children: <Widget>[
      Expanded(child: column),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
          vertical: ConstantSizeUI.l3,
        ),
        child: ButtonDone(
          text: '保存する', // TODO: 言語
          onPressed: () => onPressedReflectionDone(context),
        ),
      ),
    ],
  );

  return BaseLayout(
    title: "追加した振り返り",
    isBackGround: false,
    child: isSavePage ? content : column,
    onWillPop: () => onWillPop(context),
  );
}
