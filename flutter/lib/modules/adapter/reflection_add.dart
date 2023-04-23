import 'package:gamer_reflection/modules/domain/reflection_add/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/storage/rdb/model/reflection.dart'
    show ModelReflection;

/// Adapter Domain: ReflectionAdd
class AdapterDomainReflectionAddPage {
  /// 振り返り一覧取得
  List<DomainReflection> domainReflections(List<ModelReflection> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        return DomainReflection(
          id: m.id ?? 0,
          text: m.text,
          count: m.count,
        );
      },
    );

    return domain.toList();
  }
}
