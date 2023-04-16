import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        TextEditingController,
        FocusNode,
        Column,
        CrossAxisAlignment,
        BuildContext,
        Icons,
        Form,
        GlobalKey,
        FormState,
        AutovalidateMode;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/input_text/widget.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button_icon.dart'
    show ButtonIcon;

Widget view(
  BuildContext context,
  TextEditingController textReflectionNewName,
  FocusNode textReflectionNewNameFocusNode,
  Function(BuildContext context) onPressedNewName,
  GlobalKey<FormState> formKey,
) {
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: formKey,
    child: Box(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BasicText(
            text: '振り返りの新規作成',
            size: "M",
          ),
          SpacerHeight.m,
          InputText(
            text: textReflectionNewName,
            hintText: 'ゲーム名+キャラ名など',
            focusNode: textReflectionNewNameFocusNode,
            maxLength: 20,
          ),
          SpacerHeight.m,
          ButtonIcon(
            icon: Icons.add,
            text: "新規で作成する",
            onPressed: () => onPressedNewName(context),
          )
        ],
      ),
    ),
  );
}

/// 振り返り名の追加
class NewReflectionName extends StatelessWidget {
  const NewReflectionName({
    super.key,
    required this.textReflectionNewNameFocusNode,
    required this.textReflectionNewName,
    required this.onPressedNewName,
    required this.formKey,
  });

  ///
  final FocusNode textReflectionNewNameFocusNode;

  ///
  final TextEditingController textReflectionNewName;

  ///
  final Function(BuildContext context) onPressedNewName;

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return view(
      context,
      textReflectionNewName,
      textReflectionNewNameFocusNode,
      onPressedNewName,
      formKey,
    );
  }
}
