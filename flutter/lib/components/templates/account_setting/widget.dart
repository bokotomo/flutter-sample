import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/account_setting/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/account_setting/view.dart'
    show view;

/// テンプレート: アカウント設定
class TemplateAccountSetting extends HookWidget {
  const TemplateAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return view(
      context,
      hooks.onPressedEdit,
      hooks.textReflectionName,
      hooks.textReflectionNameFocusNode,
      hooks.textReflectionNewName,
      hooks.textReflectionNewNameFocusNode,
    );
  }
}
