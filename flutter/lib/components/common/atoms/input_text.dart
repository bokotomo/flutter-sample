import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColor, ConstantColorInput;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// input: text
class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.hintText,
    required this.text,
    this.autofocus,
    this.focusNode,
    this.onChanged,
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

  @override
  Widget build(BuildContext context) {
    /// 変更された
    void onChanged(String t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

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
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorderError,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorderError,
            width: 2.0,
          ),
        ),
        errorStyle: const TextStyle(
          color: ConstantColorInput.inputErrorText,
        ),
        filled: true,
        fillColor: ConstantColorInput.input,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ConstantColorInput.inputHintText,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: ConstantSizeUI.l3,
        ),
      );
    }

    /// バリデーション
    String? validateForm(String? v) {
      if (v == null || v.isEmpty) return "※文字が未入力です。";
      if (maxLength != null && v.length > maxLength!) return "※文字数が超えています。";
      final String noSpaceStr = v.replaceAll(RegExp(r'\s+'), '');
      if (noSpaceStr.isEmpty) return "※全て空白では追加できません。";
      if (RegExp(r'^\s+').hasMatch(v)) return "※先頭に空白は入れられません。";
      if (RegExp(r'\s+$').hasMatch(v)) return "※末尾に空白は入れられません。";

      return null;
    }

    return TextFormField(
      controller: text,
      style: const TextStyle(color: ConstantColor.text),
      decoration: decoration(hintText),
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      onChanged: onChanged,
      maxLines: 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateForm,
    );
  }
}
