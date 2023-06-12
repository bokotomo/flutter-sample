import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/task_detail/widget.dart'
    show TemplateTaskDetail;
import 'package:gamer_reflection/components/pages/task_detail/fetch.dart'
    show useFetch;

/// ページ: タスク詳細
class PageTaskDetail extends HookWidget {
  const PageTaskDetail({
    super.key,
    required this.taskId,
  });
  final int taskId;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(taskId);

    return Scaffold(
      body: TemplateTaskDetail(
        taskId: taskId,
        reflection: d.reflection,
        updateReflection: d.updateReflection,
        dataFetchState: d.dataFetchState,
        todoExist: d.todoExist,
      ),
    );
  }
}
