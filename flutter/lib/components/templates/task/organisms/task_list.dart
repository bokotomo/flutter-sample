import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/bar.dart' show Bar;
import 'package:gamer_reflection/components/templates/task/molecules/button_task.dart'
    show ButtonTask;
import 'package:gamer_reflection/modules/const/color/button.dart'
    show ConstantColorButton;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

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
    return Column(
      children: [
        for (int i = 0; i < reflections.length; i++) ...{
          const Bar(color: ConstantColorButton.buttonTaskListBorder),
          ButtonTask(
            text: reflections[i].text,
            isThin: i % 2 == 0,
            count: reflections[i].count,
            tagTextColor: reflections[i].tagColor,
            onPressed: () => onPressedTask(i),
          ),
        },
        const Bar(color: ConstantColorButton.buttonTaskListBorder),
        SpacerHeight.m,
      ],
    );
  }
}
