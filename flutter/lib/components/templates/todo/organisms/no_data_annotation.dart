import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

/// やることリスト: データがまだない
class TaskNoDataAnnotation extends StatelessWidget {
  const TaskNoDataAnnotation({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacerHeight.xl,
          Icon(
            Icons.info,
            color: ConstantColor.textOpacity,
            size: 56,
          ),
          SpacerHeight.m,
          TextAnnotation(
            text: 'やることが追加されていません。\n解決案から追加しましょう!',
            size: "M",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
