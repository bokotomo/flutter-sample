import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/color.dart' as color;

/// inputのスタイル
InputDecoration decoration(String hintText) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide: BorderSide(color: color.borderColor, width: 2.0),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      borderSide: BorderSide(color: color.borderColor, width: 2.0),
    ),
    filled: true,
    fillColor: color.borderBackGroundColor,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: color.borderHintTextColor,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 24,
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
      style: const TextStyle(color: color.textColor),
      decoration: decoration(hintText),
      autofocus: autofocus,
    );
  }
}
