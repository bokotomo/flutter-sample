import 'package:flutter/material.dart' show TextEditingController;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show addReflection;

/// handler event

class UseReturn {
  const UseReturn({
    required this.onPressedAddReflection,
    required this.onChanged,
    required this.textReflection,
  });

  final void Function() onPressedAddReflection;
  final void Function(String) onChanged;
  final TextEditingController textReflection;
}

///
UseReturn useHandler() {
  TextEditingController textReflection = TextEditingController();

  /// 振り返りの追加を押した
  void onPressedAddReflection() async {
    print(textReflection.text);
    await addReflection(textReflection.text);
    textReflection.clear();
  }

  void onChanged(String t) {
    // text = t;
    print(textReflection.text);
  }

  return UseReturn(
    onPressedAddReflection: onPressedAddReflection,
    onChanged: onChanged,
    textReflection: textReflection,
  );
}
