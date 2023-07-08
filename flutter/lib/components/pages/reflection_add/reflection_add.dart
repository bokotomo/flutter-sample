import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection_add/widget.dart'
    show TemplateReflectionAdd;
import 'package:gamer_reflection/components/pages/reflection_add/fetch.dart'
    show useFetch;

/// ページ: 振り返りの追加
class PageReflectionAdd extends HookWidget {
  const PageReflectionAdd({
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
      body: TemplateReflectionAdd(
        i18n: i18n,
        title: title,
        groupId: groupId,
        reflections: d.reflections,
        addedReflectionsFromOtherPage: d.addedReflectionsFromOtherPage,
        pushReflectionAddedList: d.pushReflectionAddedList,
      ),
    );
  }
}
