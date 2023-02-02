import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection;

/// Adapter Domain: Reflection
class AdapterReflection {
  /// 振り返り一覧取得
  List<DomainReflection> domainReflections(List<ModelReflection> models) {
    final domain = models.map(
      (e) => DomainReflection(
        id: e.id ?? 0,
        text: e.text,
        detail: e.detail,
        count: e.count,
        reflectionType: ReflectionType.bad,
        createdAt: DateTime.now(),
      ),
    );
    return domain.toList();
  }

  /// 振り返り取得
  DomainReflection domainReflection(ModelReflection model) {
    return DomainReflection(
      id: model.id ?? 0,
      text: model.text,
      detail: model.detail,
      count: model.count,
      reflectionType: ReflectionType.bad,
      createdAt: DateTime.now(),
    );
  }
}
