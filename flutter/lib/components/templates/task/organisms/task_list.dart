import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/task/molecules/button_task.dart'
    show ButtonTask;
import 'package:gamer_reflection/modules/const/color.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;

/// 優先度からTagの色を返す
TagTextColor getTagColor(int priority) {
  switch (priority) {
    case 1:
      return TagTextColor.red;
    case 2:
      return TagTextColor.purple;
    default:
      return TagTextColor.blue;
  }
}

/// タスク一覧: タスクの一覧
class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.reflections,
    required this.onPressedTask,
  });

  /// 振り返り一覧
  final List<DomainReflection> reflections;

  /// タスクリストアイテムを押した
  final Function(int) onPressedTask;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SpacerHeight.m,
        const BasicText(text: "振り返り名A", size: "M"),
        SpacerHeight.m,
        for (int i = 0; i < reflections.length; i++) ...{
          const Bar(color: ConstantColorButton.buttonTaskListBorder),
          ButtonTask(
            text: reflections[i].text,
            isThin: i % 2 == 0,
            count: reflections[i].count,
            tagTextColor: getTagColor(reflections[i].priority),
            onPressed: () => onPressedTask(i),
          ),
        },
        const Bar(color: ConstantColorButton.buttonTaskListBorder),
      ],
    );
  }
}
