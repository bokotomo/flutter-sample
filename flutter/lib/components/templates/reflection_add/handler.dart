import 'package:flutter/material.dart' show TextEditingController;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show addReflection;
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show RepositoryReflection;

/// handler event

class UseReturn {
  const UseReturn({
    required this.onPressedAddReflection,
    required this.onChanged,
    required this.textReflection,
  });

  final void Function(RepositoryReflection?) onPressedAddReflection;
  final void Function(String) onChanged;
  final TextEditingController textReflection;
}

///
UseReturn useHandler() {
  TextEditingController textReflection = TextEditingController();

  /// 振り返りの追加を押した
  void onPressedAddReflection(RepositoryReflection? r) async {
    print(textReflection.text);
    await addReflection(r, textReflection.text);
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
