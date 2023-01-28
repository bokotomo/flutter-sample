import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/size.dart' as const_size;
import 'package:gamer_reflection/modules/const/color.dart' as color;

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
      return const_size.fontL;
    } else if (size == "M") {
      return const_size.fontM;
    }
    return const_size.fontS;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: getFontSize(),
        color: color.textColor,
      ),
    );
  }
}
