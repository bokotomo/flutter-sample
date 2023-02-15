import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;

/// データがまだない
class TaskNoDataAnnotation extends StatelessWidget {
  const TaskNoDataAnnotation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.info,
            color: ConstantColor.textOpacity,
            size: 56,
          ),
          SpacerHeight.m,
          TextAnnotation(
            text: 'まだタスクがありません。\n振り返りから追加しましょう!',
            size: "M",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
