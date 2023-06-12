/// ドメイン: やること
class DomainTodo {
  const DomainTodo({
    required this.todoId,
    required this.title,
    required this.subTitle,
  });

  /// やることID
  final int todoId;

  /// タイトル
  final String title;

  /// サブタイトル
  final String subTitle;
}
