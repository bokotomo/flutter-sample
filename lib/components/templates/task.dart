import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart' as text;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
const body = Center(
  child: text.BasicText(
    text: 'まだタスクがありません。振り返りから追加しましょう！',
    size: "M",
  ),
);

/// テンプレート: タスク一覧
class TemplateTaskScreen extends StatelessWidget {
  const TemplateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: color.contentColor,
      appBar: header.Header(title: "タスク"),
      body: body,
    );
  }
}
