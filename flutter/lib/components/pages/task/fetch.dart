import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator, MaterialPageRoute;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;
import 'package:gamer_reflection/components/pages/task_detail/widget.dart'
    show PageTaskDetail;

class UseReturn {
  const UseReturn({
    required this.reflections,
    required this.pushTaskDetail,
  });

  final List<DomainReflection> reflections;
  final void Function(BuildContext, int) pushTaskDetail;
}

/// データ取得: タスク一覧
UseReturn useFetch(ValueNotifier<bool> canDC) {
  final ValueNotifier<List<DomainReflection>> reflections =
      useState<List<DomainReflection>>([]);

  /// データ取得
  Future<void> eventRepository() async {
    if (!canDC.value) return;
    final List<DomainReflection> r = await FetchReflection().fetchReflections();
    reflections.value = r;
  }

  /// タスク詳細ページへ移動
  void pushTaskDetail(BuildContext context, int taskId) {
    final PageTaskDetail page = PageTaskDetail(taskId: taskId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => page,
      ),
    ).then((v) {
      eventRepository();
    });
  }

  useEffect(() {
    canDC.addListener(eventRepository);
    eventRepository();
    return;
  }, []);

  return UseReturn(
    reflections: reflections.value,
    pushTaskDetail: pushTaskDetail,
  );
}
