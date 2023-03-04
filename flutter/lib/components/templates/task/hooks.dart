import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

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

  /// 期間変更
  void changePeriodIndex(int index) {
    periodIndex.value = index;

    switch (index) {
      case 0:
        filteredReflections.value = reflections;
        return;
      case 1:
        filteredReflections.value = filteredMonth(3);
        return;
      case 2:
        filteredReflections.value = filteredMonth(1);
        return;
    }
  }

  useEffect(() {
    if (reflections.isEmpty) return;

    periodIndex.value = 1;
    changePeriodIndex(1);
  }, [reflections]);

  return UseReturn(
    periodIndex: periodIndex.value,
    filteredReflections: filteredReflections.value,
    changePeriodIndex: changePeriodIndex,
  );
}
