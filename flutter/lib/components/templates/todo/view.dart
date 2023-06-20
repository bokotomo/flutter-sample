import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Column, CrossAxisAlignment;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/templates/todo/organisms/no_data_annotation.dart'
    show TaskNoDataAnnotation;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/card.dart' show Card;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/domain/todo/todo.dart' show DomainTodo;

Widget view(
  BuildContext context,
  List<DomainTodo> todos,
  List<DomainReflectionGroup> reflectionGroups,
  void Function(String?) onChangeReflectionGroup,
  void Function(int) onClickRemove,
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

      /// ない場合
      if (todos.isEmpty) const TaskNoDataAnnotation(),

      /// やること一覧
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
              TextAnnotation(
                text: todos[i].subTitle,
                size: "S",
              ),
            ],
          ),
          onClickRemove: () => onClickRemove(todos[i].reflectionId),
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
