import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeFont;
import 'package:gamer_reflection/modules/const/color/text_tag.dart'
    show ConstantColorTextTag;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// タグテキスト
class TextTag extends StatelessWidget {
  const TextTag({
    super.key,
    required this.text,
    required this.colorType,
  });

  /// 文字
  final String text;

  /// 色の種類
  final TagTextColor colorType;

  /// タグの枠線色を取得
  Color getBorderColor() {
    switch (colorType) {
      case TagTextColor.red:
        return ConstantColorTextTag.redBorder;
      case TagTextColor.purple:
        return ConstantColorTextTag.purpleBorder;
      case TagTextColor.blue:
        return ConstantColorTextTag.blueBorder;
      case TagTextColor.gray:
        return ConstantColorTextTag.grayBorder;
      default:
        return ConstantColorTextTag.blueBorder;
    }
  }

  /// タグのテキスト色を取得
  Color getTextColor() {
    switch (colorType) {
      case TagTextColor.red:
        return ConstantColorTextTag.redText;
      case TagTextColor.purple:
        return ConstantColorTextTag.purpleText;
      case TagTextColor.blue:
        return ConstantColorTextTag.blueText;
      case TagTextColor.gray:
        return ConstantColorTextTag.grayText;
      default:
        return ConstantColorTextTag.blueText;
    }
  }

  /// タグのテキスト色を取得
  Color getBackGroundColor() {
    switch (colorType) {
      case TagTextColor.gray:
        return ConstantColorTextTag.grayBackGround;
      default:
        return ConstantColorTextTag.background;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: ConstantSizeUI.l7,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: getBackGroundColor(),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: getBorderColor()),
          boxShadow: [
            BoxShadow(
              color: getBorderColor(),
              spreadRadius: 0,
              blurRadius: ConstantSizeUI.l0,
            ),
          ],
        ),
        padding: const EdgeInsets.only(
          top: ConstantSizeUI.l0,
          bottom: ConstantSizeUI.l0,
          left: ConstantSizeUI.l2,
          right: ConstantSizeUI.l2,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ConstantSizeFont.xs,
            color: getTextColor(),
          ),
        ),
      ),
    );
  }
}
