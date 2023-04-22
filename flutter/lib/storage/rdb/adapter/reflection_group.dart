import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/storage/rdb/model/reflection_group.dart'
    show ModelReflectionGroup;

/// Adapter Domain: ReflectionGroup
class AdapterReflectionGroup {
  /// 振り返りグループ一覧取得
  List<DomainReflectionGroup> domainReflectionGroups(
      List<ModelReflectionGroup> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        return DomainReflectionGroup(
          id: m.id ?? 0,
          name: m.name,
        );
      },
    );

    return domain.toList();
  }
}
