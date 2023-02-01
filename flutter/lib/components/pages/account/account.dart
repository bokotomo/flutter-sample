import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gamer_reflection/components/templates/account_setting/account_setting.dart'
    as account_setting;

/// ページ: アカウント設定
class PageAccountSetting extends StatefulWidget {
  const PageAccountSetting({super.key, required this.db});
  final Future<Database> db;

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
      body: account_setting.TemplateAccountSetting(),
    );
  }
}
