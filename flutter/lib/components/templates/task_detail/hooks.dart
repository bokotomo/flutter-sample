import 'package:flutter/material.dart'
    show
        FocusNode,
        TextEditingController,
        ValueNotifier,
        GlobalKey,
        FormState,
        BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/templates/task_detail/modal/check_done.dart'
    show showModal;

class UseReturn {
  const UseReturn({
    required this.titleFocusNode,
    required this.detailFocusNode,
    required this.isEditMode,
    required this.toggleEditMode,
    required this.titleController,
    required this.detailController,
    required this.formKey,
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
  final GlobalKey<FormState> formKey;
  final void Function() onPressedEditDone;
  final void Function(BuildContext) onPressedTaskDone;
  final void Function() onPressedCancel;
}

///
UseReturn useHooks(
  int taskId,
  DomainReflection? reflection,
  Future<void> Function() updateReflection,
) {
  ValueNotifier<bool> isEditMode = useState<bool>(false);
  final FocusNode titleFocusNode = useFocusNode();
  final FocusNode detailFocusNode = useFocusNode();
  ValueNotifier<TextEditingController> titleController =
      useState<TextEditingController>(TextEditingController());
  ValueNotifier<TextEditingController> detailController =
      useState<TextEditingController>(TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  void onPressedTaskDone(BuildContext context) async {
    showModal(
      context,
      () async => {
        await RequestReflection().deleteReflection(taskId),
      },
    );
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
    if (!formKey.currentState!.validate()) return;
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
    formKey: formKey,
  );
}
