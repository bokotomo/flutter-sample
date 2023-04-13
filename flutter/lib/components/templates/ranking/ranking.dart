import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, TextAlign, StatelessWidget;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;

Widget view(BuildContext context) {
  ListView cloumn = ListView(
    children: const [
      SpacerHeight.m,
      TextAnnotation(
        text: 'ランキングを使うには、ニックネームを登録する必要があります。',
        size: "M",
        textAlign: TextAlign.center,
      ),
    ],
  );

  return BaseLayoutPadding(
    title: "ランキング",
    isBackGround: true,
    child: cloumn,
  );
}

/// テンプレート: ランキング
class TemplateRanking extends StatelessWidget {
  const TemplateRanking({super.key});

  @override
  Widget build(BuildContext context) {
    return view(context);
  }
}
