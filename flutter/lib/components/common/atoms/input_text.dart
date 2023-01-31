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
      color: ConstantColor.borderHintText,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: ConstantSizeUI.l4,
    ),
  );
}

/// input text
class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.hintText,
    required this.autofocus,
  });
  final String hintText;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: ConstantColor.text),
      decoration: decoration(hintText),
      autofocus: autofocus,
    );
  }
}
