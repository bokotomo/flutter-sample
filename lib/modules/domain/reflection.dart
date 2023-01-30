/// ドメイン: 振り返り
class DomainReflection {
  DomainReflection({
    required this.id,
    required this.text,
    required this.createdAt,
  });

  /// ID
  int id;

  /// 振り返り内容
  String text;

  /// 日付
  DateTime createdAt;
}
