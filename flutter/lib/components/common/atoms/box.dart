import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 背景付きコンテンツ
class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.child,
  });

  /// 文字
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ConstantSizeUI.l3),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ConstantColor.box,
        border: Border.all(color: ConstantColor.boxBorder),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
