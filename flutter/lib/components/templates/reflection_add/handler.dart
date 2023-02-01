import 'package:flutter/material.dart' show TextEditingController;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show addReflection;
import 'package:gamer_reflection/modules/database/repository/reflection.dart'
    show RepositoryReflection;

/// handler event

class UseReturn {
  const UseReturn({
    required this.onPressed,
    required this.onChanged,
    required this.textReflection,
  });

  final void Function(RepositoryReflection?) onPressed;
  final void Function(String) onChanged;
  final TextEditingController textReflection;
}

///
UseReturn useHandler() {
  TextEditingController textReflection = TextEditingController();

  void onPressed(RepositoryReflection? r) async {
    print(textReflection.text);
    await addReflection(r, textReflection.text);
    textReflection.clear();
  }

  void onChanged(String t) {
    // text = t;
    print(textReflection.text);
  }

  return UseReturn(
    onPressed: onPressed,
    onChanged: onChanged,
    textReflection: textReflection,
  );
}
