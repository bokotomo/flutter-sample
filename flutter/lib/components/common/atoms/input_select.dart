import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColor, ConstantColorInput;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

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

/// input: select
class InputSelect extends StatelessWidget {
  const InputSelect({
    super.key,
    // required this.text,
    this.focusNode,
    this.onChanged,
  });

  /// プレフィックス
  // final TextEditingController text;

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
      DropdownMenuItem(
        value: 'en',
        child: Text('英語'),
      ),
    ];
    const value = "ja";

    return DropdownButtonFormField(
      items: items,
      decoration: decoration(),
      style: const TextStyle(color: ConstantColor.text),
      dropdownColor: ConstantColorInput.input,
      value: value,
      isExpanded: true,
      onChanged: onChanged,
    );
  }
}
