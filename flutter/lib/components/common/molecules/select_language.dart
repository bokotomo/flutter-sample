import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect;

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

    const List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(
        value: 'ja',
        child: Text('日本語'),
      ),

      /// 英語
      DropdownMenuItem(
        value: 'en',
        child: Text('English'),
      ),

      /// ドイツ語
      DropdownMenuItem(
        value: 'de',
        child: Text('German'),
      ),

      /// イタリア語
      DropdownMenuItem(
        value: 'it',
        child: Text('Italian'),
      ),

      /// 韓国語
      DropdownMenuItem(
        value: 'ko',
        child: Text('한국어'),
      ),

      /// フランス語
      DropdownMenuItem(
        value: 'fr',
        child: Text('Français'),
      ),
    ];
    const value = "ja";

    return InputSelect(
      items: items,
      value: value,
      onChanged: onChanged,
      focusNode: focusNode,
    );
  }
}
