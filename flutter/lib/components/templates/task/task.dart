import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
Center body = const Center(
  child: BasicText(
    text: 'まだタスクがありません。振り返りから追加しましょう！',
    size: "M",
  ),
);

Scaffold wrapper = Scaffold(
  backgroundColor: color.contentColor,
  appBar: const Header(title: "タスク"),
  body: body,
);

/// テンプレート: タスク一覧
class TemplateTaskScreen extends StatelessWidget {
  const TemplateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return wrapper;
  }
}
