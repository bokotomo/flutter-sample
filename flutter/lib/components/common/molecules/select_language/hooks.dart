import 'package:flutter/material.dart' show AsyncSnapshot, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState;
import 'package:gamer_reflection/components/common/atoms/input/select.dart'
    show SelectItem;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useMemoized, useFuture;
import 'package:gamer_reflection/modules/storage/selected_language.dart'
    show selectLanguage;

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
UseReturn useHooks() {
  /// 選択している期間
  final Future<String?> memoedLanguage =
      useMemoized(() => selectLanguage.get());
  final AsyncSnapshot<String?> futuredLanguage = useFuture(memoedLanguage);

  /// 選択言語
  ValueNotifier<String> language = useState<String>("ja");

  /// 変更を押した
  void onChanged(String? t) {
    selectLanguage.save(t ?? "ja");
  }

  /// 表示言語一覧
  const List<SelectItem> languages = [
    SelectItem(text: '日本語', value: 'ja'),

    /// 英語
    SelectItem(text: 'English', value: 'en'),

    /// ドイツ語
    SelectItem(text: 'German', value: 'de'),

    /// イタリア語
    SelectItem(text: 'Italian', value: 'it'),

    /// 韓国語
    SelectItem(text: '한국어', value: 'ko'),

    /// フランス語
    SelectItem(text: 'Français', value: 'fr'),
  ];

  useEffect(() {
    if (futuredLanguage.data == null) return;

    /// 初期選択言語
    language.value = futuredLanguage.data ?? "ja";
  }, [futuredLanguage.data]);

  return UseReturn(
    onChanged: onChanged,
    languages: languages,
    language: language.value,
  );
}
