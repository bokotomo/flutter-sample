import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/task/task.dart' as task;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show fetchReflections;
import 'package:sqflite/sqflite.dart';

/// ページ: タスク一覧
class PageTask extends StatefulWidget {
  const PageTask({super.key, required this.dc});
  final ValueNotifier<Database?> dc;

  @override
  State<PageTask> createState() => _PageTaskState();
}

/// _PageTaskState
class _PageTaskState extends State<PageTask> {
  List<DomainReflection> reflections = [];

  Future<void> eventRepository() async {
    if (widget.dc.value == null) return;
    final r = await fetchReflections();

    setState(() {
      reflections = r;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.dc.addListener(eventRepository);
    eventRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: task.TemplateTask(
        reflections: reflections,
      ),
    );
  }
}
