import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/account_setting/account_setting.dart'
    show TemplateAccountSetting;

/// ページ: アカウント設定
class PageAccountSetting extends StatefulWidget {
  const PageAccountSetting({super.key});

  @override
  State<PageAccountSetting> createState() => _PageAccountSettingState();
}

/// _PageAccountSettingState
class _PageAccountSettingState extends State<PageAccountSetting> {
  @override
  void initState() {
    print("アカウント設定");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TemplateAccountSetting(),
    );
  }
}
