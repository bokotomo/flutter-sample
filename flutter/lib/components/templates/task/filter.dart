import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/modules/date/date.dart' show getMonthAgo;

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

/// 一覧からcountを取得し、重複なしで大きい順に返す
List<int> getHighPriorityIds(List<DomainReflection> domains) {
  /// カウントのみの配列
  final Iterable<int> counts = domains.map((e) => e.count);

  /// 重複を消す
  final List<int> countDistincts = counts.toSet().toList();

  countDistincts.sort(((a, b) => b.compareTo(a)));

  return countDistincts;
}

/// 期間でフィルターする
/// month: month以内の月でフィルターする
List<DomainReflection> filteredMonth(int month, List<DomainReflection> rs) {
  /// 現在からmonth前の日付を返す
  final DateTime monthAgo = getMonthAgo(DateTime.now(), month);
  return rs.where((e) => e.updatedAt.isAfter(monthAgo)).toList();
}

/// 3位まで優先度を返す
int getPriority(List<int> counts, int count) {
  final int length = counts.length;
  if (length > 0 && counts[0] == count) return 1;
  if (length > 1 && counts[1] == count) return 2;
  return 3;
}
