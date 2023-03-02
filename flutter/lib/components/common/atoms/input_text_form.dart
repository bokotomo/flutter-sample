import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColor, ConstantColorInput;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// inputのスタイル
InputDecoration decoration(String hintText) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(ConstantSizeUI.l1)),
      borderSide: BorderSide(
        color: ConstantColorInput.inputBorderFocus,
        width: 2.0,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(ConstantSizeUI.l1)),
      borderSide: BorderSide(
        color: ConstantColorInput.inputBorder,
        width: 2.0,
      ),
    ),
    filled: true,
    fillColor: ConstantColorInput.input,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: ConstantColorInput.inputHintText,
    ),
    contentPadding: const EdgeInsets.all(ConstantSizeUI.l4),
  );
}

/// input: textForm
class InputTextForm extends StatelessWidget {
  const InputTextForm({
    super.key,
    required this.hintText,
    required this.text,
    this.autofocus,
    this.onChanged,
    this.focusNode,
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
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ConstantColorInput.inputBorder,
            spreadRadius: 0,
            blurRadius: ConstantSizeUI.l0,
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        controller: text,
        style: const TextStyle(color: ConstantColor.text),
        decoration: decoration(hintText),
        autofocus: autofocus ?? false,
        onChanged: onChanged,
        focusNode: focusNode,
        maxLines: 6,
      ),
    );
  }
}
