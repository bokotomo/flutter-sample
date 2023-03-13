import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/account_setting/account_setting.dart'
    show TemplateAccountSetting;

/// ページ: アカウント設定
class PageAccountSetting extends HookWidget {
  const PageAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TemplateAccountSetting(),
    );
  }
}
