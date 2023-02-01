import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/task_detail/task_detail.dart'
    as task_detail;

/// ページ: タスク詳細
class PageTaskDetail extends StatefulWidget {
  const PageTaskDetail({super.key, required this.taskId});
  final int taskId;

  @override
  State<PageTaskDetail> createState() => _PageTaskDetailState();
}

/// _PageTaskDetailState
class _PageTaskDetailState extends State<PageTaskDetail> {
  @override
  void initState() {
    print("タスク詳細 ${widget.taskId}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: task_detail.TemplateTaskDetail(taskId: widget.taskId),
    );
  }
}
