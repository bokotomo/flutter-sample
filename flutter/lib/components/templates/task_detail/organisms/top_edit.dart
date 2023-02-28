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
    final isGood = reflection?.reflectionType == ReflectionType.good;
    final count = reflection?.count ?? 0;

    final titleForm = InputText(
      text: titleController,
      hintText: "振り返り名",
      focusNode: titleFocusNode,
    );
    final detailForm = InputTextForm(
      text: detailController,
      hintText: "振り返りを書きましょう。",
      focusNode: detailFocusNode,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleForm,
        SpacerHeight.xm,
        Row(
          children: [
            TextTag(
              text: "回数: $count回",
              colorType: TagTextColor.gray,
            ),
            SpacerWidth.m,
            TextTag(
              text: isGood ? "種類: 良かった点" : "種類: 悪かった点",
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
