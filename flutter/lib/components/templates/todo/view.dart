import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Column, CrossAxisAlignment;
import 'package:gamer_reflection/modules/const/color/hooks.dart' show UseColor;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/templates/todo/organisms/no_data_annotation.dart'
    show TodoNoDataAnnotation;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/card.dart' show Card;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/domain/todo/todo.dart' show DomainTodo;

Widget view(
  AppLocalizations i18n,
  UseColor color,
  BuildContext context,
  List<DomainTodo>? todos,
  List<DomainReflectionGroup> reflectionGroups,
  void Function(String?) onChangeReflectionGroup,
  void Function(int) onClickRemove,
  void Function(BuildContext, int) pushSolutionDetail,
) {
  ListView cloumn = ListView(
    children: todos == null
        ? []
        : [
            SpacerHeight.m,

            /// 振り返りグループ選択ボタン
            SelectReflectionGroup(
              color: color,
              reflectionGroups: reflectionGroups,
              onChanged: onChangeReflectionGroup,
            ),

            SpacerHeight.m,

            /// ない場合
            if (todos.isEmpty)
              TodoNoDataAnnotation(
                i18n: i18n,
                color: color,
              ),

            /// やること一覧
            for (int i = 0; i < todos.length; i++) ...{
              Card(
                color: color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicText(
                      color: color,
                      text: todos[i].title,
                      size: "M",
                      isBold: true,
                      isNoSelect: true,
                    ),
                    SpacerHeight.s,
                    TextAnnotation(
                      color: color,
                      text: todos[i].subTitle,
                      size: "XS",
                    ),
                  ],
                ),
                onPressed: () =>
                    pushSolutionDetail(context, todos[i].reflectionId),
                onPressedRemove: () => onClickRemove(todos[i].reflectionId),
              ),
              SpacerHeight.m,
            }
          ],
  );

  return BaseLayoutPadding(
    i18n: i18n,
    color: color,
    title: i18n.pageTodoTitle,
    isBackGround: true,
    child: cloumn,
  );
}
