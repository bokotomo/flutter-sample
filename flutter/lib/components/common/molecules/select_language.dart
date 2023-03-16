import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;

/// セレクトアイテム
class SelectItem {
  const SelectItem({
    required this.value,
    required this.text,
  });
  final String value;
  final String text;
}

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
    /// 変更された
    void onChanged(String? t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

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

    /// DropdownMenuItem配列に変換
    final List<DropdownMenuItem<String>> items = laguages
        .map(
          (item) => DropdownMenuItem(
            value: item.value,
            child: BasicText(
              size: "M",
              text: item.text,
            ),
          ),
        )
        .toList();

    const value = "ja";

    return InputSelect(
      items: items,
      value: value,
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}
