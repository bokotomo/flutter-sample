import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/task/task.dart' as task;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;
import 'package:gamer_reflection/components/pages/task/task_detail/task_detail.dart'
    show PageTaskDetail;

/// ページ: タスク一覧
class PageTask extends StatefulWidget {
  const PageTask({super.key, required this.canDC});
  final ValueNotifier<bool> canDC;

  @override
  State<PageTask> createState() => _PageTaskState();
}

/// _PageTaskState
class _PageTaskState extends State<PageTask> {
  List<DomainReflection> reflections = [];

  /// タスク詳細ページへ移動
  void pushTaskDetail(BuildContext context, int taskId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageTaskDetail(taskId: taskId),
      ),
    ).then((v) {
      eventRepository();
    });
  }

  /// データ取得
  Future<void> eventRepository() async {
    if (!widget.canDC.value) return;
    final r = await FetchReflection().fetchReflections();

    setState(() {
      reflections = r;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.canDC.addListener(eventRepository);
    eventRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: task.TemplateTask(
        reflections: reflections,
        pushTaskDetail: pushTaskDetail,
      ),
    );
  }
}
