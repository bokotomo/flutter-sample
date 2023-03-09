import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show InputSelect;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;

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
        child: BasicText(
          size: "M",
          text: "日本語",
        ),
      ),

      /// 英語
      DropdownMenuItem(
        value: 'en',
        child: BasicText(
          size: "M",
          text: "English",
        ),
      ),

      /// ドイツ語
      DropdownMenuItem(
        value: 'de',
        child: BasicText(
          size: "M",
          text: "German",
        ),
      ),

      /// イタリア語
      DropdownMenuItem(
        value: 'it',
        child: BasicText(
          size: "M",
          text: "Italian",
        ),
      ),

      /// 韓国語
      DropdownMenuItem(
        value: 'ko',
        child: BasicText(
          size: "M",
          text: "한국어",
        ),
      ),

      /// フランス語
      DropdownMenuItem(
        value: 'fr',
        child: BasicText(
          size: "M",
          text: "Français",
        ),
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
