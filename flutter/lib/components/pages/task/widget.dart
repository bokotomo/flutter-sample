import 'package:flutter/material.dart'
    show Widget, BuildContext, Scaffold, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/task/widget.dart'
    show TemplateTask;
import 'package:gamer_reflection/components/pages/task/fetch.dart'
    show useFetch;

/// ページ: タスク一覧
class PageTask extends HookWidget {
  const PageTask({
    super.key,
    required this.canDC,
  });
  final ValueNotifier<bool> canDC;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(canDC);

    return Scaffold(
      body: TemplateTask(
        reflections: d.reflections,
        reflectionGroups: d.reflectionGroups,
        pushTaskDetail: d.pushTaskDetail,
        fetchReflections: d.fetchReflections,
      ),
    );
  }
}
