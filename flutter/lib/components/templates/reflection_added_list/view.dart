import 'package:flutter/material.dart'
    show Widget, BuildContext, ListView, Column;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/reflection_added_list/molecules/button_task_candidate.dart'
    show ButtonTaskCandidate;

///
Widget view(
  BuildContext context,
  List<DomainReflectionAdded> reflections,
  Future<bool> Function(BuildContext) onWillPop,
  void Function(String) onClickRemove,
) {
  ListView column = ListView(
    children: [
      Column(
        children: [
          for (int i = 0; i < reflections.length; i++) ...{
            const Bar(
              color: ConstantColorButton.taskListBorder,
            ),
            ButtonTaskCandidate(
              text: reflections[i].text,
              isThin: i % 2 == 0,
              count: reflections[i].count,
              onClickRemove: () => onClickRemove(reflections[i].text),
            ),
          },
          const Bar(
            color: ConstantColorButton.taskListBorder,
          )
        ],
      ),
      SpacerHeight.xl,
    ],
  );

  return BaseLayout(
    title: "追加した振り返り",
    child: column,
    onWillPop: () => onWillPop(context),
  );
}
