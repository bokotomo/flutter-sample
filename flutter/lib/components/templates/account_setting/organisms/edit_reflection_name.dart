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
  TextEditingController textReflectionName,
  FocusNode textReflectionNameFocusNode,
  void Function() onPressedEdit,
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
            text: '振り返り名の変更',
            size: "M",
          ),
          SpacerHeight.xs,
          const TextAnnotation(
            text: "※20文字まで",
            size: "S",
          ),
          SpacerHeight.m,
          InputText(
            text: textReflectionName,
            hintText: 'ゲーム名+キャラ名など',
            focusNode: textReflectionNameFocusNode,
            maxLength: 20,
          ),
          SpacerHeight.m,
          ButtonIcon(
            icon: Icons.edit,
            text: "変更する",
            onPressed: () => onPressedEdit(),
          )
        ],
      ),
    ),
  );
}

/// 振り返り名変更
class EditReflectionName extends StatelessWidget {
  const EditReflectionName({
    super.key,
    required this.textReflectionNameFocusNode,
    required this.textReflectionName,
    required this.onPressedEdit,
    required this.formKey,
  });

  ///
  final FocusNode textReflectionNameFocusNode;

  ///
  final TextEditingController textReflectionName;

  ///
  final Function() onPressedEdit;

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return view(
      textReflectionName,
      textReflectionNameFocusNode,
      onPressedEdit,
      formKey,
    );
  }
}
