import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/components/templates/task/filter.dart'
    show filteredMonth, getTagColor, getPriority, getHighPriorityIds;

class UseReturn {
  const UseReturn({
    required this.periodIndex,
    required this.filteredReflections,
    required this.changePeriodIndex,
  });

  final int periodIndex;
  final List<DomainReflection> filteredReflections;
  final void Function(int) changePeriodIndex;
}

///
UseReturn useHooks(List<DomainReflection> reflections) {
  ValueNotifier<int> periodIndex = useState<int>(1);
  ValueNotifier<List<DomainReflection>> filteredReflections =
      useState<List<DomainReflection>>([]);

  /// フィルターされた一覧を取得
  List<DomainReflection> getfilteredReflections(int index) {
    switch (index) {
      case 0:
        return reflections;
      case 1:
        return filteredMonth(3, reflections);
      case 2:
        return filteredMonth(1, reflections);
      default:
        return [];
    }
  }

  /// 振り返り一覧取得
  List<DomainReflection> domainReflections(List<DomainReflection> domains) {
    /// 大きい順にソート
    domains.sort(((a, b) => b.count.compareTo(a.count)));

    /// 重複しないCount一覧
    final List<int> countDistincts = getHighPriorityIds(domains);

    /// ドメインに変換
    final domain = domains.map(
      (e) {
        final priority = getPriority(countDistincts, e.count);

        return DomainReflection(
          id: e.id,
          text: e.text,
          detail: e.detail,
          count: e.count,
          reflectionType: ReflectionType.bad,
          priority: getPriority(countDistincts, e.count),
          tagColor: getTagColor(priority),
          updatedAt: e.updatedAt,
        );
      },
    );

    return domain.toList();
  }

  /// 期間変更をする。
  /// 振り返り一覧も更新される。
  void changePeriodIndex(int index) {
    periodIndex.value = index;

    final List<DomainReflection> filteredPeriodReflections =
        getfilteredReflections(index);
    filteredReflections.value = domainReflections(filteredPeriodReflections);
  }

  useEffect(() {
    if (reflections.isEmpty) return;

    /// 初期値は３ヶ月
    periodIndex.value = 1;
    changePeriodIndex(1);
  }, [reflections]);

  return UseReturn(
    periodIndex: periodIndex.value,
    filteredReflections: filteredReflections.value,
    changePeriodIndex: changePeriodIndex,
  );
}
