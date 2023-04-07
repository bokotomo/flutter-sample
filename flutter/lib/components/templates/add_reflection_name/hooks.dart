import 'package:flutter/material.dart'
    show TextEditingController, FocusNode, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useFocusNode;

class UseReturn {
  const UseReturn({
    required this.textReflection,
    required this.textFieldFocusNode,
  });

  final TextEditingController textReflection;
  final FocusNode textFieldFocusNode;
}

/// ロジック
UseReturn useHooks() {
  ValueNotifier<TextEditingController> textReflection =
      useState<TextEditingController>(TextEditingController());
  FocusNode textFieldFocusNode = useFocusNode();

  return UseReturn(
    textReflection: textReflection.value,
    textFieldFocusNode: textFieldFocusNode,
  );
}
