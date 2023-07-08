import 'package:flutter/material.dart'
    show
        StatelessWidget,
        FocusNode,
        TextEditingController,
        Widget,
        BuildContext,
        Column,
        Row,
        CrossAxisAlignment;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/domain/solution_detail/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/components/common/atoms/text_tag.dart'
    show TextTag;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/spacer/width.dart'
    show SpacerWidth;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;
import 'package:intl/intl.dart' show DateFormat;

/// タスク詳細上部
class SolutionDetailTop extends StatelessWidget {
  const SolutionDetailTop({
    super.key,
    required this.i18n,
    required this.reflection,
    required this.titleFocusNode,
    required this.detailFocusNode,
    required this.titleController,
    required this.detailController,
  });

  /// 言語
  final AppLocalizations i18n;

  /// 文字
  final DomainSolutionDetailReflection? reflection;

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
    final String countText = i18n.solutionDetailPageTopCountValue(count);
    final String reflectionTypeText = isGood
        ? i18n.solutionDetailPageTopTypeGood
        : i18n.solutionDetailPageTopTypeBad;
    final String detailTitle = isGood
        ? i18n.solutionDetailPageTopDetailGood
        : i18n.solutionDetailPageTopDetailBad;
    final String updateAtText = DateFormat("yyyy.MM.dd")
        .format(reflection?.updatedAt ?? DateTime.now());
    final String reflectionUpdateAtText =
        i18n.solutionDetailPageTopUpdateAt(updateAtText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Box(
          child: BasicText(
            text: reflectionText,
            size: "M",
          ),
        ),
        SpacerHeight.m,
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
        SpacerHeight.m,
        TextTag(
          text: reflectionUpdateAtText,
          colorType: TagTextColor.gray,
        ),
        SpacerHeight.m,
        BasicText(
          text: detailTitle,
          size: "M",
        ),
        SpacerHeight.m,
        Box(
          child: detailNotExist
              ? TextAnnotation(
                  text: i18n.solutionDetailPageTopNoData,
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
