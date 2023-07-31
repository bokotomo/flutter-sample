import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/api/command/controller/todo.dart'
    show RequestTodo;

class UseReturn {
  const UseReturn({
    required this.onChangeReflectionGroup,
    required this.onClickRemove,
  });

  final void Function(String?) onChangeReflectionGroup;
  final void Function(int) onClickRemove;
}

/// ロジック: やることページ
UseReturn useHooks(
  List<DomainReflectionGroup> reflectionGroups,
  Future<void> Function() fetchTodos,
) {
  /// 振り返りグループ
  void onChangeReflectionGroup(String? id) async {
    String groupId = id ??
        (reflectionGroups.isEmpty ? "1" : reflectionGroups[0].id.toString());
    selectReflectionGroupId.save(groupId);

    await fetchTodos();
  }

  /// やることを削除
  Future<void> onClickRemove(int reflectionId) async {
    // 削除
    await RequestTodo().deleteTodo(reflectionId);

    // 更新
    await fetchTodos();
  }

  return UseReturn(
    onChangeReflectionGroup: onChangeReflectionGroup,
    onClickRemove: onClickRemove,
  );
}
