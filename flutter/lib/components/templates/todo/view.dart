import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, TextAlign;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

Widget view(BuildContext context) {
  ListView cloumn = ListView(
    children: const [
      SpacerHeight.m,
      TextAnnotation(
        text: 'やることリスト',
        size: "M",
        textAlign: TextAlign.center,
      ),
    ],
  );

  return BaseLayoutPadding(
    title: "やることリスト",
    isBackGround: true,
    child: cloumn,
  );
}
