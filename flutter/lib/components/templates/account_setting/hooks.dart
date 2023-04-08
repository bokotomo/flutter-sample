import 'package:flutter/material.dart'
    show ValueNotifier, TextEditingController, FocusNode;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect;

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
  final void Function() onPressedNewName;
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

  /// 新規フル帰り名の追加を押した
  void onPressedNewName() {
    print("追加");
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
