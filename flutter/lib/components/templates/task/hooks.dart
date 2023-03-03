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
  ValueNotifier<int> periodIndex = useState<int>(0);
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

  /// 期間変更
  void changePeriodIndex(int index) async {
    periodIndex.value = index;
    switch (index) {
      case 0:
        filteredReflections.value = reflections;
        return;
      case 1:
        final DateTime threeMonthAgo = getMonthAgo(DateTime.now(), 3);
        filteredReflections.value = reflections
            .where((e) => e.updatedAt.isAfter(threeMonthAgo))
            .toList();
        return;
      case 2:
        final DateTime oneMonthAgo = getMonthAgo(DateTime.now(), 1);
        filteredReflections.value =
            reflections.where((e) => e.updatedAt.isAfter(oneMonthAgo)).toList();
        return;
    }
  }

  useEffect(() {
    if (reflections.isEmpty) return;
    filteredReflections.value = reflections;
  }, [reflections]);

  return UseReturn(
    periodIndex: periodIndex.value,
    filteredReflections: filteredReflections.value,
    changePeriodIndex: changePeriodIndex,
  );
}
