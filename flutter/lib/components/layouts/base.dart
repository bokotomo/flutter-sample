import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// レイアウト: 基本
class BaseLayout extends StatelessWidget {
  const BaseLayout({
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
        borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
      ),
      child: child,
    );
  }
}
