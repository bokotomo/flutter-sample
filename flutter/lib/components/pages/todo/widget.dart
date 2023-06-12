import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/todo/widget.dart'
    show TemplateTodo;
import 'package:gamer_reflection/components/pages/todo/fetch.dart'
    show useFetch;

/// ページ: タスク一覧
class PageTodo extends HookWidget {
  const PageTodo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final d = useFetch();

    return Scaffold(
      body: TemplateTodo(
        reflectionGroups: d.reflectionGroups,
        todos: d.todos,
        fetchTodos: d.fetchTodos,
      ),
    );
  }
}
