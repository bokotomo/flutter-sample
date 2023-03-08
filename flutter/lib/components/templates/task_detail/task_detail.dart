import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/task_detail/organisms/top.dart'
    show TaskDetailTop;
import 'package:gamer_reflection/components/templates/task_detail/organisms/top_edit.dart'
    show TaskDetailTopEdit;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/atoms/button_cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/templates/task_detail/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/type/data_fetch.dart'
    show DataFetchState;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

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
  GlobalKey<FormState> formKey,
  void Function() onPressedEditDone,
  void Function() onPressedTaskDone,
  void Function() onPressedCancel,
) {
  ListView content = ListView(
    padding: const EdgeInsets.all(ConstantSizeUI.l2),
    children: [
      SpacerHeight.l,
      TaskDetailTop(
        reflection: reflection,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        titleController: titleController,
        detailController: detailController,
      ),
      SpacerHeight.xm,
      ButtonBasic(
        icon: Icons.edit,
        text: "編集する",
        onPressed: () => toggleEditMode(),
      ),
      SpacerHeight.xm,
      ButtonDone(
        text: "このタスクを完了する",
        onPressed: () => {
          onPressedTaskDone(),
          Navigator.pop(context),
        },
      ),
    ],
  );

  ListView editContent = ListView(
    padding: const EdgeInsets.all(ConstantSizeUI.l2),
    children: [
      SpacerHeight.l,
      TaskDetailTopEdit(
        reflection: reflection,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        titleController: titleController,
        detailController: detailController,
      ),
      SpacerHeight.xm,
      ButtonBasic(
        icon: Icons.check_circle,
        text: "編集を完了する",
        onPressed: () => onPressedEditDone(),
      ),
      SpacerHeight.xm,
      ButtonCancel(
        text: "キャンセル",
        onPressed: () => onPressedCancel(),
      ),
    ],
  );

  Form form = Form(
    key: formKey,
    child: editContent,
  );

  return BaseLayout(
    title: "タスク詳細",
    onTap: () => {
      titleFocusNode.unfocus(),
      detailFocusNode.unfocus(),
    },
    child: isEditMode ? form : content,
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
    final hooks = useHooks(taskId, reflection, updateReflection);

    return view(
      context,
      hooks.titleFocusNode,
      hooks.detailFocusNode,
      taskId,
      reflection,
      hooks.isEditMode,
      hooks.toggleEditMode,
      hooks.titleController,
      hooks.detailController,
      hooks.formKey,
      hooks.onPressedEditDone,
      hooks.onPressedTaskDone,
      hooks.onPressedCancel,
    );
  }
}
