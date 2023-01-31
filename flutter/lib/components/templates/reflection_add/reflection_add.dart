import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart' as text;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

Column cloumn = Column(
  children: const [
    text.BasicText(
      text: '振り返りの種類',
      size: "M",
    ),
    text.BasicText(
      text: '悪かった点',
      size: "M",
    ),
    TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '悪かった点を書く(40文字以内)',
      ),
      autofocus: true,
    ),
  ],
);

Padding content = Padding(
  padding: const EdgeInsets.all(16),
  child: cloumn,
);

Scaffold wrapper = Scaffold(
  backgroundColor: color.contentColor,
  appBar: const header.Header(title: "振り返りの追加"),
  body: content,
);

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends StatelessWidget {
  const TemplateReflectionAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return wrapper;
  }
}
