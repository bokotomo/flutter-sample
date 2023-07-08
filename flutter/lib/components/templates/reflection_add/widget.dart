import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/templates/reflection_add/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/domain/reflection_add/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/components/templates/reflection_add/view.dart'
    show view;

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends HookWidget {
  const TemplateReflectionAdd({
    super.key,
    required this.i18n,
    required this.reflections,
    required this.title,
    required this.groupId,
    required this.addedReflectionsFromOtherPage,
    required this.pushReflectionAddedList,
  });

  /// 言語
  final AppLocalizations i18n;

  /// 振り返りの一覧
  final List<DomainReflectionAddReflection> reflections;

  /// 追加した振り返り一覧
  final List<DomainReflectionAdded> addedReflectionsFromOtherPage;

  /// タイトル
  final String title;

  /// 振り返りグループID
  final int groupId;

  /// 追加した振り返り一覧ページへ移動
  final Function(BuildContext, bool, List<DomainReflectionAdded>)
      pushReflectionAddedList;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(
      i18n,
      context,
      reflections,
      addedReflectionsFromOtherPage,
      groupId,
      pushReflectionAddedList,
    );

    return view(
      i18n,
      context,
      reflections,
      title,
      hooks.badgeNumForListener,
      hooks.textFieldFocusNode,
      hooks.formKey,
      hooks.textReflection,
      hooks.onPressedAddReflection,
      hooks.onPressedAddCandidate,
      hooks.onPressedReflectionDone,
      hooks.onPressedRemoveText,
      hooks.onChangeTextReflection,
      hooks.onClickRightMenu,
      hooks.candidatesForListener,
      hooks.onWillPop,
    );
  }
}
