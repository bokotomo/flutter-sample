import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColor, ConstantColorInput;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// inputのスタイル
InputDecoration decoration(String hintText) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide: BorderSide(
        color: ConstantColorInput.inputBorderFocus,
        width: 2.0,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
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
    this.formKey,
    this.maxLength,
  });

  /// プレフィックス
  final TextEditingController text;

  /// プレフィックス
  final String hintText;

  /// 文字数
  final int? maxLength;

  /// 自動フォーカス
  final bool? autofocus;

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 変更した
  final void Function(String)? onChanged;

  ///
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    /// 変更された
    void onChanged(String t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    /// バリデーション
    String? validateForm(String? v) {
      if (v == null || v.isEmpty) return "入力されていません。";
      if (maxLength != null && v.length > maxLength!) return "文字数が超えています。";

      return null;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: ConstantColorInput.inputBorder,
            spreadRadius: 0,
            blurRadius: ConstantSizeUI.l0,
          ),
        ],
      ),
      child: TextFormField(
        controller: text,
        style: const TextStyle(color: ConstantColor.text),
        decoration: decoration(hintText),
        autofocus: autofocus ?? false,
        focusNode: focusNode,
        onChanged: onChanged,
        maxLines: 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateForm,
      ),
    );
  }
}
