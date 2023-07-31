import 'package:gamer_reflection/domain/reflection_history_group/reflection_history_group.dart'
    show DomainReflectionHistoryGroup;
import 'package:gamer_reflection/storage/rdb/model/reflection_history_group.dart'
    show ModelReflectionHistoryGroup;

/// Adapter Domain: ReflectionHistoryGroup
class AdapterReflectionHistoryGroup {
  /// 振り返り履歴グループ一覧取得
  List<DomainReflectionHistoryGroup> domainReflectionHistoryGroups(
      List<ModelReflectionHistoryGroup> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        return DomainReflectionHistoryGroup(
          id: m.id ?? 0,
          date: m.date,
        );
      },
    );

    return domain.toList();
  }
}
