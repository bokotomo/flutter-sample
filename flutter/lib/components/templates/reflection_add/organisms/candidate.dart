import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/reflection_add/molecules/button_task_candidate.dart'
    show ButtonTaskCandidate;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorButton;

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
    final Column candidateTitles = Column(
      children: [
        for (int i = 0; i < reflections.length; i++) ...{
          const Bar(
            color: ConstantColorButton.buttonTaskListBorder,
          ),
          ButtonTaskCandidate(
            text: reflections[i].text,
            isThin: i % 2 == 0,
            onPressed: () => onPressCandidate(reflections[i].text),
          ),
        },
        const Bar(
          color: ConstantColorButton.buttonTaskListBorder,
        )
      ],
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
          text: '振り返り候補',
          size: "M",
        ),
        SpacerHeight.xm,
        candidates,
      ],
    );
  }
}
