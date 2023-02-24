import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/molecules/button_task.dart'
    show ButtonTask;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/task/organisms/no_data_annotation.dart'
    show TaskNoDataAnnotation;
import 'package:gamer_reflection/modules/const/color.dart';
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
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

///
Widget view(
  List<DomainReflection> reflections,
  BuildContext context,
  Function(BuildContext context, int taskId) pushTaskDetail,
) {
  /// 振り返り一覧
  ListView reflectionList = ListView(
    children: [
      SpacerHeight.m,
      const BasicText(text: "振り返り名A", size: "M"),
      SpacerHeight.m,
      for (int i = 0; i < reflections.length; i++) ...{
        const Divider(
          height: 1,
          thickness: 1,
          color: ConstantColor.buttonTaskListBorder,
        ),
        ButtonTask(
          text: reflections[i].text,
          isThin: i % 2 == 0,
          count: reflections[i].count,
          tagTextColor: getTagColor(reflections[i].priority),
          onPressed: () => pushTaskDetail(context, reflections[i].id),
        ),
      },
      const Divider(
        height: 1,
        thickness: 1,
        color: ConstantColor.buttonTaskListBorder,
      ),
    ],
  );

  final layoutChild =
      reflections.isEmpty ? const TaskNoDataAnnotation() : reflectionList;

  return BaseLayout(
    title: "タスク",
    child: layoutChild,
  );
}

/// テンプレート: タスク一覧
class TemplateTask extends StatelessWidget {
  const TemplateTask({
    super.key,
    required this.reflections,
    required this.pushTaskDetail,
  });

  /// 振り返り一覧
  final List<DomainReflection> reflections;

  /// クリックした
  final void Function(BuildContext context, int taskId) pushTaskDetail;

  @override
  Widget build(BuildContext context) {
    return view(
      reflections,
      context,
      pushTaskDetail,
    );
  }
}
