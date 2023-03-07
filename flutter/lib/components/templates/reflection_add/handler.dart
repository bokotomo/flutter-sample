import 'package:flutter/material.dart'
    show TextEditingController, ValueNotifier, FocusNode, GlobalKey, FormState;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useFocusNode;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;

class UseReturn {
  const UseReturn({
    required this.onPressedAddReflection,
    required this.onPressedAddCandidate,
    required this.textReflection,
    required this.textFieldFocusNode,
    required this.formKey,
  });

  final void Function() onPressedAddReflection;
  final void Function(String) onPressedAddCandidate;
  final TextEditingController textReflection;
  final FocusNode textFieldFocusNode;
  final GlobalKey<FormState> formKey;
}

///
UseReturn useHandler() {
  final textFieldFocusNode = useFocusNode();
  ValueNotifier<TextEditingController> textReflection =
      useState<TextEditingController>(TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// 振り返りの追加を押した
  void onPressedAddReflection() async {
    print(textReflection.value.text);
    if (!formKey.currentState!.validate()) {
      print(formKey.toString());
      return;
    }

    if (textReflection.value.text == "") return;
    await RequestReflection().addReflection(textReflection.value.text);
    textReflection.value.clear();
  }

  /// 候補から振り返りの追加を押した
  void onPressedAddCandidate(String text) async {
    textReflection.value.text = text;
  }

  return UseReturn(
    onPressedAddReflection: onPressedAddReflection,
    onPressedAddCandidate: onPressedAddCandidate,
    textReflection: textReflection.value,
    textFieldFocusNode: textFieldFocusNode,
    formKey: formKey,
  );
}
