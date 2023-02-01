import 'package:flutter/material.dart' show TextEditingController;
import 'package:sqflite/sqflite.dart';
import 'package:gamer_reflection/modules/request/reflection.dart'
    show addReflection;

/// handler event

class UseReturn {
  const UseReturn({
    required this.onPressed,
    required this.onChanged,
    required this.textReflection,
  });

  final void Function(Future<Database>) onPressed;
  final void Function(String) onChanged;
  final TextEditingController textReflection;
}

///
UseReturn useHandler() {
  TextEditingController textReflection = TextEditingController();

  void onPressed(Future<Database> db) async {
    print(textReflection.text);
    await addReflection(db, textReflection.text);
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
