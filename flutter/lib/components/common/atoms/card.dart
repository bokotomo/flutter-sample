import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        BoxDecoration,
        Border,
        Container,
        BorderRadius,
        EdgeInsets;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// 背景付きコンテンツ
class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.child,
  });

  /// 文字
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: ConstantColor.box,
      border: Border.all(color: ConstantColor.boxBorder),
      borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
    );

    return Container(
      padding: const EdgeInsets.all(ConstantSizeUI.l3),
      width: double.infinity,
      decoration: decoration,
      child: child,
    );
  }
}
