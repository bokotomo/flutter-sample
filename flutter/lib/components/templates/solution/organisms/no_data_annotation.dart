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
            text: '振り返りがありません。\n「振り返る」から追加しましょう!', // TODO: 言語
            size: "M",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
