import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator, MaterialPageRoute;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/fetch/task.dart' show FetchTaskPage;
import 'package:gamer_reflection/components/pages/task_detail/widget.dart'
    show PageTaskDetail;
import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.reflections,
    required this.reflectionGroups,
    required this.pushTaskDetail,
    required this.fetchReflections,
  });

  final List<DomainReflection> reflections;
  final Future<void> Function() fetchReflections;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;
  final void Function(BuildContext, int) pushTaskDetail;
}

/// データ取得: タスク一覧
UseReturn useFetch(ValueNotifier<bool> canDC) {
  final ValueNotifier<List<DomainReflection>> reflections =
      useState<List<DomainReflection>>([]);
  final ValueNotifier<List<DomainReflectionGroup>> reflectionGroups =
      useState<List<DomainReflectionGroup>>([]);

  /// 振り返りグループIDの取得
  int getReflectionGroupId(String? id) {
    if (id != null) return int.parse(id);
    return reflectionGroups.value.isEmpty ? 1 : reflectionGroups.value[0].id;
  }

  /// データ取得
  Future<void> fetch() async {
    if (!canDC.value) return;

    final String? id = await selectReflectionGroupId.get();
    final int groupId = getReflectionGroupId(id);

    final List<DomainReflection> r =
        await FetchTaskPage().fetchReflections(groupId);
    reflections.value = r;

    final List<DomainReflectionGroup> rg =
        await FetchTaskPage().fetchReflectionGroups();
    reflectionGroups.value = rg;
  }

  /// タスク詳細ページへ移動
  void pushTaskDetail(BuildContext context, int taskId) {
    final PageTaskDetail page = PageTaskDetail(taskId: taskId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => page,
      ),
    ).then(
      (v) {
        fetch();
      },
    );
  }

  /// 振り返りグループの更新
  Future<void> fetchReflections() async {
    fetch();
  }

  useEffect(() {
    canDC.addListener(fetch);
    fetch();
    return;
  }, []);

  return UseReturn(
    reflections: reflections.value,
    reflectionGroups: reflectionGroups.value,
    pushTaskDetail: pushTaskDetail,
    fetchReflections: fetchReflections,
  );
}
