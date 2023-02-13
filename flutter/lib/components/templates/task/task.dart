import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/molecules/button_task.dart'
    show ButtonTask;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/task/organisms/no_data_annotation.dart'
    show TaskNoDataAnnotation;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

///
Widget view(
  List<DomainReflection> reflections,
  BuildContext context,
  Function(BuildContext context, int taskId) pushTaskDetail,
) {
  /// 振り返り一覧
  ListView reflectionList = ListView(
    children: [
      const SizedBox(height: ConstantSizeUI.l3),
      const BasicText(text: "振り返り名A", size: "M"),
      const SizedBox(height: ConstantSizeUI.l3),
      for (int i = 0; i < reflections.length; i++) ...{
        if (i != 0) const SizedBox(height: ConstantSizeUI.l3),
        ButtonTask(
          text: reflections[i].text,
          onPressed: () => pushTaskDetail(context, reflections[i].id),
        ),
      }
    ],
  );

  return BaseLayout(
    title: "タスク",
    child: reflections.isEmpty ? const TaskNoDataAnnotation() : reflectionList,
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
