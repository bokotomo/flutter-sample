import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Column, CrossAxisAlignment, TextAlign;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/card.dart' show Card;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/modules/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/domain/todo/todo.dart' show DomainTodo;

Widget view(
  BuildContext context,
  List<DomainTodo> todos,
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

      SpacerHeight.m,

      for (int i = 0; i < todos.length; i++) ...{
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BasicText(
                text: todos[i].title,
                size: "M",
              ),
              SpacerHeight.m,
              BasicText(
                text: todos[i].subTitle,
                size: "M",
              ),
            ],
          ),
        ),
        SpacerHeight.m,
      }
    ],
  );

  return BaseLayoutPadding(
    title: "やることリスト",
    isBackGround: true,
    child: cloumn,
  );
}
