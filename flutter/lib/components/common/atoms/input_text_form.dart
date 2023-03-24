import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/color/input.dart'
    show ConstantColorInput;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// input: textForm
class InputTextForm extends StatelessWidget {
  const InputTextForm({
    super.key,
    required this.hintText,
    required this.text,
    this.autofocus,
    this.onChanged,
    this.focusNode,
    this.maxLength,
  });

  /// プレフィックス
  final TextEditingController text;

  /// プレフィックス
  final String hintText;

  /// 自動フォーカス
  final bool? autofocus;

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 文字数
  final int? maxLength;

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
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(ConstantSizeUI.l1)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorderError,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(ConstantSizeUI.l1)),
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
        contentPadding: const EdgeInsets.all(ConstantSizeUI.l3),
      );
    }

    /// バリデーション
    String? validateForm(String? v) {
      if (maxLength != null && v != null && v.length > maxLength!) {
        return "※文字数が超えています。";
      }
      return null;
    }

    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: text,
      style: const TextStyle(color: ConstantColor.text),
      decoration: decoration(hintText),
      autofocus: autofocus ?? false,
      onChanged: onChanged,
      focusNode: focusNode,
      maxLines: 6,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateForm,
    );
  }
}
