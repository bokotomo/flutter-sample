import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        TextAlign,
        BuildContext,
        Text,
        TextStyle,
        FontWeight;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeFont;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;

/// 基本的なテキスト
class BasicText extends StatelessWidget {
  const BasicText({
    super.key,
    required this.text,
    required this.size,
    this.textAlign,
    this.isBold,
  });

  /// 文字
  final String text;

  /// サイズ
  final String size;

  /// 太字
  final bool? isBold;

  /// 寄せる方向
  final TextAlign? textAlign;

  /// 文字サイズを返す
  double getFontSize() {
    switch (size) {
      case "L":
        return ConstantSizeFont.l;
      case "M":
        return ConstantSizeFont.m;
      case "XM":
        return ConstantSizeFont.xm;
      case "S":
        return ConstantSizeFont.s;
      default:
        return ConstantSizeFont.s;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isBoldFont = isBold != null && isBold!;

    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontSize: getFontSize(),
        fontWeight: isBoldFont ? FontWeight.bold : FontWeight.normal,
        color: isBoldFont ? ConstantColor.textBold : ConstantColor.text,
      ),
    );
  }
}
