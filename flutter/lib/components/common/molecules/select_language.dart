import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext, FocusNode;
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect, SelectItem;

/// 言語選択
class SelectLanguage extends StatelessWidget {
  const SelectLanguage({
    super.key,
    this.focusNode,
    this.onChanged,
  });

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 変更した
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    /// 変更を押した
    void onChanged(String? t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    /// 表示言語一覧
    const List<SelectItem> laguages = [
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

    /// 初期選択言語
    const value = "ja";

    return InputSelect(
      items: laguages,
      value: value,
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}
