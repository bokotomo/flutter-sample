import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/account_setting/widget.dart'
    show TemplateAccountSetting;
import 'package:gamer_reflection/components/pages/account/fetch.dart'
    show useFetch;

/// ページ: アカウント設定
class PageAccountSetting extends HookWidget {
  const PageAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final d = useFetch();

    return Scaffold(
      body: TemplateAccountSetting(
        reflectionGroups: d.reflectionGroups,
        fetchReflectionGroups: d.fetchReflectionGroups,
      ),
    );
  }
}
