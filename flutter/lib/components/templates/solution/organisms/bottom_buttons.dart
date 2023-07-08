import 'package:flutter/material.dart'
    show Widget, BuildContext, Padding, EdgeInsets, Row, Expanded, Container;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/components/common/atoms/button/thin.dart'
    show ButtonThin;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 下部の固定ボタン
class BottomButtons extends HookWidget {
  const BottomButtons({
    super.key,
    required this.i18n,
    required this.isSelectedGood,
    required this.onPressedBad,
    required this.onPressedGood,
  });

  /// 言語
  final AppLocalizations i18n;

  /// 伸ばすことを選択
  final bool isSelectedGood;

  /// 改善することを押した
  final void Function() onPressedBad;

  /// 伸ばすことを押した
  final void Function() onPressedGood;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstantColor.content,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: ConstantSizeUI.l2),
        child: Row(
          children: [
            SpacerWidth.m,
            Expanded(
              child: ButtonThin(
                text: i18n.pageSolutionButtonGood,
                onPressed: () => onPressedBad(),
                isActive: !isSelectedGood,
              ),
            ),
            SpacerWidth.m,
            Expanded(
              child: ButtonThin(
                text: i18n.pageSolutionButtonBad,
                onPressed: () => onPressedGood(),
                isActive: isSelectedGood,
              ),
            ),
            SpacerWidth.m,
          ],
        ),
      ),
    );
  }
}
