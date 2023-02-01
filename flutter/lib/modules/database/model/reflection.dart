/// Model: Reflection
class Reflection {
  const Reflection({
    required this.id,
    required this.text,
    required this.count,
    // required this.createdAt,
  });

  /// ID
  final int id;

  /// 振り返り内容
  final String text;

  /// 回数
  final int count;

  // /// 日付
  // final DateTime createdAt;
}
