import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/templates/account_setting/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/account_setting/view.dart'
    show view;

/// テンプレート: アカウント設定
class TemplateAccountSetting extends HookWidget {
  const TemplateAccountSetting({
    super.key,
    required this.reflectionGroups,
  });

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(reflectionGroups);

    return view(
      context,
      reflectionGroups,
      hooks.onPressedEdit,
      hooks.onPressedNewName,
      hooks.textReflectionName,
      hooks.textReflectionNameFocusNode,
      hooks.textReflectionNewName,
      hooks.textReflectionNewNameFocusNode,
      hooks.formKeyNewName,
      hooks.formKeyEditName,
    );
  }
}
