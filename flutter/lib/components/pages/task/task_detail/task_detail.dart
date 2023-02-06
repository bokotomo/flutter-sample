import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/task_detail/task_detail.dart'
    show TemplateTaskDetail;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;

/// ページ: タスク詳細
class PageTaskDetail extends StatefulWidget {
  const PageTaskDetail({super.key, required this.taskId});
  final int taskId;

  @override
  State<PageTaskDetail> createState() => _PageTaskDetailState();
}

/// _PageTaskDetailState
class _PageTaskDetailState extends State<PageTaskDetail> {
  DomainReflection? reflection;

  Future<void> eventRepository() async {
    final r = await FetchReflection().fetchReflectionById(widget.taskId);

    setState(() {
      reflection = r;
    });
  }

  Future<void> updateReflection() async {
    await eventRepository();
  }

  @override
  void initState() {
    print("タスク詳細 ${widget.taskId}");
    eventRepository();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateTaskDetail(
        taskId: widget.taskId,
        reflection: reflection,
        updateReflection: updateReflection,
      ),
    );
  }
}
