import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/domain/todo/todo.dart' show DomainTodo;
import 'package:gamer_reflection/components/templates/todo/view.dart' show view;
import 'package:gamer_reflection/components/templates/todo/hooks.dart'
    show useHooks;

/// テンプレート: やることリスト
class TemplateTodo extends HookWidget {
  const TemplateTodo({
    super.key,
    required this.i18n,
    required this.reflectionGroups,
    required this.todos,
    required this.fetchTodos,
  });

  /// 言語
  final AppLocalizations i18n;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// やること一覧
  final List<DomainTodo> todos;

  /// やることを取得
  final Future<void> Function() fetchTodos;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(reflectionGroups, fetchTodos);

    return view(
      context,
      todos,
      reflectionGroups,
      hooks.onChangeReflectionGroup,
      hooks.onClickRemove,
    );
  }
}
