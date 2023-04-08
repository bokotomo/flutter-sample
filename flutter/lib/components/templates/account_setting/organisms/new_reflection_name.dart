import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        TextEditingController,
        FocusNode,
        Column,
        CrossAxisAlignment,
        BuildContext,
        Icons;
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
  TextEditingController textReflectionNewName,
  FocusNode textReflectionNewNameFocusNode,
) {
  return Box(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BasicText(
          text: '振り返り名の新規作成',
          size: "M",
        ),
        SpacerHeight.xs,
        const TextAnnotation(
          text: "※20文字まで",
          size: "S",
        ),
        SpacerHeight.m,
        InputText(
          text: textReflectionNewName,
          hintText: 'ゲーム名+キャラ名など',
          focusNode: textReflectionNewNameFocusNode,
          maxLength: 20,
        ),
        SpacerHeight.m,
        const ButtonIcon(
          icon: Icons.add,
          text: "新規で作成する",
          // onPressed: () => {},
        )
      ],
    ),
  );
}

/// 振り返り名の追加
class NewReflectionName extends StatelessWidget {
  const NewReflectionName({
    super.key,
    required this.textReflectionNewNameFocusNode,
    required this.textReflectionNewName,
  });

  ///
  final FocusNode textReflectionNewNameFocusNode;

  ///
  final TextEditingController textReflectionNewName;

  @override
  Widget build(BuildContext context) {
    return view(
      textReflectionNewName,
      textReflectionNewNameFocusNode,
    );
  }
}
