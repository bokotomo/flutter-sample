import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/database/model/reflection.dart'
    show ModelReflection;

/// Adapter Domain: Reflection
class AdapterReflection {
  /// countを重複なしで大きい順に返す
  List<int> getHighPriorityIds(List<ModelReflection> models) {
    final counts = models.map((e) => e.count);
    final countDistincts = counts.toSet().toList();
    countDistincts.sort(((a, b) => b.compareTo(a)));
    return countDistincts;
  }

  /// 3位まで優先度を返す
  int getPriority(List<int> counts, int count) {
    final size = counts.length;
    if (size > 0 && counts[0] == count) return 1;
    if (size > 1 && counts[1] == count) return 2;
    return 3;
  }

  /// 振り返り一覧取得
  List<DomainReflection> domainReflections(List<ModelReflection> models) {
    /// 大きい順にソート
    models.sort(((a, b) => b.count.compareTo(a.count)));

    /// 重複しないCount一覧
    final countDistincts = getHighPriorityIds(models);

    /// ドメインに変換
    final domain = models.map(
      (e) => DomainReflection(
        id: e.id ?? 0,
        text: e.text,
        detail: e.detail,
        count: e.count,
        reflectionType: ReflectionType.bad,
        priority: getPriority(countDistincts, e.count),
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
      priority: 1,
      createdAt: DateTime.now(),
    );
  }
}
