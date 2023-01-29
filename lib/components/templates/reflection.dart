import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart' as text;
import 'package:gamer_reflection/components/common/atoms/button.dart' as button;
import 'package:gamer_reflection/components/common/molecules/header.dart' as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

/// 追加ボタンを押した
void onPressAdd() {
  print("OK");
}

///
const body = Scaffold(
  body: Center(
    child: text.BasicText(
      text: '振り返り',
      size: "M",
    ),
  ),
  backgroundColor: color.contentColor,
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  floatingActionButton: Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: button.ButtonCircle(
      onPressed: onPressAdd,
    ),
  ),
);

/// テンプレート: 振り返りの一覧
class TemplateReflection extends StatelessWidget {
  const TemplateReflection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: color.contentColor,
      appBar: header.Header(title: "Reflection"),
      body: body,
    );
  }
}
