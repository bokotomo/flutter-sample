import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/modules/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/domain/todo/todo.dart' show DomainTodo;
import 'package:gamer_reflection/components/templates/todo/view.dart' show view;
import 'package:gamer_reflection/components/templates/todo/hooks.dart'
    show useHooks;

/// テンプレート: やることリスト
class TemplateTodo extends HookWidget {
  const TemplateTodo({
    super.key,
    required this.reflectionGroups,
    required this.todos,
  });

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// やること一覧
  final List<DomainTodo> todos;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(reflectionGroups);
    todos.forEach((e) {
      print(e.title);
    });

    return view(
      context,
      reflectionGroups,
      hooks.onChangeReflectionGroup,
    );
  }
}
