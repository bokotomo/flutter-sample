import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/atoms/text.dart' as text;
import 'package:gamer_reflection/components/frames/header.dart' as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
const body = Center(
  child: text.BasicText(
    text: 'task画面',
    size: "M",
  ),
);

///
class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: color.contentColor,
      appBar: header.Header(title: "task"),
      body: body,
    );
  }
}
