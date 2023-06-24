import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeFont;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;

/// 注釈テキスト
class TextAnnotation extends StatelessWidget {
  const TextAnnotation({
    super.key,
    required this.text,
    required this.size,
    this.textAlign,
  });

  /// 文字
  final String text;

  /// サイズ
  final String size;

  /// 寄せる方向
  final TextAlign? textAlign;

  /// 文字サイズを返す
  double getFontSize() {
    switch (size) {
      case "L":
        return ConstantSizeFont.l;
      case "XM":
        return ConstantSizeFont.xm;
      case "M":
        return ConstantSizeFont.m;
      case "S":
        return ConstantSizeFont.s;
      case "XS":
        return ConstantSizeFont.xs;
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
        color: ConstantColor.textOpacity,
      ),
    );
  }
}
