import 'package:gamer_reflection/modules/domain/todo/todo.dart' show DomainTodo;
import 'package:gamer_reflection/storage/rdb/model/reflection.dart'
    show ModelReflection;

/// Adapter Domain: Todo
class AdapterTodo {
  /// やること一覧取得
  List<DomainTodo> domainTodos(List<ModelReflection> models) {
    /// ドメインに変換
    final domain = models.map(
      (m) {
        return DomainTodo(
          todoId: m.id ?? 0,
          title: m.detail,
          subTitle: m.text,
        );
      },
    );

    return domain.toList();
  }
}
