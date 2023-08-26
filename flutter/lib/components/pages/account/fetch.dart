import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/components/templates/account_setting/domain/reflection_group.dart'
    show DomainAccountSettingReflectionGroup;
import 'package:gamer_reflection/api/query/controller/account.dart'
    show FetchAccountPage;

class UseReturn {
  const UseReturn({
    required this.reflectionGroups,
    required this.fetchReflectionGroups,
  });

  final List<DomainAccountSettingReflectionGroup> reflectionGroups;
  final Future<void> Function() fetchReflectionGroups;
}

/// データ取得: 振り返りグループ一覧
UseReturn useFetch() {
  final ValueNotifier<List<DomainAccountSettingReflectionGroup>>
      reflectionGroups =
      useState<List<DomainAccountSettingReflectionGroup>>([]);

  /// データ取得
  Future<void> fetch() async {
    final List<DomainAccountSettingReflectionGroup> r =
        await FetchAccountPage().fetchReflectionGroups();
    reflectionGroups.value = r;
  }

  /// 振り返りグループの更新
  Future<void> fetchReflectionGroups() async {
    fetch();
  }

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    reflectionGroups: reflectionGroups.value,
    fetchReflectionGroups: fetchReflectionGroups,
  );
}
