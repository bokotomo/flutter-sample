/// ドメイン: 振り返り追加 振り返り
class DomainReflectionHistory {
  const DomainReflectionHistory({
    this.id,
    required this.reflectionGroupId,
    required this.isGood,
    required this.text,
    required this.count,
    required this.date,
  });

  /// ID
  final int? id;

  /// GROUP_ID
  final int reflectionGroupId;

  /// 振り返りの種類
  final bool isGood;

  /// 振り返り内容
  final String text;

  /// 回数
  final int count;

  /// 追加日
  final DateTime date;
}
