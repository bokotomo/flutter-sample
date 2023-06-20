import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useEffect, useMemoized, useFuture;
import 'package:gamer_reflection/domain/task/reflection.dart'
    show DomainTaskReflection;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/components/common/molecules/button_period_filter/type.dart'
    show Period;
import 'package:gamer_reflection/components/templates/task/filter.dart'
    show
        getFilteredPeriod,
        getFilteredReflectionType,
        getTagColor,
        getPriority,
        getHighPriorityIds;
import 'package:gamer_reflection/storage/kvs/selected_period.dart'
    show selectedTaskPagePeriod;
import 'package:gamer_reflection/storage/kvs/selected_reflection_type.dart'
    show selectReflectionType;
import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

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
    required this.onChangeReflectionGroup,
  });

  final Period period;
  final List<DomainTaskReflection> filteredReflections;
  final bool isSelectedGood;
  final void Function() onPressedAll;
  final void Function() onPressedThreeMonth;
  final void Function() onPressedMonth;
  final void Function() onPressedBad;
  final void Function() onPressedGood;
  final void Function(String?) onChangeReflectionGroup;
}

///
UseReturn useHooks(
  List<DomainTaskReflection> reflections,
  List<DomainReflectionGroup> reflectionGroups,
  Future<void> Function() fetchReflections,
) {
  /// 期間: 初期値は3ヶ月
  final ValueNotifier<Period> period = useState<Period>(Period.threeMonth);

  /// 改善すること伸ばすことを選択
  final ValueNotifier<bool> isSelectedGood = useState<bool>(false);

  /// 選択している期間
  final Future<String?> memoedPeriod =
      useMemoized(() => selectedTaskPagePeriod.get(), [period.value]);
  final AsyncSnapshot<String?> futuredPeriod = useFuture(memoedPeriod);

  /// 選択している振り返り種類
  final Future<String?> memoedReflectionType =
      useMemoized(() => selectReflectionType.get(), [isSelectedGood.value]);
  final AsyncSnapshot<String?> futuredReflectionType =
      useFuture(memoedReflectionType);

  /// フィルターされた振り返り一覧
  final ValueNotifier<List<DomainTaskReflection>> filteredReflections =
      useState<List<DomainTaskReflection>>([]);

  /// 振り返り一覧取得
  List<DomainTaskReflection> adapterReflections(
      List<DomainTaskReflection> domains) {
    /// 大きい順にソート
    domains.sort(((a, b) => b.count.compareTo(a.count)));

    /// 重複しないCount一覧
    final List<int> countDistincts = getHighPriorityIds(domains);

    /// ドメインに変換
    final domain = domains.map(
      (e) {
        final priority = getPriority(countDistincts, e.count);

        return DomainTaskReflection(
          id: e.id,
          text: e.text,
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
    final List<DomainTaskReflection> filteredReflectionTypeReflections =
        getFilteredReflectionType(reflections, reflectionType);

    /// 期間でフィルターする
    final List<DomainTaskReflection> filteredPeriodReflections =
        getFilteredPeriod(p, filteredReflectionTypeReflections);
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
  void onPressedBad() async {
    isSelectedGood.value = false;
    updateFilteredReflections(period.value, false);

    /// 端末に保存
    await selectReflectionType.save("bad");
  }

  /// 伸ばすことボタンを押した
  void onPressedGood() async {
    isSelectedGood.value = true;
    updateFilteredReflections(period.value, true);

    /// 端末に保存
    await selectReflectionType.save("good");
  }

  /// 振り返りグループ
  void onChangeReflectionGroup(String? id) {
    String groupId = id ??
        (reflectionGroups.isEmpty ? "1" : reflectionGroups[0].id.toString());
    selectReflectionGroupId.save(groupId);

    fetchReflections();
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
    if (futuredReflectionType.data == null) return;

    /// ローカルデータ: 選択期間
    final Period kvsPeriod =
        getPeriodByKVS(futuredPeriod.data ?? "period-three-month");
    period.value = kvsPeriod;

    /// ローカルデータ: 振り返り種類
    final String kvsReflectionType = futuredReflectionType.data ?? "bad";
    final bool isGood = kvsReflectionType == "good";
    isSelectedGood.value = isGood;

    /// 初期値は「3ヶ月,改善点」でフィルターする
    updateFilteredReflections(kvsPeriod, isGood);
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
    onChangeReflectionGroup: onChangeReflectionGroup,
  );
}
