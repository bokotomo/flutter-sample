import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

/// タスク一覧: データがまだない
class SolutionNoDataAnnotation extends StatelessWidget {
  const SolutionNoDataAnnotation({
    super.key,
    required this.i18n,
  });

  final AppLocalizations i18n;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacerHeight.xl,
          const Icon(
            Icons.info,
            color: ConstantColor.textOpacity,
            size: 56,
          ),
          SpacerHeight.m,
          TextAnnotation(
            text: i18n.solutionPageNoList,
            size: "M",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
