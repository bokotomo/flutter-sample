import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter/material.dart' show Navigator;
import 'package:flutter/material.dart' show TextEditingController;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;

class UseReturn {
  const UseReturn({
    required this.onPressedTaskDone,
    required this.onChanged,
    required this.textReflection,
  });

  final void Function(int, BuildContext) onPressedTaskDone;
  final void Function(String) onChanged;
  final TextEditingController textReflection;
}

///
UseReturn useHandler() {
  TextEditingController textReflection = TextEditingController();

  /// タスクの完了を押した
  void onPressedTaskDone(int taskId, BuildContext context) async {
    print(taskId);
    await RequestReflection().deleteReflection(taskId);
    // Navigator.pop(context);
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
