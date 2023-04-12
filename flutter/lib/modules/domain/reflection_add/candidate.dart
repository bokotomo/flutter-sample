/// ドメイン: 振り返り候補
class DomainCandidate {
  const DomainCandidate({
    required this.text,
    required this.count,
  });

  /// 振り返り内容
  final String text;

  /// 発生回数
  final int count;
}
