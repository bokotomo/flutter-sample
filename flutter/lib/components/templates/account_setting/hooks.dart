import 'package:flutter/material.dart'
    show ValueNotifier, TextEditingController, FocusNode;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useState, useFocusNode, useEffect;

class UseReturn {
  const UseReturn({
    required this.onPressedEdit,
    required this.textReflectionName,
    required this.textReflectionNameFocusNode,
    required this.textReflectionNewName,
    required this.textReflectionNewNameFocusNode,
  });

  final void Function() onPressedEdit;
  final TextEditingController textReflectionName;
  final FocusNode textReflectionNameFocusNode;
  final TextEditingController textReflectionNewName;
  final FocusNode textReflectionNewNameFocusNode;
}

///
UseReturn useHooks() {
  ValueNotifier<TextEditingController> textReflectionName =
      useState<TextEditingController>(TextEditingController());
  FocusNode textReflectionNameFocusNode = useFocusNode();
  ValueNotifier<TextEditingController> textReflectionNewName =
      useState<TextEditingController>(TextEditingController());
  FocusNode textReflectionNewNameFocusNode = useFocusNode();
  ValueNotifier<bool> isEditMode = useState<bool>(false);

  /// 振り返りの追加を押した
  void onPressedEdit() {
    isEditMode.value = true;
  }

  useEffect(() {
    textReflectionName.value.text = "振り返り名A";
  }, []);

  return UseReturn(
    onPressedEdit: onPressedEdit,
    textReflectionName: textReflectionName.value,
    textReflectionNameFocusNode: textReflectionNameFocusNode,
    textReflectionNewName: textReflectionNewName.value,
    textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
  );
}
