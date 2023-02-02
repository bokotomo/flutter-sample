import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/templates/task_detail/handler.dart'
    show useHandler;

///
Widget view(BuildContext context, int taskId, DomainReflection? reflection) {
  final handler = useHandler();
  Column body = Column(
    children: [
      const BasicText(
        text: "タスク詳細",
        size: "M",
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      BasicText(
        text: reflection?.text ?? "none",
        size: "M",
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      const BasicText(
        text: "悪かった点の対策",
        size: "M",
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      ButtonDone(
        text: "このタスクを完了する",
        onPressed: () => {
          handler.onPressedTaskDone(taskId, context),
          Navigator.pop(context)
        },
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      ButtonBasic(
        icon: Icons.edit,
        text: "編集する",
        onPressed: () => {},
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
  const TemplateTaskDetail({
    super.key,
    required this.taskId,
    required this.reflection,
  });
  final int taskId;
  final DomainReflection? reflection;

  @override
  Widget build(BuildContext context) {
    return view(context, taskId, reflection);
  }
}
