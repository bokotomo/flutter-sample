import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useState, useFocusNode;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

class UseReturn {
  const UseReturn({
    required this.titleFocusNode,
    required this.detailFocusNode,
    required this.isEditMode,
    required this.toggleEditMode,
    required this.titleController,
    required this.detailController,
    required this.onPressedEditDone,
    required this.onPressedTaskDone,
  });

  final FocusNode titleFocusNode;
  final FocusNode detailFocusNode;
  final bool isEditMode;
  final void Function() toggleEditMode;
  final TextEditingController titleController;
  final TextEditingController detailController;
  final void Function() onPressedEditDone;
  final void Function() onPressedTaskDone;
}

///
UseReturn useHandler(
  int taskId,
  DomainReflection? reflection,
  Future<void> Function() updateReflection,
) {
  ValueNotifier<bool> isEditMode = useState<bool>(false);
  final titleFocusNode = useFocusNode();
  final detailFocusNode = useFocusNode();
  ValueNotifier<TextEditingController> titleController =
      useState<TextEditingController>(TextEditingController());
  ValueNotifier<TextEditingController> detailController =
      useState<TextEditingController>(TextEditingController());

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  useEffect(() {
    if (reflection == null) return;
    print(reflection.text);

    titleController.value.text = reflection.text;
    detailController.value.text = reflection.detail;
  }, [reflection]);

  /// タスク完了ボタンを押した
  void onPressedTaskDone() async {
    print(taskId);
    await RequestReflection().deleteReflection(taskId);
  }

  /// 編集完了ボタンを押した
  void onPressedEditDone() async {
    print(taskId);
    print(titleController.value.text);
    print(detailController.value.text);
    if (titleController.value.text == "") return;

    await RequestReflection().updateReflection(
      taskId,
      titleController.value.text,
      detailController.value.text,
    );
    toggleEditMode();
    updateReflection();
  }

  return UseReturn(
    onPressedTaskDone: onPressedTaskDone,
    onPressedEditDone: onPressedEditDone,
    titleFocusNode: titleFocusNode,
    detailFocusNode: detailFocusNode,
    isEditMode: isEditMode.value,
    toggleEditMode: toggleEditMode,
    titleController: titleController.value,
    detailController: detailController.value,
  );
}
