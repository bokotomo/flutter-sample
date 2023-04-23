import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection_add/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection_add.dart'
    show FetchReflectionAddPage;

class UseReturn {
  const UseReturn({
    required this.reflections,
    required this.fetchReflections,
  });

  final List<DomainReflection> reflections;
  final Future<void> Function() fetchReflections;
}

/// データ取得: 振り返り追加
UseReturn useFetch(int groupId) {
  final ValueNotifier<List<DomainReflection>> reflections =
      useState<List<DomainReflection>>([]);

  /// データの取得
  Future<void> fetch() async {
    final List<DomainReflection> r =
        await FetchReflectionAddPage().fetchReflections(groupId);

    /// 大きい順にソート
    r.sort(((a, b) => b.count.compareTo(a.count)));

    reflections.value = r;
  }

  /// 振り返りグループの更新
  Future<void> fetchReflections() async {
    fetch();
  }

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    reflections: reflections.value,
    fetchReflections: fetchReflections,
  );
}
