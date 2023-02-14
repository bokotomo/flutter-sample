import 'package:flutter/material.dart';
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

///
Widget view(
  BuildContext context,
  FocusNode titleFocusNode,
  FocusNode detailFocusNode,
  int taskId,
  DomainReflection? reflection,
  bool isEditMode,
  Function toggleEditMode,
  Function updateReflection,
  TextEditingController titleController,
  TextEditingController detailController,
) {
  final id = reflection?.id ?? 0;
  final handler = useHandler(titleController, detailController);

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
                handler.onPressedEditDone(id),
                toggleEditMode(),
                updateReflection(),
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
            handler.onPressedTaskDone(taskId, context),
            Navigator.pop(context)
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
class TemplateTaskDetail extends StatefulWidget {
  const TemplateTaskDetail({
    super.key,
    required this.taskId,
    required this.reflection,
    required this.updateReflection,
  });
  final int taskId;
  final DomainReflection? reflection;
  final Future<void> Function() updateReflection;

  @override
  State<TemplateTaskDetail> createState() => TemplateTaskDetailState();
}

/// テンプレート: タスク詳細
class TemplateTaskDetailState extends State<TemplateTaskDetail> {
  bool isEditMode = false;
  final titleFocusNode = FocusNode();
  final detailFocusNode = FocusNode();
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  void initState() {
    final reflectionText = widget.reflection?.text ?? "";
    final reflectionDetail = widget.reflection?.detail ?? "";
    titleController.text = reflectionText;
    detailController.text = reflectionDetail;
    print("foerijfoerijfoerijfoeirjfoier");
    print(reflectionText);
    print(reflectionDetail);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void toggleEditMode() {
      setState(() {
        isEditMode = !isEditMode;
      });
    }

    return view(
      context,
      titleFocusNode,
      detailFocusNode,
      widget.taskId,
      widget.reflection,
      isEditMode,
      toggleEditMode,
      widget.updateReflection,
      titleController,
      detailController,
    );
  }
}
