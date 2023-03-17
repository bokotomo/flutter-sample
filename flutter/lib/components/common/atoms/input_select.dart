import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColor, ConstantColorInput;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
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

/// input: select
class InputSelect extends StatelessWidget {
  const InputSelect({
    super.key,
    required this.value,
    required this.items,
    this.focusNode,
    this.onChanged,
  });

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 値
  final String value;

  /// 一覧
  final List<SelectItem> items;

  /// 変更した
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    /// 変更された
    void onChanged(String? t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    /// decoration
    InputDecoration decoration() {
      return const InputDecoration(
        filled: true,
        fillColor: ConstantColorInput.input,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorderFocus,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorder,
            width: 2.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
        ),
      );
    }

    /// DropdownMenuItem配列に変換
    final List<DropdownMenuItem<String>> menuItems = items
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

    return DropdownButtonFormField(
      items: menuItems,
      decoration: decoration(),
      style: const TextStyle(color: ConstantColor.text),
      dropdownColor: ConstantColorInput.input,
      value: value,
      focusNode: focusNode,
      onChanged: onChanged,
    );
  }
}