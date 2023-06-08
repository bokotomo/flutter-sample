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
import 'package:gamer_reflection/modules/domain/task_detail/reflection.dart'
    show DomainTaskDetailReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
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
    required this.groupValue,
    required this.onPressedEditDone,
    required this.onPressedTaskDone,
    required this.onPressedCancel,
    required this.onChangedGood,
    required this.onChangedBad,
  });

  final FocusNode titleFocusNode;
  final FocusNode detailFocusNode;
  final bool isEditMode;
  final void Function() toggleEditMode;
  final TextEditingController titleController;
  final TextEditingController detailController;
  final GlobalKey<FormState> formKey;
  final String groupValue;
  final void Function() onPressedEditDone;
  final void Function(BuildContext) onPressedTaskDone;
  final void Function() onPressedCancel;
  final Function(String?) onChangedGood;
  final Function(String?) onChangedBad;
}

///
UseReturn useHooks(
  int taskId,
  DomainTaskDetailReflection? reflection,
  Future<void> Function() updateReflection,
) {
  final ValueNotifier<bool> isEditMode = useState<bool>(false);
  final FocusNode titleFocusNode = useFocusNode();
  final FocusNode detailFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> titleController =
      useState<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> detailController =
      useState<TextEditingController>(TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<String> groupValue = useState<String>("");

  /// 編集モード切り替え
  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  useEffect(() {
    if (reflection == null) return;

    titleController.value.text = reflection.text;
    detailController.value.text = reflection.detail;
    final bool isGood = reflection.reflectionType == ReflectionType.good;
    groupValue.value = isGood ? "good" : "bad";
  }, [reflection]);

  /// タスク完了ボタンを押した
  void onPressedTaskDone(BuildContext context) async {
    showModal(
      context,
      () async => await RequestReflection().deleteReflection(taskId),
    );
  }

  /// キャンセルボタンを押した
  void onPressedCancel() async {
    isEditMode.value = false;
    if (reflection == null) return;

    titleController.value.text = reflection.text;
    detailController.value.text = reflection.detail;
    final bool isGood = reflection.reflectionType == ReflectionType.good;
    groupValue.value = isGood ? "good" : "bad";
  }

  /// 編集完了ボタンを押した
  void onPressedEditDone() async {
    if (!formKey.currentState!.validate()) return;
    if (titleController.value.text == "") return;

    await RequestReflection().updateReflection(
      taskId,
      titleController.value.text,
      detailController.value.text,
      groupValue.value == "good" ? ReflectionType.good : ReflectionType.bad,
    );
    toggleEditMode();
    updateReflection();
  }

  /// 良いを押した
  void onChangedGood(String? t) {
    groupValue.value = t ?? "";
  }

  /// 悪いを押した
  void onChangedBad(String? t) {
    groupValue.value = t ?? "";
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
    groupValue: groupValue.value,
    onChangedGood: onChangedGood,
    onChangedBad: onChangedBad,
  );
}
