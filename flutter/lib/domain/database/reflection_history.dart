/// ドメイン: 振り返り追加 振り返り
class DomainReflectionHistory {
  const DomainReflectionHistory({
    this.id,
    required this.reflectionHistoryGroupId,
    required this.isGood,
    required this.text,
    required this.count,
  });

  /// ID
  final int? id;

  /// GROUP_ID
  final int reflectionHistoryGroupId;

  /// 振り返りの種類
  final bool isGood;

  /// 振り返り内容
  final String text;

  /// 回数
  final int count;
}
