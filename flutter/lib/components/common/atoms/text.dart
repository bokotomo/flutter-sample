import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeFont;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

/// 基本的なテキスト
class BasicText extends StatelessWidget {
  const BasicText({
    super.key,
    required this.text,
    required this.size,
  });
  // 文字
  final String text;
  // サイズ
  final String size;

  /// 文字サイズを返す
  double getFontSize() {
    if (size == "L") {
      return ConstantSizeFont.l;
    } else if (size == "M") {
      return ConstantSizeFont.m;
    }
    return ConstantSizeFont.s;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: getFontSize(),
        color: ConstantColor.text,
      ),
    );
  }
}
