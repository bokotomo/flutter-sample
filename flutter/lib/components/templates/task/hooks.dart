import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useEffect, useMemoized, useFuture;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;
import 'package:gamer_reflection/components/templates/task/filter.dart'
    show filteredMonth, getTagColor, getPriority, getHighPriorityIds;
import 'package:gamer_reflection/modules/strage/selected_period.dart'
    show selectedTaskPagePeriod;

class UseReturn {
  const UseReturn({
    required this.period,
    required this.filteredReflections,
    required this.onPressedAll,
    required this.onPressedThreeMonth,
    required this.onPressedMonth,
  });

  final Period period;
  final List<DomainReflection> filteredReflections;
  final void Function() onPressedAll;
  final void Function() onPressedThreeMonth;
  final void Function() onPressedMonth;
}

///
UseReturn useHooks(List<DomainReflection> reflections) {
  /// 選択している期間
  final Future<String?> memoedPeriod =
      useMemoized(() => selectedTaskPagePeriod.get());
  final AsyncSnapshot<String?> futuredPeriod = useFuture(memoedPeriod);

  /// 期間: 初期値は3ヶ月
  ValueNotifier<Period> period = useState<Period>(Period.threeMonth);

  /// フィルターされた振り返り一覧
  ValueNotifier<List<DomainReflection>> filteredReflections =
      useState<List<DomainReflection>>([]);

  /// 期間でフィルターされた一覧を取得
  List<DomainReflection> getFilteredReflections(Period p) {
    switch (p) {
      case Period.all:
        return reflections;
      case Period.threeMonth:
        return filteredMonth(3, reflections);
      case Period.oneMonth:
        return filteredMonth(1, reflections);
      default:
        return [];
    }
  }

  /// 振り返り一覧取得
  List<DomainReflection> adapterReflections(List<DomainReflection> domains) {
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
  void updateReflectionsByPeriodIndex(Period p) {
    period.value = p;

    final List<DomainReflection> filteredPeriodReflections =
        getFilteredReflections(p);
    filteredReflections.value = adapterReflections(filteredPeriodReflections);
  }

  /// 期間変更をクリック：全期間
  void onPressedAll() {
    updateReflectionsByPeriodIndex(Period.all);

    /// 端末に保存
    selectedTaskPagePeriod.save("period-all");
  }

  /// 期間変更をクリック：３ヶ月
  void onPressedThreeMonth() {
    updateReflectionsByPeriodIndex(Period.threeMonth);

    /// 端末に保存
    selectedTaskPagePeriod.save("period-three-month");
  }

  /// 期間変更をクリック：１ヶ月
  void onPressedMonth() {
    updateReflectionsByPeriodIndex(Period.oneMonth);

    /// 端末に保存
    selectedTaskPagePeriod.save("period-one-month");
  }

  /// 端末に保存されてる選択している期間を取得
  Period getPeriodBySVG(String kvsString) {
    switch (kvsString) {
      case "period-all":
        return Period.all;
      case "period-three-month":
        return Period.threeMonth;
      case "period-one-month":
        return Period.oneMonth;
      default:
        return Period.all;
    }
  }

  useEffect(() {
    if (futuredPeriod.data == null) return;
    Period p = getPeriodBySVG(futuredPeriod.data ?? "");
    period.value = p;

    /// データがなければ実行しない
    if (reflections.isEmpty) return;

    /// 初期値は３ヶ月でフィルターする
    updateReflectionsByPeriodIndex(p);
  }, [reflections, futuredPeriod]);

  return UseReturn(
    period: period.value,
    filteredReflections: filteredReflections.value,
    onPressedAll: onPressedAll,
    onPressedThreeMonth: onPressedThreeMonth,
    onPressedMonth: onPressedMonth,
  );
}
