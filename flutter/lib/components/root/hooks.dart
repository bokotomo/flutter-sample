import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Locale, AsyncSnapshot;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:sqflite/sqflite.dart' show Database;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useEffect, useFuture, useMemoized;
import 'package:gamer_reflection/storage/rdb/driver/sqlite.dart'
    show initDatabase, DBConnection;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;
import 'package:gamer_reflection/storage/kvs/selected_language.dart'
    show selectLanguage;

class UseReturn {
  const UseReturn({
    required this.locale,
    required this.canDC,
    required this.changeLocale,
  });

  final Locale? locale;
  final ValueNotifier<bool> canDC;
  final void Function(LocaleCode) changeLocale;
}

UseReturn useHooks(BuildContext context) {
  /// 選択している言語
  final Future<String?> memoedLanguage =
      useMemoized(() => selectLanguage.get());
  final AsyncSnapshot<String?> futuredLanguage = useFuture(memoedLanguage);

  final ValueNotifier<Locale?> locale = useState<Locale?>(null);
  final ValueNotifier<bool> canDC = useState<bool>(false);

  /// 初期
  Future<void> setUp() async {
    Database db = await initDatabase();
    GetIt.I.registerSingleton<DBConnection>(DBConnection(db: db));
  }

  ///
  Future<void> setData() async {
    await setUp();
    canDC.value = true;
  }

  /// 言語を変更する
  void changeLocale(LocaleCode localeCode) {
    switch (localeCode) {
      case LocaleCode.ja:
        locale.value = const Locale('ja');
        break;
      case LocaleCode.en:
        locale.value = const Locale('en');
        break;
    }
  }

  useEffect(() {
    setData();
  }, []);

  useEffect(() {
    if (futuredLanguage.data == null) return;

    final machineLocaleCode = futuredLanguage.data;
    switch (machineLocaleCode) {
      case 'ja':
        changeLocale(LocaleCode.ja);
        break;
      case 'en':
        changeLocale(LocaleCode.en);
        break;
      default:
    }

    return;
  }, [futuredLanguage.data]);

  return UseReturn(
    locale: locale.value,
    canDC: canDC,
    changeLocale: changeLocale,
  );
}
