import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/color/input.dart'
    show ConstantColorInput;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/common/atoms/input_text/validate.dart'
    show useValidate;

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
    this.onPressedRemove,
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
  final void Function(String?)? onChanged;

  /// 削除する
  final void Function()? onPressedRemove;

  @override
  Widget build(BuildContext context) {
    final v = useValidate(maxLength);

    /// 変更された
    void onChanged(String? t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    /// 削除を押した
    void onPressedRemove() {
      if (this.onPressedRemove == null) return;
      this.onPressedRemove!();
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
        contentPadding: EdgeInsets.only(
          left: ConstantSizeUI.l3,
          right: this.onPressedRemove == null
              ? ConstantSizeUI.l3
              : ConstantSizeUI.l6,
        ),
      );
    }

    return Stack(
      children: [
        TextFormField(
          controller: text,
          style: const TextStyle(color: ConstantColor.text),
          decoration: decoration(hintText),
          autofocus: autofocus ?? false,
          focusNode: focusNode,
          onChanged: onChanged,
          maxLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: v.validateForm,
        ),
        if (this.onPressedRemove != null)
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              color: ConstantColor.icon,
              iconSize: 24,
              icon: const Icon(Icons.highlight_off),
              onPressed: onPressedRemove,
            ),
          ),
      ],
    );
  }
}
