import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection_added_list/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/components/templates/reflection_added_list/view.dart'
    show view;

/// テンプレート: 振り返りで追加した内容一覧
class TemplateReflectionAddedList extends HookWidget {
  const TemplateReflectionAddedList({
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
    final h = useHooks(context, reflections, groupId);

    return view(
      i18n,
      context,
      isSavePage,
      h.reflectionsOnPage,
      h.onWillPop,
      h.onClickRemove,
      h.onPressedReflectionDone,
    );
  }
}
