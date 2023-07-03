import 'package:flutter/material.dart'
    show AsyncSnapshot, ValueNotifier, BuildContext, Locale, Localizations;
import 'package:flutter_hooks/flutter_hooks.dart' show useState;
import 'package:gamer_reflection/components/common/atoms/input/select.dart'
    show SelectItem;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useMemoized, useFuture;
import 'package:gamer_reflection/storage/kvs/selected_language.dart'
    show selectLanguage;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

class UseReturn {
  const UseReturn({
    required this.onChanged,
    required this.languages,
    required this.language,
  });

  final Function(String? t) onChanged;
  final List<SelectItem> languages;
  final String language;
}

///
UseReturn useHooks(
  BuildContext context,
  void Function(LocaleCode) changeLocale,
) {
  /// 選択している言語
  final Future<String?> memoedLanguage =
      useMemoized(() => selectLanguage.get());
  final AsyncSnapshot<String?> futuredLanguage = useFuture(memoedLanguage);

  /// 選択言語
  ValueNotifier<String> language = useState<String>('ja');

  /// 端末の言語
  Locale locale = Localizations.localeOf(context);

  /// 変更を押した
  void onChanged(String? t) {
    switch (t) {
      case 'da':
        changeLocale(LocaleCode.da);
        selectLanguage.save(t!);
        break;
      case 'de':
        changeLocale(LocaleCode.de);
        selectLanguage.save(t!);
        break;
      case 'en':
        changeLocale(LocaleCode.en);
        selectLanguage.save(t!);
        break;
      case 'fr':
        changeLocale(LocaleCode.fr);
        selectLanguage.save(t!);
        break;
      case 'it':
        changeLocale(LocaleCode.it);
        selectLanguage.save(t!);
        break;
      case 'ja':
        changeLocale(LocaleCode.ja);
        selectLanguage.save(t!);
        break;
      case 'ko':
        changeLocale(LocaleCode.ko);
        selectLanguage.save(t!);
        break;
      case 'ru':
        changeLocale(LocaleCode.ru);
        selectLanguage.save(t!);
        break;
      case 'zh':
        changeLocale(LocaleCode.zh);
        selectLanguage.save(t!);
        break;
      case 'zh_TW':
        changeLocale(LocaleCode.zhTW);
        selectLanguage.save(t!);
        break;
      default:
    }
  }

  /// 表示言語一覧
  const List<SelectItem> languages = [
    /// デンマーク
    SelectItem(text: 'Dansk', value: 'da'),

    /// ドイツ語
    SelectItem(text: 'Deutsch', value: 'de'),

    /// 英語
    SelectItem(text: 'English', value: 'en'),

    /// フランス語
    SelectItem(text: 'Français', value: 'fr'),

    /// イタリア語
    SelectItem(text: 'Italiano', value: 'it'),

    /// 日本語
    SelectItem(text: '日本語', value: 'ja'),

    /// 韓国語
    SelectItem(text: '한국어', value: 'ko'),

    /// ロシア語
    SelectItem(text: 'Русский', value: 'ru'),

    /// 中国語 簡体
    SelectItem(text: '中文（简体）', value: 'zh'),

    /// 中国語 繁体
    SelectItem(text: '中文（繁體）', value: 'zh_TW'),
  ];

  useEffect(() {
    if (futuredLanguage.data == null) return;

    /// 初期選択言語
    final languageCode = locale.languageCode.toString();
    language.value = futuredLanguage.data ?? languageCode;

    return;
  }, [futuredLanguage.data]);

  return UseReturn(
    onChanged: onChanged,
    languages: languages,
    language: language.value,
  );
}
