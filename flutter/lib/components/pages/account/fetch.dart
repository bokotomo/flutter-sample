import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/fetch/reflection_group.dart'
    show FetchReflectionGroup;

class UseReturn {
  const UseReturn({
    required this.reflectionGroups,
  });

  final List<DomainReflectionGroup> reflectionGroups;
}

/// データ取得: 振り返りグループ一覧
UseReturn useFetch() {
  final ValueNotifier<List<DomainReflectionGroup>> reflectionGroups =
      useState<List<DomainReflectionGroup>>([]);

  /// データ取得
  Future<void> fetch() async {
    final List<DomainReflectionGroup> r =
        await FetchReflectionGroup().fetchReflectionGroups();
    reflectionGroups.value = r;
  }

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    reflectionGroups: reflectionGroups.value,
  );
}
