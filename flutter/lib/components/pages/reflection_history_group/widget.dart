import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection_history_group/widget.dart'
    show TemplateReflectionHistoryGroup;
import 'package:gamer_reflection/components/pages/reflection_history_group/fetch.dart'
    show useFetch;

/// ページ: 振り返り履歴グループ一覧
class PageReflectionHistoryGroup extends HookWidget {
  const PageReflectionHistoryGroup({
    super.key,
    required this.i18n,
    required this.title,
    required this.groupId,
  });

  /// 言語
  final AppLocalizations i18n;
  final String title;
  final int groupId;

  @override
  Widget build(BuildContext context) {
    final d = useFetch(groupId, i18n);

    return Scaffold(
      body: TemplateReflectionHistoryGroup(
        i18n: i18n,
        historyGroups: d.historyGroups,
        pushDetail: d.pushDetail,
        title: title,
      ),
    );
  }
}
