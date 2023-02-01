import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/templates/reflection_add/handler.dart'
    show onChanged, onPressed;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

Column cloumn = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    BasicText(
      text: '振り返りの種類',
      size: "M",
    ),
    SizedBox(height: ConstantSizeUI.l3),
    BasicText(
      text: '悪かった/良かった',
      size: "S",
    ),
    SizedBox(height: ConstantSizeUI.l4),
    BasicText(
      text: '悪かった点',
      size: "M",
    ),
    SizedBox(height: ConstantSizeUI.l3),
    InputText(
        hintText: '悪かった点を書く(40文字以内)', autofocus: true, onChanged: onChanged),
    SizedBox(height: ConstantSizeUI.l4),
    ButtonBasic(icon: Icons.add, text: '追加する', onPressed: onPressed),
  ],
);

Padding content = Padding(
  padding: const EdgeInsets.all(ConstantSizeUI.l3),
  child: cloumn,
);

Scaffold wrapper = Scaffold(
  backgroundColor: ConstantColor.content,
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
