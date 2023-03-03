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
    required this.onPressedCancel,
  });

  final FocusNode titleFocusNode;
  final FocusNode detailFocusNode;
  final bool isEditMode;
  final void Function() toggleEditMode;
  final TextEditingController titleController;
  final TextEditingController detailController;
  final void Function() onPressedEditDone;
  final void Function() onPressedTaskDone;
  final void Function() onPressedCancel;
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

  /// 編集モード切り替え
  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  useEffect(() {
    if (reflection == null) return;

    titleController.value.text = reflection.text;
    detailController.value.text = reflection.detail;
  }, [reflection]);

  /// タスク完了ボタンを押した
  void onPressedTaskDone() async {
    await RequestReflection().deleteReflection(taskId);
  }

  /// キャンセルボタンを押した
  void onPressedCancel() async {
    isEditMode.value = false;
    if (reflection == null) return;

    titleController.value.text = reflection.text;
    detailController.value.text = reflection.detail;
  }

  /// 編集完了ボタンを押した
  void onPressedEditDone() async {
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
    toggleEditMode: toggleEditMode,
    onPressedCancel: onPressedCancel,
    titleFocusNode: titleFocusNode,
    detailFocusNode: detailFocusNode,
    isEditMode: isEditMode.value,
    titleController: titleController.value,
    detailController: detailController.value,
  );
}
