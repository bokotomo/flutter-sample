import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart' as text;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
const body = Center(
  child: text.BasicText(
    text: 'タスク詳細',
    size: "M",
  ),
);

/// テンプレート: タスク詳細
class TemplateTaskDetail extends StatelessWidget {
  const TemplateTaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: color.contentColor,
      appBar: header.Header(title: "タスク詳細"),
      body: body,
    );
  }
}
