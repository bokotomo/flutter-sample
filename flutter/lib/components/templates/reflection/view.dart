// import 'package:flutter/material.dart'
//     show Widget, BuildContext, ListView, Column;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/common/atoms/button/basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/atoms/gauge_bar.dart'
    show GaugeBar;

///
Widget view(
  AppLocalizations i18n,
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  String expText,
  String rank,
  double gaugePercent,
  Function(BuildContext) onPressedStart,
  Function(BuildContext) onPressedHistory,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      SelectReflectionGroup(
        reflectionGroups: reflectionGroups,
        onChanged: (t) {},
      ),
      SpacerHeight.m,
      Row(children: [
        Image.asset(
          'images/rankSilver.png',
          width: 48,
          height: 48,
        ),
        SpacerWidth.s,
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BasicText(
                    text: rank,
                    size: "M",
                    isBold: true,
                    textAlign: TextAlign.center,
                  ),
                  BasicText(
                    text: expText,
                    size: "S",
                    isBold: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SpacerHeight.s,
              GaugeBar(percent: gaugePercent),
            ],
          ),
        )
      ]),
      SpacerHeight.m,
      Box(
        child: Column(
          children: [
            BasicText(
              text: i18n.pageReflectionHowToTitle,
              size: "M",
              isBold: true,
            ),
            SpacerHeight.m,
            BasicText(
              text: i18n.pageReflectionHowToDetail,
              size: "M",
            ),
          ],
        ),
      ),
      SpacerHeight.m,
      ButtonBasic(
        text: i18n.pageReflectionButtonStart,
        onPressed: () => onPressedStart(context),
      ),
    ],
  );

  return BaseLayoutPadding(
    i18n: i18n,
    title: i18n.pageReflectionTitle,
    isBackGround: true,
    onClickHistory: () => onPressedHistory(context),
    child: cloumn,
  );
}
