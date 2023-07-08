import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/solution/molecules/button_solution.dart'
    show ButtonSolution;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/domain/solution/reflection.dart'
    show DomainSolutionReflection;

/// 解決案一覧: 一覧
class SolutionList extends StatelessWidget {
  const SolutionList({
    super.key,
    required this.i18n,
    required this.reflections,
    required this.onPressed,
  });
  final AppLocalizations i18n;

  /// 振り返り一覧
  final List<DomainSolutionReflection> reflections;

  /// リストアイテムを押した
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < reflections.length; i++) ...{
          const Bar(color: ConstantColorButton.taskListBorder),
          ButtonSolution(
            i18n: i18n,
            text: reflections[i].text,
            isThin: i % 2 == 0,
            count: reflections[i].count,
            tagTextColor: reflections[i].tagColor,
            onPressed: () => onPressed(i),
          ),
        },
        const Bar(color: ConstantColorButton.taskListBorder),
        SpacerHeight.m,
      ],
    );
  }
}
