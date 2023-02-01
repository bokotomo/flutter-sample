import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Widget view(BuildContext context) {
  Column body = Column(
    children: [
      ButtonDone(
        text: "このタスクを完了する",
        onPressed: () => {},
      )
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

  return wrapper;
}

///
Center body = const Center(
  child: BasicText(
    text: 'タスク詳細',
    size: "M",
  ),
);

Scaffold wrapper = Scaffold(
  backgroundColor: ConstantColor.content,
  appBar: const Header(title: "タスク詳細"),
  body: body,
);

/// テンプレート: タスク詳細
class TemplateTaskDetail extends StatelessWidget {
  const TemplateTaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return view(context);
  }
}
