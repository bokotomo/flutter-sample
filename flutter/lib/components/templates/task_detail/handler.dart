import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter/material.dart' show TextEditingController;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;

class UseReturn {
  const UseReturn({
    required this.onPressedTaskDone,
    required this.onPressedEditDone,
    required this.textReflection,
  });

  final void Function(int, BuildContext) onPressedTaskDone;
  final void Function(int) onPressedEditDone;
  final TextEditingController textReflection;
}

///
UseReturn useHandler(
  TextEditingController titleController,
  TextEditingController detailController,
) {
  TextEditingController textReflection = TextEditingController();
  // TextEditingController title = TextEditingController(text: defaultTitle);
  // TextEditingController detail = TextEditingController(text: defaultDetail);

  /// タスク完了ボタンを押した
  void onPressedTaskDone(int taskId, BuildContext context) async {
    print(taskId);
    await RequestReflection().deleteReflection(taskId);
  }

  /// 編集完了ボタンを押した
  void onPressedEditDone(int taskId) async {
    print(taskId);
    print(titleController.text);
    print(detailController.text);
    if (titleController.text == "") return;
    await RequestReflection().updateReflection(
      taskId,
      titleController.text,
      detailController.text,
    );
  }

  return UseReturn(
    onPressedTaskDone: onPressedTaskDone,
    onPressedEditDone: onPressedEditDone,
    textReflection: textReflection,
  );
}
