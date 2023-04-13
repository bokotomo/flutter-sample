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
import 'package:gamer_reflection/modules/storage/selected_period.dart'
    show selectedTaskPagePeriod;

class UseReturn {
  const UseReturn({
    required this.period,
    required this.filteredReflections,
    required this.isSelectedGood,
    required this.onPressedAll,
    required this.onPressedThreeMonth,
    required this.onPressedMonth,
    required this.onPressedBad,
    required this.onPressedGood,
  });

  final Period period;
  final List<DomainReflection> filteredReflections;
  final bool isSelectedGood;
  final void Function() onPressedAll;
  final void Function() onPressedThreeMonth;
  final void Function() onPressedMonth;
  final void Function() onPressedBad;
  final void Function() onPressedGood;
}

///
UseReturn useHooks(List<DomainReflection> reflections) {
  /// 期間: 初期値は3ヶ月
  final ValueNotifier<Period> period = useState<Period>(Period.threeMonth);

  /// 改善すること伸ばすことを選択
  final ValueNotifier<bool> isSelectedGood = useState<bool>(false);

  /// 選択している期間
  final Future<String?> memoedPeriod =
      useMemoized(() => selectedTaskPagePeriod.get(), [period.value]);
  final AsyncSnapshot<String?> futuredPeriod = useFuture(memoedPeriod);

  /// フィルターされた振り返り一覧
  final ValueNotifier<List<DomainReflection>> filteredReflections =
      useState<List<DomainReflection>>([]);

  /// 期間でフィルターされた一覧を取得
  List<DomainReflection> getFilteredReflections(
    Period p,
    List<DomainReflection> domains,
  ) {
    switch (p) {
      case Period.all:
        return domains;
      case Period.threeMonth:
        return filteredMonth(3, domains);
      case Period.oneMonth:
        return filteredMonth(1, domains);
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

  /// 振り返り一覧を更新
  void updateFilteredReflections(Period p, bool isGood) {
    /// 良かった悪かったでフィルターする
    final reflectionType = isGood ? ReflectionType.good : ReflectionType.bad;
    final List<DomainReflection> filteredReflectionTypeReflections =
        reflections.where((r) => r.reflectionType == reflectionType).toList();

    /// 期間でフィルターする
    final List<DomainReflection> filteredPeriodReflections =
        getFilteredReflections(p, filteredReflectionTypeReflections);
    filteredReflections.value = adapterReflections(filteredPeriodReflections);
  }

  /// 期間変更をクリック：全期間
  void onPressedAll() async {
    period.value = Period.all;
    updateFilteredReflections(Period.all, isSelectedGood.value);

    /// 端末に保存
    await selectedTaskPagePeriod.save("period-all");
  }

  /// 期間変更をクリック：3ヶ月
  void onPressedThreeMonth() async {
    period.value = Period.threeMonth;
    updateFilteredReflections(Period.threeMonth, isSelectedGood.value);

    /// 端末に保存
    await selectedTaskPagePeriod.save("period-three-month");
  }

  /// 期間変更をクリック：1ヶ月
  void onPressedMonth() async {
    period.value = Period.oneMonth;
    updateFilteredReflections(Period.oneMonth, isSelectedGood.value);

    /// 端末に保存
    await selectedTaskPagePeriod.save("period-one-month");
  }

  /// 改善することボタンを押した
  void onPressedBad() {
    isSelectedGood.value = false;
    updateFilteredReflections(period.value, false);
  }

  /// 伸ばすことボタンを押した
  void onPressedGood() {
    isSelectedGood.value = true;
    updateFilteredReflections(period.value, true);
  }

  /// 端末に保存されてる選択している期間を取得
  Period getPeriodByKVS(String kvsString) {
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
    Period p = getPeriodByKVS(futuredPeriod.data ?? "period-three-month");
    period.value = p;

    /// データがなければ実行しない
    if (reflections.isEmpty) return;

    /// 初期値は3ヶ月でフィルターする
    updateFilteredReflections(p, false);
  }, [reflections]);

  return UseReturn(
    period: period.value,
    filteredReflections: filteredReflections.value,
    isSelectedGood: isSelectedGood.value,
    onPressedAll: onPressedAll,
    onPressedThreeMonth: onPressedThreeMonth,
    onPressedMonth: onPressedMonth,
    onPressedBad: onPressedBad,
    onPressedGood: onPressedGood,
  );
}
