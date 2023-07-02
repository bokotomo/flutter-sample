import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/templates/account_setting/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/account_setting/view.dart'
    show view;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

/// テンプレート: アカウント設定
class TemplateAccountSetting extends HookWidget {
  const TemplateAccountSetting({
    super.key,
    required this.changeLocale,
    required this.reflectionGroups,
    required this.fetchReflectionGroups,
  });

  /// 言語を変更する
  final void Function(LocaleCode) changeLocale;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  ///
  final Future<void> Function() fetchReflectionGroups;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(
      context,
      reflectionGroups,
      fetchReflectionGroups,
    );

    return view(
      context,
      changeLocale,
      reflectionGroups,
      hooks.onPressedEdit,
      hooks.onPressedDelete,
      hooks.onPressedNewName,
      hooks.onChangeReflectionGroup,
      hooks.textReflectionName,
      hooks.textReflectionNameFocusNode,
      hooks.textReflectionNewName,
      hooks.textReflectionNewNameFocusNode,
      hooks.formKeyNewName,
      hooks.formKeyEditName,
    );
  }
}
