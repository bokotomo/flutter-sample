import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart' as text;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
const body = Center(
  child: text.BasicText(
    text: '振り返り名の追加',
    size: "M",
  ),
);

/// テンプレート: 振り返り名の追加
class TemplateAddReflectionName extends StatelessWidget {
  const TemplateAddReflectionName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: color.contentColor,
      appBar: header.Header(title: "振り返り名の追加"),
      body: body,
    );
  }
}
