import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/button_circle.dart'
    as button;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;

/// reflectionは消す

/// 追加ボタンを押した
void onPressAdd() {
  print("OK");
}

///
Scaffold body = const Scaffold(
  body: Center(
    child: BasicText(
      text: '振り返り',
      size: "M",
    ),
  ),
  backgroundColor: ConstantColor.content,
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  floatingActionButton: Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: button.ButtonCircle(
      onPressed: onPressAdd,
    ),
  ),
);

Scaffold wrapper = Scaffold(
  backgroundColor: ConstantColor.content,
  appBar: const Header(title: "振り返り"),
  body: body,
);

/// テンプレート: 振り返りの一覧
class TemplateReflection extends StatelessWidget {
  const TemplateReflection({super.key});

  @override
  Widget build(BuildContext context) {
    return wrapper;
  }
}
