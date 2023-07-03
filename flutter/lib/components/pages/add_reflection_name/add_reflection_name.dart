import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/add_reflection_name/widget.dart'
    show TemplateAddReflectionName;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

/// ページ: 新規振り返りグループ名追加
class PageAddReflectionName extends HookWidget {
  const PageAddReflectionName({
    super.key,
    required this.changeLocale,
    required this.changeTabPage,
  });

  /// 言語を変更する
  final void Function(LocaleCode) changeLocale;

  final void Function() changeTabPage;

  @override
  Widget build(BuildContext context) {
    /// 言語
    final i18n = AppLocalizations.of(context)!;

    return Scaffold(
      body: TemplateAddReflectionName(
        i18n: i18n,
        changeTabPage: changeTabPage,
        changeLocale: changeLocale,
      ),
    );
  }
}
