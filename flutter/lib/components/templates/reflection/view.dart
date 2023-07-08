// import 'package:flutter/material.dart'
//     show Widget, BuildContext, ListView, Column;
import 'package:flutter/material.dart';
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
      const Box(
        child: Column(
          children: [
            BasicText(
              text: "振り返りのやり方",
              size: "M",
              isBold: true,
            ),
            SpacerHeight.m,
            BasicText(
              text: "1. リプレイを見る\n\n2. 良かったこと悪かったことを書く\n\n3. 同じ振り返りは候補から追加する",
              size: "M",
            ),
          ],
        ),
      ),
      SpacerHeight.m,
      ButtonBasic(
        text: '振り返りを始める',
        onPressed: () => onPressedStart(context),
      ),
    ],
  );

  return BaseLayoutPadding(
    title: "振り返りの追加",
    isBackGround: true,
    onClickHistory: () => onPressedHistory(context),
    child: cloumn,
  );
}
