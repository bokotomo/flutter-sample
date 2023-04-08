import 'package:flutter/material.dart'
    show ValueNotifier, TextEditingController, FocusNode, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect;
import 'package:gamer_reflection/components/templates/account_setting/modal/new_reflection_name.dart'
    show showModal;

class UseReturn {
  const UseReturn({
    required this.onPressedEdit,
    required this.onPressedNewName,
    required this.textReflectionName,
    required this.textReflectionNameFocusNode,
    required this.textReflectionNewName,
    required this.textReflectionNewNameFocusNode,
  });

  final void Function() onPressedEdit;
  final void Function(BuildContext context) onPressedNewName;
  final TextEditingController textReflectionName;
  final FocusNode textReflectionNameFocusNode;
  final TextEditingController textReflectionNewName;
  final FocusNode textReflectionNewNameFocusNode;
}

/// ロジック
UseReturn useHooks() {
  ValueNotifier<TextEditingController> textReflectionName =
      useState<TextEditingController>(TextEditingController());
  FocusNode textReflectionNameFocusNode = useFocusNode();
  ValueNotifier<TextEditingController> textReflectionNewName =
      useState<TextEditingController>(TextEditingController());
  FocusNode textReflectionNewNameFocusNode = useFocusNode();

  /// 振り返り名の変更を押した
  void onPressedEdit() {
    print("変更");
  }

  /// 新規振り返り名の追加を押した
  void onPressedNewName(BuildContext context) {
    print("追加");
    showModal(
      context,
      () => {
        print("追加した"),
      },
    );
  }

  useEffect(() {
    textReflectionName.value.text = "振り返り名A";
  }, []);

  return UseReturn(
    onPressedEdit: onPressedEdit,
    onPressedNewName: onPressedNewName,
    textReflectionName: textReflectionName.value,
    textReflectionNameFocusNode: textReflectionNameFocusNode,
    textReflectionNewName: textReflectionNewName.value,
    textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
  );
}
