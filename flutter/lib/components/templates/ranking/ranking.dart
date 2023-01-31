import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart' as text;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
Center body = const Center(
  child: text.BasicText(
    text: 'ランキングを使うには、ニックネームを登録する必要があります。',
    size: "M",
  ),
);

Scaffold wrapper = Scaffold(
  backgroundColor: color.contentColor,
  appBar: const header.Header(title: "Ranking"),
  body: body,
);

/// テンプレート: ランキング
class TemplateRanking extends StatelessWidget {
  const TemplateRanking({super.key});

  @override
  Widget build(BuildContext context) {
    return wrapper;
  }
}
