import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/components/templates/task/task.dart'
    show TemplateTask;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;
import 'package:gamer_reflection/components/pages/task/task_detail/task_detail.dart'
    show PageTaskDetail;

/// ページ: タスク一覧
class PageTask extends HookWidget {
  const PageTask({
    super.key,
    required this.canDC,
  });
  final ValueNotifier<bool> canDC;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<DomainReflection>> reflections =
        useState<List<DomainReflection>>([]);

    /// データ取得
    Future<void> eventRepository() async {
      if (!canDC.value) return;
      final r = await FetchReflection().fetchReflections();
      reflections.value = r;
    }

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

    useEffect(() {
      canDC.addListener(eventRepository);
      eventRepository();
    }, []);

    return Scaffold(
      body: TemplateTask(
        reflections: reflections.value,
        pushTaskDetail: pushTaskDetail,
      ),
    );
  }
}
