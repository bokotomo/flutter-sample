import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/atoms/text.dart' as text;
import 'package:gamer_reflection/components/molecules/header.dart' as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
const body = Center(
  child: text.BasicText(
    text: '振り返り追加',
    size: "M",
  ),
);

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends StatelessWidget {
  const TemplateReflectionAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: color.contentColor,
      appBar: header.Header(title: "Add Reflection"),
      body: body,
    );
  }
}
