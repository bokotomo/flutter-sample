import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/button_candidate.dart'
    show ButtonCandidate;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

/// 振り返り名候補一覧
class ReflectionAddCandidate extends StatelessWidget {
  const ReflectionAddCandidate({
    super.key,
    required this.reflections,
    required this.onPressCandidate,
  });
  final List<DomainReflection> reflections;
  final Function onPressCandidate;

  @override
  Widget build(BuildContext context) {
    final candidateTitles = Container(
      padding: const EdgeInsets.all(ConstantSizeUI.l3),
      decoration: BoxDecoration(
        color: ConstantColor.input,
        border: Border.all(color: ConstantColor.inputBorder),
        borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < reflections.length; i++) ...{
            if (i != 0) const SizedBox(height: ConstantSizeUI.l2),
            ButtonCandidate(
              text: reflections[i].text,
              onPressed: () => onPressCandidate(),
            ),
          }
        ],
      ),
    );

    const candidatesNone = Box(
      child: TextAnnotation(
        text: 'まだ振り返りを追加していません。',
        size: "M",
      ),
    );

    final candidates = reflections.isEmpty ? candidatesNone : candidateTitles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BasicText(
          text: 'もしかして？',
          size: "M",
        ),
        const SizedBox(height: ConstantSizeUI.l4),
        candidates,
      ],
    );
  }
}
