import 'package:gamer_reflection/modules/domain/task/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/storage/rdb/model/reflection.dart'
    show ModelReflection;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;

/// Adapter Domain: Reflection
class AdapterDomainTaskPage {
  /// 振り返り一覧取得
  List<DomainReflection> domainReflections(List<ModelReflection> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        return DomainReflection(
          id: m.id ?? 0,
          text: m.text,
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
}
