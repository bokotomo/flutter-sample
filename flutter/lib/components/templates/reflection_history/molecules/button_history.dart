import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        BoxDecoration,
        Border,
        Expanded,
        EdgeInsets,
        Row,
        Container;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/text_tag.dart'
    show TextTag;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// ボタン: 振り返り履歴一覧
class ButtonHistory extends StatelessWidget {
  const ButtonHistory({
    super.key,
    required this.i18n,
    required this.text,
    required this.isThin,
    required this.count,
  });

  /// 言語
  final AppLocalizations i18n;

  /// 文字
  final String text;

  /// 薄いか
  final bool isThin;

  /// 回数
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isThin
            ? ConstantColorButton.taskListThin
            : ConstantColorButton.taskList,
        border: Border.all(color: ConstantColor.boxBorder),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: ConstantSizeUI.l2,
        horizontal: ConstantSizeUI.l3,
      ),
      child: Row(
        children: [
          TextTag(
            text: i18n.pageReflectionHistoryCountValue(count),
            colorType: TagTextColor.blue,
          ),
          SpacerWidth.m,
          Expanded(
            child: BasicText(
              text: text,
              size: "S",
              isNoSelect: true,
            ),
          ),
        ],
      ),
    );
  }
}
