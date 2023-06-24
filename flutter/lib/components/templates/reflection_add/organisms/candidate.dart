import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show HookWidget, useEffect, useState;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/reflection_add/molecules/button_task_candidate.dart'
    show ButtonTaskCandidate;
import 'package:gamer_reflection/domain/reflection_add/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

/// 振り返りがない場合
Widget candidatesNone(bool isNotAdd) {
  final text = isNotAdd ? 'リプレイを見て、\n良かったこと悪かったことを書きましょう!' : '候補が見つかりません';

  return Column(
    children: [
      SpacerHeight.xm,
      Center(
        child: TextAnnotation(
          text: text,
          size: "M",
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}

Widget view(
  List<DomainReflectionAddReflection> reflections,
  bool isNotAdd,
  Function(String text) onPressCandidate,
) {
  final Column candidateTitles = Column(
    children: [
      for (int i = 0; i < reflections.length; i++) ...{
        const Bar(
          color: ConstantColorButton.taskListBorder,
        ),
        ButtonTaskCandidate(
          text: reflections[i].text,
          isThin: i % 2 == 0,
          onPressed: () => onPressCandidate(reflections[i].text),
        ),
      },
      const Bar(
        color: ConstantColorButton.taskListBorder,
      )
    ],
  );

  final candidates =
      reflections.isEmpty ? candidatesNone(isNotAdd) : candidateTitles;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      candidates,
    ],
  );
}

/// 振り返り名候補一覧
class ReflectionAddCandidate extends HookWidget {
  const ReflectionAddCandidate({
    super.key,
    required this.reflections,
    required this.onPressCandidate,
    required this.candidatesForListener,
  });
  final List<DomainReflectionAddReflection> reflections;
  final Function(String text) onPressCandidate;
  final ValueNotifier<List<DomainReflectionAddReflection>>
      candidatesForListener;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<DomainReflectionAddReflection>> candidates =
        useState<List<DomainReflectionAddReflection>>([]);

    final bool isNotAdd = reflections.isEmpty;

    /// 外部で候補一覧が更新されたら実行
    void updateCandidates() {
      candidates.value = candidatesForListener.value;
    }

    /// NOTE:
    /// TextFormFieldの入力時に候補一覧を更新すると、
    /// TextFormFieldもリレンダリングされフォーカスが外れてしまう。
    /// 候補だけをレンダリングさせたいのでListenerでイベント発火している。
    useEffect(() {
      // 候補一覧を更新する
      candidates.value = reflections
          .map(
            (d) => DomainReflectionAddReflection(
              text: d.text,
              count: d.count,
            ),
          )
          .toList();

      candidatesForListener.addListener(updateCandidates);
      return;
    }, []);

    return view(
      candidates.value,
      isNotAdd,
      onPressCandidate,
    );
  }
}
