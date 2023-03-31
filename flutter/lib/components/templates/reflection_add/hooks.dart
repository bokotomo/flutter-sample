import 'package:flutter/material.dart'
    show TextEditingController, ValueNotifier, FocusNode, GlobalKey, FormState;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useFocusNode;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;

class UseReturn {
  const UseReturn({
    required this.onPressedAddReflection,
    required this.onPressedAddCandidate,
    required this.onPressedReflectionDone,
    required this.textReflection,
    required this.textFieldFocusNode,
    required this.formKey,
  });

  final void Function() onPressedAddReflection;
  final void Function(String) onPressedAddCandidate;
  final void Function() onPressedReflectionDone;
  final TextEditingController textReflection;
  final FocusNode textFieldFocusNode;
  final GlobalKey<FormState> formKey;
}

///
UseReturn useHooks() {
  final FocusNode textFieldFocusNode = useFocusNode();
  ValueNotifier<TextEditingController> textReflection =
      useState<TextEditingController>(TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// 振り返りの追加を押した
  void onPressedAddReflection() async {
    if (!formKey.currentState!.validate()) return;

    await RequestReflection().addReflection(textReflection.value.text);
    formKey.currentState?.reset();
  }

  /// 候補から振り返りの追加を押した
  void onPressedAddCandidate(String text) async {
    textReflection.value.text = text;
    textFieldFocusNode.unfocus();
  }

  /// 振り返りの終了を押した
  void onPressedReflectionDone() async {}

  return UseReturn(
    onPressedAddReflection: onPressedAddReflection,
    onPressedAddCandidate: onPressedAddCandidate,
    onPressedReflectionDone: onPressedReflectionDone,
    textReflection: textReflection.value,
    textFieldFocusNode: textFieldFocusNode,
    formKey: formKey,
  );
}
