import 'package:flutter/material.dart'
    show
        FocusNode,
        TextEditingController,
        ValueNotifier,
        GlobalKey,
        FormState,
        BuildContext;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;
import 'package:gamer_reflection/components/common/atoms/toast/alert.dart'
    show ToastAlert;
import 'package:gamer_reflection/components/common/atoms/toast/basic.dart'
    show ToastBasic;
import 'package:fluttertoast/fluttertoast.dart' show FToast, ToastGravity;
import 'package:gamer_reflection/modules/request/todo.dart' show RequestTodo;
import 'package:gamer_reflection/domain/task_detail/reflection.dart'
    show DomainTaskDetailReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/components/templates/task_detail/modal/check_done.dart'
    show showModal;

class UseReturn {
  const UseReturn({
    required this.todoExist,
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
    required this.onPressedToggleTodo,
  });

  final bool todoExist;
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
  final Function() onPressedToggleTodo;
}

/// ロジック: タスク詳細ページ
UseReturn useHooks(
  BuildContext context,
  int reflectionId,
  DomainTaskDetailReflection? reflection,
  Future<void> Function() updateReflection,
  bool? todoExistDB,
) {
  final ValueNotifier<bool> isEditMode = useState<bool>(false);
  final FocusNode titleFocusNode = useFocusNode();
  final FocusNode detailFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> titleController =
      useState<TextEditingController>(TextEditingController());
  final ValueNotifier<TextEditingController> detailController =
      useState<TextEditingController>(TextEditingController());
  final ValueNotifier<bool> todoExist = useState<bool>(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<String> groupValue = useState<String>("");
  final FToast fToast = FToast();

  /// 編集モード切り替え
  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  useEffect(() {
    if (reflection == null) return;

    fToast.init(context);

    titleController.value.text = reflection.text;
    detailController.value.text = reflection.detail;
    final bool isGood = reflection.reflectionType == ReflectionType.good;
    groupValue.value = isGood ? "good" : "bad";

    return;
  }, [reflection]);

  useEffect(() {
    if (todoExistDB == null) return;

    todoExist.value = todoExistDB;
    return;
  }, [todoExistDB]);

  /// トーストを表示
  void showAlert(String text) {
    fToast.showToast(
      child: ToastAlert(text: text),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 2500),
    );
  }

  /// トーストを表示
  void showNotification(String text) {
    fToast.showToast(
      child: ToastBasic(text: text),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(milliseconds: 2500),
    );
  }

  /// タスク完了ボタンを押した
  void onPressedTaskDone(BuildContext context) async {
    showModal(
      context,
      () async => await RequestReflection().deleteReflection(reflectionId),
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
      reflectionId,
      titleController.value.text,
      detailController.value.text,
      groupValue.value == "good" ? ReflectionType.good : ReflectionType.bad,
    );

    toggleEditMode();
    updateReflection();
  }

  /// やることに追加ボタンを押した
  Future<void> onPressedToggleTodo() async {
    if (todoExist.value) {
      // すでにあれば削除
      await RequestTodo().deleteTodo(reflectionId);
    } else {
      // 詳細が空の場合
      if (detailController.value.text.isEmpty) {
        final bool isGood = reflection!.reflectionType == ReflectionType.good;
        final String text =
            isGood ? "追加するには「伸ばす方法」を書く必要があります。" : "追加するには「対策方法」を書く必要があります。";
        showAlert(text);
        return;
      }
      // なければ新規追加
      await RequestTodo().insertTodo(reflectionId);
    }

    final String textNotificatoin =
        todoExist.value ? "やることから外しました。" : "やることに追加しました。";
    showNotification(textNotificatoin);

    todoExist.value = !todoExist.value;
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
    todoExist: todoExist.value,
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
    onPressedToggleTodo: onPressedToggleTodo,
  );
}
