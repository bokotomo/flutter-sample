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
      case 'ja':
        changeLocale(LocaleCode.ja);
        selectLanguage.save(t!);
        break;
      case 'en':
        changeLocale(LocaleCode.en);
        selectLanguage.save(t!);
        break;
      default:
    }
  }

  /// 表示言語一覧
  const List<SelectItem> languages = [
    SelectItem(text: '日本語', value: 'ja'),

    /// 英語
    SelectItem(text: 'English', value: 'en'),

    // /// ドイツ語
    // SelectItem(text: 'German', value: 'de'),

    // /// イタリア語
    // SelectItem(text: 'Italian', value: 'it'),

    // /// 韓国語
    // SelectItem(text: '한국어', value: 'ko'),

    // /// フランス語
    // SelectItem(text: 'Français', value: 'fr'),
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
