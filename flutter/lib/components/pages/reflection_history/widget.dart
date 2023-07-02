import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_history/widget.dart'
    show TemplateReflectionHistory;
import 'package:gamer_reflection/components/pages/reflection_history/fetch.dart'
    show useFetch;

/// ページ: 振り返り履歴グループ詳細
class PageReflectionHistory extends HookWidget {
  const PageReflectionHistory({
    super.key,
    required this.historyGroupId,
    required this.title,
  });
  final int historyGroupId;
  final String title;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(historyGroupId);

    return Scaffold(
      body: TemplateReflectionHistory(
        historys: d.historys,
        title: title,
      ),
    );
  }
}
