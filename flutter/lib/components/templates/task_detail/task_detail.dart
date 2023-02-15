import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/task_detail/organisms/top.dart'
    show TaskDetailTop;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/templates/task_detail/handler.dart'
    show useHandler;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/type/data_fetch.dart'
    show DataFetchState;

///
Widget view(
  BuildContext context,
  FocusNode titleFocusNode,
  FocusNode detailFocusNode,
  int taskId,
  DomainReflection? reflection,
  bool isEditMode,
  Function toggleEditMode,
  TextEditingController titleController,
  TextEditingController detailController,
  void Function() onPressedEditDone,
  void Function() onPressedTaskDone,
) {
  ListView body = ListView(
    children: [
      SpacerHeight.l,
      TaskDetailTop(
        reflection: reflection,
        isEditMode: isEditMode,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        titleController: titleController,
        detailController: detailController,
      ),
      SpacerHeight.m,
      isEditMode
          ? ButtonBasic(
              icon: Icons.check_circle,
              text: "編集を完了する",
              onPressed: () => {
                onPressedEditDone(),
              },
            )
          : ButtonBasic(
              icon: Icons.edit,
              text: "編集する",
              onPressed: () => toggleEditMode(),
            ),
      SpacerHeight.m,
      if (!isEditMode)
        ButtonDone(
          text: "このタスクを完了する",
          onPressed: () => {
            onPressedTaskDone(),
            Navigator.pop(context),
          },
        ),
    ],
  );

  return BaseLayout(
    title: "タスク詳細",
    onTap: () => {
      titleFocusNode.unfocus(),
      detailFocusNode.unfocus(),
    },
    child: body,
  );
}

/// ページ: タスク一覧
class TemplateTaskDetail extends HookWidget {
  const TemplateTaskDetail({
    super.key,
    required this.dataFetchState,
    required this.taskId,
    required this.reflection,
    required this.updateReflection,
  });
  final DataFetchState dataFetchState;
  final int taskId;
  final DomainReflection? reflection;
  final Future<void> Function() updateReflection;

  @override
  Widget build(BuildContext context) {
    final handler = useHandler(taskId, reflection, updateReflection);

    return view(
      context,
      handler.titleFocusNode,
      handler.detailFocusNode,
      taskId,
      reflection,
      handler.isEditMode,
      handler.toggleEditMode,
      handler.titleController,
      handler.detailController,
      handler.onPressedEditDone,
      handler.onPressedTaskDone,
    );
  }
}
