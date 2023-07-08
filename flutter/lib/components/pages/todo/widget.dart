import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/todo/widget.dart'
    show TemplateTodo;
import 'package:gamer_reflection/components/pages/todo/fetch.dart'
    show useFetch;

/// ページ: タスク一覧
class PageTodo extends HookWidget {
  const PageTodo({
    super.key,
    required this.i18n,
  });

  /// 言語
  final AppLocalizations i18n;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(i18n);

    return Scaffold(
      body: TemplateTodo(
        i18n: i18n,
        reflectionGroups: d.reflectionGroups,
        pushSolutionDetail: d.pushSolutionDetail,
        todos: d.todos,
        fetchTodos: d.fetchTodos,
      ),
    );
  }
}
