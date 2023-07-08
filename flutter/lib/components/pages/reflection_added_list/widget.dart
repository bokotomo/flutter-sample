import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection_added_list/widget.dart'
    show TemplateReflectionAddedList;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;

/// ページ: タスク一覧
class PageReflectionAddedList extends HookWidget {
  const PageReflectionAddedList({
    super.key,
    required this.i18n,
    required this.reflections,
    required this.groupId,
    required this.isSavePage,
  });

  /// 言語
  final AppLocalizations i18n;

  /// 振り返りの一覧
  final List<DomainReflectionAdded> reflections;

  /// 振り返りグループID
  final int groupId;

  /// todo: pageを分ける
  final bool isSavePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateReflectionAddedList(
        i18n: i18n,
        reflections: reflections,
        groupId: groupId,
        isSavePage: isSavePage,
      ),
    );
  }
}
