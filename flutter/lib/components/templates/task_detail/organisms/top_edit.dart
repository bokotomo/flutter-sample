import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/input_text_form.dart'
    show InputTextForm;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/components/common/atoms/text_tag.dart'
    show TextTag;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/spacer_width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;

/// タスク詳細上部編集モード
class TaskDetailTopEdit extends StatelessWidget {
  const TaskDetailTopEdit({
    super.key,
    required this.reflection,
    required this.titleFocusNode,
    required this.detailFocusNode,
    required this.titleController,
    required this.detailController,
  });

  /// 文字
  final DomainReflection? reflection;

  /// FocusNode title
  final FocusNode titleFocusNode;

  /// FocusNode detail
  final FocusNode detailFocusNode;

  /// EditingController: title
  final TextEditingController titleController;

  /// EditingController: detail
  final TextEditingController detailController;

  @override
  Widget build(BuildContext context) {
    final bool isGood = reflection?.reflectionType == ReflectionType.good;
    final int count = reflection?.count ?? 0;
    final String countText = "回数: $count回";
    final String reflectionTypeText = isGood ? "種類: 良かった点" : "種類: 悪かった点";

    final InputText titleForm = InputText(
      text: titleController,
      hintText: "振り返り名(30文字以内)",
      focusNode: titleFocusNode,
      maxLength: 30,
    );
    final InputTextForm detailForm = InputTextForm(
      text: detailController,
      hintText: "対策方法を書きましょう。(1000文字以内)",
      focusNode: detailFocusNode,
      maxLength: 50, // TODO デバックで50
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleForm,
        SpacerHeight.xm,
        Row(
          children: [
            TextTag(
              text: countText,
              colorType: TagTextColor.gray,
            ),
            SpacerWidth.m,
            TextTag(
              text: reflectionTypeText,
              colorType: TagTextColor.gray,
            ),
          ],
        ),
        SpacerHeight.xm,
        BasicText(
          text: isGood ? "良かった点を伸ばすには" : "悪かった点の対策",
          size: "M",
        ),
        SpacerHeight.m,
        detailForm,
      ],
    );
  }
}
