import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/domain/todo/todo.dart' show DomainTodo;
import 'package:gamer_reflection/modules/fetch/todo.dart' show FetchTodoPage;
import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.reflectionGroups,
    required this.todos,
    required this.fetchTodos,
  });

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// やること一覧
  final List<DomainTodo> todos;

  /// 取得
  final Future<void> Function() fetchTodos;
}

/// データ取得: タスク一覧
UseReturn useFetch() {
  final ValueNotifier<List<DomainReflectionGroup>> reflectionGroups =
      useState<List<DomainReflectionGroup>>([]);
  final ValueNotifier<List<DomainTodo>> todos = useState<List<DomainTodo>>([]);

  /// 振り返りグループIDの取得
  int getReflectionGroupId(String? id) {
    if (id != null) return int.parse(id);
    return reflectionGroups.value.isEmpty ? 1 : reflectionGroups.value[0].id;
  }

  /// データ取得
  Future<void> fetch() async {
    final String? id = await selectReflectionGroupId.get();
    final int groupId = getReflectionGroupId(id);

    final List<DomainReflectionGroup> rg =
        await FetchTodoPage().fetchReflectionGroups();
    reflectionGroups.value = rg;

    final List<DomainTodo> tds = await FetchTodoPage().fetchTodos(groupId);
    todos.value = tds;
  }

  /// やることリスト取得
  Future<void> fetchTodos() async {
    fetch();
  }

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    reflectionGroups: reflectionGroups.value,
    todos: todos.value,
    fetchTodos: fetchTodos,
  );
}