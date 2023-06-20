import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Column;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/common/atoms/button/basic.dart'
    show ButtonBasic;

///
Widget view(
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  Function(BuildContext) onPressedStart,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      SelectReflectionGroup(
        reflectionGroups: reflectionGroups,
        onChanged: (t) {},
      ),
      SpacerHeight.m,
      const Box(
        child: Column(
          children: [
            BasicText(
              text: "振り返りのやり方",
              size: "M",
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
    child: cloumn,
  );
}
