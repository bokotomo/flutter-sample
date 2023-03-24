import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeFont;
import 'package:gamer_reflection/modules/const/color/text_tag.dart'
    show ConstantColorTextTag;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 注釈テキスト
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
        return ConstantColorTextTag.textTagRedBorder;
      case TagTextColor.purple:
        return ConstantColorTextTag.textTagPurpleBorder;
      case TagTextColor.blue:
        return ConstantColorTextTag.textTagBlueBorder;
      case TagTextColor.gray:
        return ConstantColorTextTag.textTagGrayBorder;
      default:
        return ConstantColorTextTag.textTagBlueBorder;
    }
  }

  /// タグのテキスト色を取得
  Color getTextColor() {
    switch (colorType) {
      case TagTextColor.red:
        return ConstantColorTextTag.textTagRedText;
      case TagTextColor.purple:
        return ConstantColorTextTag.textTagPurpleText;
      case TagTextColor.blue:
        return ConstantColorTextTag.textTagBlueText;
      case TagTextColor.gray:
        return ConstantColorTextTag.textTagGrayText;
      default:
        return ConstantColorTextTag.textTagBlueText;
    }
  }

  /// タグのテキスト色を取得
  Color getBackGroundColor() {
    switch (colorType) {
      case TagTextColor.gray:
        return ConstantColorTextTag.textTagGrayBackGround;
      default:
        return ConstantColorTextTag.textTagBackground;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        left: ConstantSizeUI.l3,
        right: ConstantSizeUI.l3,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: ConstantSizeFont.xs,
          color: getTextColor(),
        ),
      ),
    );
  }
}
