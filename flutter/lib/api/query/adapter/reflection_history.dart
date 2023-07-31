import 'package:gamer_reflection/domain/reflection_history/reflection_history.dart'
    show DomainReflectionHistory;
import 'package:gamer_reflection/storage/rdb/model/reflection_history.dart'
    show ModelReflectionHistory;

/// Adapter Domain: ReflectionHistory
class AdapterReflectionHistory {
  /// 振り返り履歴一覧取得
  List<DomainReflectionHistory> domainReflectionHistorys(
      List<ModelReflectionHistory> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        return DomainReflectionHistory(
          id: m.id ?? 0,
          text: m.text,
          count: m.count,
        );
      },
    );

    return domain.toList();
  }
}
