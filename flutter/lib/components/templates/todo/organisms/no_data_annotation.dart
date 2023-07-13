import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        BuildContext,
        SizedBox,
        Column,
        MainAxisAlignment,
        Icon,
        Icons,
        TextAlign;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

/// やることリスト: データがまだない
class TodoNoDataAnnotation extends StatelessWidget {
  const TodoNoDataAnnotation({
    required this.i18n,
    super.key,
  });

  /// 言語
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
            text: i18n.pageTodoNoData,
            size: "M",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
