import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/task/task.dart' as task;

/// ページ: タスク一覧
class PageTask extends StatefulWidget {
  const PageTask({super.key});

  @override
  State<PageTask> createState() => _PageTaskState();
}

/// _PageTaskState
class _PageTaskState extends State<PageTask> {
  @override
  void initState() {
    print("PageTask");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: task.TemplateTaskScreen(),
    );
  }
}
