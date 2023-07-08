import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/common/atoms/text_tag.dart'
    show TextTag;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;

/// ボタン: 詳細アイテム
class ButtonSolution extends StatelessWidget {
  const ButtonSolution({
    super.key,
    required this.i18n,
    required this.text,
    required this.isThin,
    required this.count,
    required this.tagTextColor,
    this.onPressed,
  });

  final AppLocalizations i18n;

  /// 文字
  final String text;

  /// 薄いか
  final bool isThin;

  /// 回数
  final int count;

  /// 色
  final TagTextColor tagTextColor;

  /// クリックした
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    /// クリックされた
    void onPressed() {
      if (this.onPressed == null) return;
      this.onPressed!();
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isThin
            ? ConstantColorButton.taskListThin
            : ConstantColorButton.taskList,
        minimumSize: const Size.fromHeight(ConstantSizeUI.l10),
        padding: const EdgeInsets.only(
          left: ConstantSizeUI.l3,
          right: 0,
        ),
      ),
      child: Row(
        children: [
          TextTag(
            text: i18n.pageSolutionCountValue(count),
            colorType: tagTextColor,
          ),
          SpacerWidth.m,
          Expanded(
            child: BasicText(
              text: text,
              size: "M",
              isNoSelect: true,
            ),
          ),
          SpacerWidth.s,
          const Icon(
            Icons.arrow_right,
            color: ConstantColor.taskListArrow,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
