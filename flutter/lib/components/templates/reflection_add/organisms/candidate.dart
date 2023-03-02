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
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorInput;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;

/// 振り返り名候補一覧
class ReflectionAddCandidate extends StatelessWidget {
  const ReflectionAddCandidate({
    super.key,
    required this.reflections,
    required this.onPressCandidate,
  });
  final List<DomainReflection> reflections;
  final Function(String text) onPressCandidate;

  @override
  Widget build(BuildContext context) {
    final candidateTitles = Container(
      padding: const EdgeInsets.all(ConstantSizeUI.l1),
      height: 240,
      decoration: BoxDecoration(
        color: ConstantColorInput.input,
        border: Border.all(color: ConstantColorInput.inputBorder),
        borderRadius: BorderRadius.circular(ConstantSizeUI.l1),
      ),
      child: ListView.builder(
        itemCount: reflections.length,
        itemBuilder: (BuildContext context, int i) {
          return ButtonCandidate(
            text: reflections[i].text,
            onPressed: () => onPressCandidate(reflections[i].text),
          );
        },
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
        SpacerHeight.xm,
        candidates,
      ],
    );
  }
}
