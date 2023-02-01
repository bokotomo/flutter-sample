import 'package:flutter/material.dart' show TextEditingController;

class UseReturn {
  const UseReturn({
    required this.onPressedTaskDone,
    required this.onChanged,
    required this.textReflection,
  });

  final void Function(int) onPressedTaskDone;
  final void Function(String) onChanged;
  final TextEditingController textReflection;
}

///
UseReturn useHandler() {
  TextEditingController textReflection = TextEditingController();

  /// タスクの完了を押した
  void onPressedTaskDone(int taskId) async {
    print(taskId);
  }

  void onChanged(String t) {
    print(textReflection.text);
  }

  return UseReturn(
    onPressedTaskDone: onPressedTaskDone,
    onChanged: onChanged,
    textReflection: textReflection,
  );
}
