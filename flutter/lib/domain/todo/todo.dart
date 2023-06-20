/// ドメイン: やること
class DomainTodo {
  const DomainTodo({
    required this.reflectionId,
    required this.title,
    required this.subTitle,
  });

  /// 振り返りID
  final int reflectionId;

  /// タイトル
  final String title;

  /// サブタイトル
  final String subTitle;
}
