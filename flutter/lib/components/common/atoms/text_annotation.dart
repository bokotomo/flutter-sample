import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeFont;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

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
    if (size == "L") {
      return ConstantSizeFont.l;
    } else if (size == "XM") {
      return ConstantSizeFont.xm;
    } else if (size == "M") {
      return ConstantSizeFont.m;
    }
    return ConstantSizeFont.s;
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
