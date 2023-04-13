import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;

/// Adapter Domain: Reflection
class AdapterReflection {
  /// 振り返り一覧取得
  List<DomainReflection> domainReflections(List<ModelReflection> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        return DomainReflection(
          id: m.id ?? 0,
          text: m.text,
          detail: m.detail,
          count: m.count,
          reflectionType:
              m.reflectionType == 1 ? ReflectionType.good : ReflectionType.bad,
          priority: 1,
          tagColor: TagTextColor.gray,
          updatedAt: m.updatedAt,
        );
      },
    );

    return domain.toList();
  }

  /// 振り返り詳細取得
  DomainReflection domainReflection(ModelReflection model) {
    final reflectionType =
        model.reflectionType == 1 ? ReflectionType.good : ReflectionType.bad;
    return DomainReflection(
      id: model.id ?? 0,
      text: model.text,
      detail: model.detail,
      count: model.count,
      reflectionType: reflectionType,
      priority: 0,
      tagColor: TagTextColor.gray,
      updatedAt: model.updatedAt,
    );
  }
}
