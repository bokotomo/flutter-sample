import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;

class UseReturn {
  const UseReturn({
    required this.reflections,
  });

  final List<DomainReflection> reflections;
}

/// データ取得: 振り返り追加
UseReturn useFetch() {
  ValueNotifier<List<DomainReflection>> reflections =
      useState<List<DomainReflection>>([]);

  /// データの取得
  Future<void> getData() async {
    final List<DomainReflection> r = await FetchReflection().fetchReflections();

    /// 大きい順にソート
    r.sort(((a, b) => b.count.compareTo(a.count)));

    reflections.value = r;
  }

  useEffect(() {
    getData();
    return;
  }, []);

  return UseReturn(
    reflections: reflections.value,
  );
}
