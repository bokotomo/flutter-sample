import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget, useState;
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/input_text/widget.dart'
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
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:gamer_reflection/components/common/atoms/radio_good_bad_button.dart'
    show RadioGoodBadButton;

/// タスク詳細上部編集モード
class TaskDetailTopEdit extends HookWidget {
  const TaskDetailTopEdit({
    super.key,
    required this.reflection,
    required this.titleFocusNode,
    required this.detailFocusNode,
    required this.titleController,
    required this.detailController,
    required this.groupValue,
    required this.onChangedGood,
    required this.onChangedBad,
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

  /// 振り返り種類の良い悪い
  final String groupValue;

  /// 良いを押した
  final Function(String?) onChangedGood;

  /// 悪いを押した
  final Function(String?) onChangedBad;

  @override
  Widget build(BuildContext context) {
    final bool isGood = reflection?.reflectionType == ReflectionType.good;
    final int count = reflection?.count ?? 0;
    final String countText = "回数: $count回";

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
        SpacerHeight.m,
        TextTag(
          text: countText,
          colorType: TagTextColor.gray,
        ),
        SpacerHeight.m,
        RadioGoodBadButton(
          groupValue: groupValue,
          onChangedGood: onChangedGood,
          onChangedBad: onChangedBad,
        ),
        SpacerHeight.m,
        BasicText(
          text: isGood ? "良かった点を伸ばすには" : "対策方法",
          size: "M",
        ),
        SpacerHeight.m,
        detailForm,
      ],
    );
  }
}
