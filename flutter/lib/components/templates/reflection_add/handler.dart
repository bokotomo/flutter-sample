import 'package:flutter/material.dart' show TextEditingController;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;

class UseReturn {
  const UseReturn({
    required this.onPressedAddReflection,
    required this.onPressedAddCandidate,
    required this.onChanged,
    required this.textReflection,
  });

  final void Function() onPressedAddReflection;
  final void Function(String) onPressedAddCandidate;
  final void Function(String) onChanged;
  final TextEditingController textReflection;
}

///
UseReturn useHandler() {
  TextEditingController textReflection = TextEditingController();

  /// 振り返りの追加を押した
  void onPressedAddReflection() async {
    print(textReflection.text);
    if (textReflection.text == "") return;
    await RequestReflection().addReflection(textReflection.text);
    textReflection.clear();
  }

  /// 候補から振り返りの追加を押した
  void onPressedAddCandidate(String text) async {
    textReflection.text = text;
  }

  void onChanged(String t) {
    // text = t;
    print(textReflection.text);
  }

  return UseReturn(
    onPressedAddReflection: onPressedAddReflection,
    onPressedAddCandidate: onPressedAddCandidate,
    onChanged: onChanged,
    textReflection: textReflection,
  );
}
