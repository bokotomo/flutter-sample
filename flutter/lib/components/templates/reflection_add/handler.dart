import 'package:sqflite/sqflite.dart';
import 'package:gamer_reflection/modules/request/reflection.dart'
    show addReflection;

/// handler event

class UseReturn {
  const UseReturn({
    required this.onPressed,
    required this.onChanged,
  });

  final void Function(Future<Database>) onPressed;
  final void Function(String) onChanged;
}

///
UseReturn useHandler() {
  String text = "";

  void onPressed(Future<Database> db) async {
    print(text);
    await addReflection(db, text);
  }

  void onChanged(String t) {
    text = t;
    print(text + "!");
  }

  return UseReturn(onPressed: onPressed, onChanged: onChanged);
}
