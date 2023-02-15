import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
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

  return BaseLayout(
    title: "ランキング",
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
