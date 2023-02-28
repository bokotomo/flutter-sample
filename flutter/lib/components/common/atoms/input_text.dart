import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// inputのスタイル
InputDecoration decoration(String hintText) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide: BorderSide(color: ConstantColor.inputBorderFocus, width: 2.0),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide: BorderSide(color: ConstantColor.inputBorder, width: 2.0),
    ),
    filled: true,
    fillColor: ConstantColor.input,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: ConstantColor.inputHintText,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: ConstantSizeUI.l4,
    ),
  );
}

/// input: text
class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.hintText,
    required this.text,
    this.autofocus,
    this.focusNode,
    this.onChanged,
  });

  /// プレフィックス
  final TextEditingController text;

  /// プレフィックス
  final String hintText;

  /// 自動フォーカス
  final bool? autofocus;

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 変更した
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    /// 変更された
    void onChanged(String t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: ConstantColor.inputBorder,
            spreadRadius: 0,
            blurRadius: ConstantSizeUI.l1,
          ),
        ],
      ),
      child: TextField(
        controller: text,
        style: const TextStyle(color: ConstantColor.text),
        decoration: decoration(hintText),
        autofocus: autofocus ?? false,
        focusNode: focusNode,
        onChanged: onChanged,
      ),
    );
  }
}
