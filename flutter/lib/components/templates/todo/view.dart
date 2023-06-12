import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, TextAlign;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/modules/domain/common/reflection_group.dart'
    show DomainReflectionGroup;

Widget view(
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  void Function(String?) onChangeReflectionGroup,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,

      /// 振り返りグループ選択ボタン
      SelectReflectionGroup(
        reflectionGroups: reflectionGroups,
        onChanged: onChangeReflectionGroup,
      ),

      SpacerHeight.s,

      const TextAnnotation(
        text: 'やることリスト',
        size: "M",
        textAlign: TextAlign.center,
      ),
    ],
  );

  return BaseLayoutPadding(
    title: "やることリスト",
    isBackGround: true,
    child: cloumn,
  );
}
