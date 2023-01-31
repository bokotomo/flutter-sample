import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Column body = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [
    Icon(
      Icons.info,
      color: ConstantColor.textOpacity,
      size: 60,
    ),
    SizedBox(height: ConstantSizeUI.l3),
    TextAnnotation(
      text: 'まだタスクがありません。振り返りから追加しましょう！',
      size: "M",
      textAlign: TextAlign.center,
    ),
  ],
);

Padding content = Padding(
  padding: const EdgeInsets.all(ConstantSizeUI.l3),
  child: body,
);

Scaffold wrapper = Scaffold(
  backgroundColor: ConstantColor.content,
  appBar: const Header(title: "タスク"),
  body: content,
);

/// テンプレート: タスク一覧
class TemplateTaskScreen extends StatelessWidget {
  const TemplateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return wrapper;
  }
}
