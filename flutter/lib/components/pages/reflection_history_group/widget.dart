import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_history_group/widget.dart'
    show TemplateReflectionHistoryGroup;
import 'package:gamer_reflection/components/pages/reflection_history_group/fetch.dart'
    show useFetch;

/// ページ: 振り返り履歴グループ一覧
class PageReflectionHistoryGroup extends HookWidget {
  const PageReflectionHistoryGroup({
    super.key,
    required this.groupId,
  });

  final int groupId;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(groupId);

    return Scaffold(
      body: TemplateReflectionHistoryGroup(
        historyGroups: d.historyGroups,
        pushDetail: d.pushDetail,
      ),
    );
  }
}
