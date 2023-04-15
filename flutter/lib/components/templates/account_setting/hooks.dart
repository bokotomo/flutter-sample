import 'package:flutter/material.dart'
    show
        ValueNotifier,
        TextEditingController,
        FocusNode,
        BuildContext,
        GlobalKey,
        FormState;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
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
    required this.formKeyNewName,
    required this.formKeyEditName,
  });

  final void Function() onPressedEdit;
  final void Function(BuildContext context) onPressedNewName;
  final TextEditingController textReflectionName;
  final FocusNode textReflectionNameFocusNode;
  final TextEditingController textReflectionNewName;
  final FocusNode textReflectionNewNameFocusNode;
  final GlobalKey<FormState> formKeyNewName;
  final GlobalKey<FormState> formKeyEditName;
}

/// ロジック
UseReturn useHooks(List<DomainReflectionGroup> reflectionGroups) {
  final ValueNotifier<TextEditingController> textReflectionName =
      useState<TextEditingController>(TextEditingController());
  final FocusNode textReflectionNameFocusNode = useFocusNode();
  final ValueNotifier<TextEditingController> textReflectionNewName =
      useState<TextEditingController>(TextEditingController());
  final FocusNode textReflectionNewNameFocusNode = useFocusNode();
  final GlobalKey<FormState> formKeyNewName = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyEditName = GlobalKey<FormState>();

  /// 振り返り名の変更を押した
  void onPressedEdit() {
    if (!formKeyEditName.currentState!.validate()) return;
    print("変更");
  }

  /// 新規振り返り名の追加を押した
  void onPressedNewName(BuildContext context) {
    if (!formKeyNewName.currentState!.validate()) return;

    print("追加");
    showModal(
      context,
      textReflectionNewName.value.text,
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
    formKeyNewName: formKeyNewName,
    formKeyEditName: formKeyEditName,
    textReflectionName: textReflectionName.value,
    textReflectionNameFocusNode: textReflectionNameFocusNode,
    textReflectionNewName: textReflectionNewName.value,
    textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
  );
}
