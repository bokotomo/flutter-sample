import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/task_detail/task_detail.dart'
    as task_detail;

/// ページ: タスク詳細
class PageTaskDetail extends StatefulWidget {
  const PageTaskDetail({super.key});

  @override
  State<PageTaskDetail> createState() => _PageTaskDetailState();
}

/// _PageTaskDetailState
class _PageTaskDetailState extends State<PageTaskDetail> {
  @override
  void initState() {
    print("タスク詳細");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: task_detail.TemplateTaskDetail(),
    );
  }
}
