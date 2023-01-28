import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/atoms/text.dart' as text;
import 'package:gamer_reflection/components/frames/header.dart' as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
const body = Center(
  child: text.BasicText(
    text: 'アカウント画面2',
    size: "M",
  ),
);

///
class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: color.contentColor,
      appBar: header.Header(title: "Ranking"),
      body: body,
    );
  }
}
