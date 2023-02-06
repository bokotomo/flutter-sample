import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/input_text_form.dart'
    show InputTextForm;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;

/// タスク詳細上部
class TaskDetailTop extends StatelessWidget {
  const TaskDetailTop({
    super.key,
    required this.reflection,
    required this.isEditMode,
    required this.titleTextFieldFocusNode,
    required this.textFieldFocusNode,
    required this.titleController,
    required this.detailController,
  });

  /// 文字
  final DomainReflection? reflection;

  /// 編集モードか
  final bool isEditMode;

  /// FocusNode title
  final FocusNode titleTextFieldFocusNode;

  /// FocusNode detail
  final FocusNode textFieldFocusNode;

  /// EditingController: title
  final TextEditingController titleController;

  /// EditingController: detail
  final TextEditingController detailController;

  @override
  Widget build(BuildContext context) {
    final isGood = reflection?.reflectionType == ReflectionType.good;
    final count = reflection?.count ?? 0;
    final id = reflection?.id ?? 0;
    final detailNotExist = reflection?.detail == "";
    final reflectionText = reflection?.text ?? "";
    final reflectionDetail = reflection?.detail ?? "";

    final titleForm = InputText(
      text: titleController,
      hintText: "振り返り名",
      focusNode: titleTextFieldFocusNode,
    );
    final detailForm = InputTextForm(
      text: detailController,
      hintText: "振り返りを書きましょう。",
      focusNode: textFieldFocusNode,
    );
    final title = isEditMode
        ? titleForm
        : Box(
            child: BasicText(
              text: reflectionText,
              size: "M",
            ),
          );
    final detailBox = isEditMode
        ? detailForm
        : Box(
            child: detailNotExist
                ? const TextAnnotation(
                    text: "まだ追加していません",
                    size: "M",
                  )
                : BasicText(
                    text: reflectionDetail,
                    size: "M",
                  ),
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: ConstantSizeUI.l4),
        title,
        const SizedBox(height: ConstantSizeUI.l4),
        Row(
          children: [
            BasicText(
              text: "回数: $count回",
              size: "M",
            ),
            const SizedBox(width: ConstantSizeUI.l4),
            BasicText(
              text: isGood ? "種類: 良かった点" : "種類: 悪かった点",
              size: "M",
            ),
          ],
        ),
        const SizedBox(height: ConstantSizeUI.l4),
        BasicText(
          text: isGood ? "良かった点を伸ばすには" : "悪かった点の対策",
          size: "M",
        ),
        const SizedBox(height: ConstantSizeUI.l4),
        detailBox,
      ],
    );
  }
}
