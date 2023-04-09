import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/reflection_add/molecules/button_task_candidate.dart'
    show ButtonTaskCandidate;
import 'package:gamer_reflection/modules/domain/reflection_add/candidate.dart'
    show DomainCandidate;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;

/// 振り返りがない場合
Widget candidatesNone() {
  return Column(
    children: const [
      SpacerHeight.xm,
      Center(
        child: TextAnnotation(
          text: 'まだ振り返りを追加していません。',
          size: "M",
        ),
      )
    ],
  );
}

Widget view(
  List<DomainCandidate> reflections,
  Function(String text) onPressCandidate,
) {
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

  final candidates = reflections.isEmpty ? candidatesNone() : candidateTitles;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      candidates,
    ],
  );
}

/// 振り返り名候補一覧
class ReflectionAddCandidate extends StatelessWidget {
  const ReflectionAddCandidate({
    super.key,
    required this.reflections,
    required this.onPressCandidate,
  });
  final List<DomainCandidate> reflections;
  final Function(String text) onPressCandidate;

  @override
  Widget build(BuildContext context) {
    return view(
      reflections,
      onPressCandidate,
    );
  }
}
