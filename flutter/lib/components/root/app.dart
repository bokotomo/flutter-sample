import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        MaterialApp,
        Locale,
        ThemeData,
        VisualDensity,
        SizedBox,
        Container;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/layouts/tabbar/tabbar.dart'
    show Tabbar;
import 'package:gamer_reflection/components/pages/add_reflection_name/add_reflection_name.dart'
    show PageAddReflectionName;
import 'package:gamer_reflection/components/root/hooks.dart' show useHooks;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

const title = 'Gamer Reflection';

/// ページ: ルート
class App extends HookWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final h = useHooks(context);

    /// コンテンツ
    home() {
      final isFirstPage = h.isNoSetReflectionGroup;

      if (isFirstPage == null) {
        return Container(
          color: ConstantColor.content,
          child: const SizedBox(),
        );
      }

      // 初回ページ
      if (isFirstPage) {
        return PageAddReflectionName(
          changeTabPage: h.changeTabPage,
          changeLocale: h.changeLocale,
        );
      }

      // メインページ
      return Tabbar(
        canDC: h.canDC,
        changeLocale: h.changeLocale,
      );
    }

    const supportedLocales = [
      ...AppLocalizations.supportedLocales,
      Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hans',
      ),
      Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hant',
      ),
      Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hans',
        countryCode: 'CN',
      ),
      Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hant',
        countryCode: 'TW',
      ),
      Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hant',
        countryCode: 'HK',
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      locale: h.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: supportedLocales,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home(),
    );
  }
}
