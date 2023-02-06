import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeFont;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

/// 基本的なテキスト
class BasicText extends StatelessWidget {
  const BasicText({
    super.key,
    required this.text,
    required this.size,
    this.textAlign,
  });
  // 文字
  final String text;
  // サイズ
  final String size;
  // 寄せる方向
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
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontSize: getFontSize(),
        color: ConstantColor.text,
      ),
    );
  }
}
