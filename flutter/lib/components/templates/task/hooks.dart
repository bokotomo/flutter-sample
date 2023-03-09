import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

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

  /// month前の日付を返す
  DateTime getMonthAgo(DateTime d, int month) {
    return DateTime(
      d.year,
      d.month,

      /// デバックのため日付にする。debug
      d.day - month,
      d.hour,
      d.minute,
      d.second,
      d.millisecond,
    );
  }

  /// 期間でフィルターする
  List<DomainReflection> filteredMonth(int month) {
    final DateTime monthAgo = getMonthAgo(DateTime.now(), month);
    return reflections.where((e) => e.updatedAt.isAfter(monthAgo)).toList();
  }

  /// フィルターされた一覧を取得
  List<DomainReflection> getfilteredReflections(int index) {
    switch (index) {
      case 0:
        return reflections;
      case 1:
        return filteredMonth(3);
      case 2:
        return filteredMonth(1);
      default:
        return [];
    }
  }

  /// 優先度からTagの色を返す
  TagTextColor getTagColor(int priority) {
    switch (priority) {
      case 1:
        return TagTextColor.red;
      case 2:
        return TagTextColor.purple;
      default:
        return TagTextColor.blue;
    }
  }

  /// countを重複なしで大きい順に返す
  List<int> getHighPriorityIds(List<DomainReflection> domains) {
    final Iterable<int> counts = domains.map((e) => e.count);
    final List<int> countDistincts = counts.toSet().toList();
    countDistincts.sort(((a, b) => b.compareTo(a)));
    return countDistincts;
  }

  /// 3位まで優先度を返す
  int getPriority(List<int> counts, int count) {
    final int size = counts.length;
    if (size > 0 && counts[0] == count) return 1;
    if (size > 1 && counts[1] == count) return 2;
    return 3;
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

  /// 期間変更
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
