import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;
import 'package:gamer_reflection/modules/const/color.dart' as color;

Column cloumn = Column(
  children: const [
    BasicText(
      text: '振り返りの種類',
      size: "M",
    ),
    BasicText(
      text: '悪かった点',
      size: "M",
    ),
    InputText(hintText: '悪かった点を書く(40文字以内)', autofocus: true),
  ],
);

Padding content = Padding(
  padding: const EdgeInsets.all(16),
  child: cloumn,
);

Scaffold wrapper = Scaffold(
  backgroundColor: color.contentColor,
  appBar: const Header(title: "振り返りの追加"),
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
