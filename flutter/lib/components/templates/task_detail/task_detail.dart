import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/templates/task_detail/handler.dart'
    show useHandler;

///
Widget view(BuildContext context, int taskId) {
  final handler = useHandler();
  Column body = Column(
    children: [
      const Text("タスク詳細"),
      const SizedBox(height: ConstantSizeUI.l4),
      const Text("悪かった点の対策"),
      const SizedBox(height: ConstantSizeUI.l4),
      ButtonDone(
        text: "このタスクを完了する",
        onPressed: () => handler.onPressedTaskDone(taskId),
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      ButtonBasic(
        icon: Icons.edit,
        text: "編集する",
        onPressed: () => handler.onPressedTaskDone(taskId),
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
  const TemplateTaskDetail({super.key, required this.taskId});
  final int taskId;

  @override
  Widget build(BuildContext context) {
    return view(context, taskId);
  }
}
