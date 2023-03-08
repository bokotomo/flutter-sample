import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
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

/// タスク詳細上部
class TaskDetailTop extends StatelessWidget {
  const TaskDetailTop({
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
    final bool detailNotExist = reflection?.detail == "";
    final String reflectionText = reflection?.text ?? "";
    final String reflectionDetail = reflection?.detail ?? "";
    final String countText = "回数: $count回";
    final String reflectionTypeText = isGood ? "種類: 良かった点" : "種類: 悪かった点";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Box(
          child: BasicText(
            text: reflectionText,
            size: "M",
          ),
        ),
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
        Box(
          child: detailNotExist
              ? const TextAnnotation(
                  text: "まだ追加していません",
                  size: "M",
                )
              : BasicText(
                  text: reflectionDetail,
                  size: "M",
                ),
        ),
      ],
    );
  }
}
