import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        FocusNode,
        TextEditingController,
        GlobalKey,
        FormState,
        ListView,
        EdgeInsets,
        Icons,
        Form;
import 'package:gamer_reflection/components/templates/task_detail/organisms/top.dart'
    show TaskDetailTop;
import 'package:gamer_reflection/components/templates/task_detail/organisms/top_edit.dart'
    show TaskDetailTopEdit;
import 'package:gamer_reflection/components/common/atoms/button/done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button/icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/atoms/button/cancel.dart'
    show ButtonCancel;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
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
  final String groupValue,
  void Function() onPressedEditDone,
  void Function(BuildContext) onPressedTaskDone,
  void Function() onPressedCancel,
  final Function(String?) onChangedGood,
  final Function(String?) onChangedBad,
) {
  ListView content = ListView(
    padding: const EdgeInsets.symmetric(horizontal: ConstantSizeUI.l2),
    children: [
      SpacerHeight.m,
      TaskDetailTop(
        reflection: reflection,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        titleController: titleController,
        detailController: detailController,
      ),
      SpacerHeight.xm,
      ButtonIcon(
        icon: Icons.edit,
        text: "編集する",
        onPressed: () => toggleEditMode(),
      ),
      SpacerHeight.xm,
      ButtonDone(
        text: "このタスクを完了する",
        onPressed: () => {
          onPressedTaskDone(context),
        },
      ),
    ],
  );

  ListView editContent = ListView(
    padding: const EdgeInsets.symmetric(horizontal: ConstantSizeUI.l2),
    children: [
      SpacerHeight.m,
      TaskDetailTopEdit(
        reflection: reflection,
        titleFocusNode: titleFocusNode,
        detailFocusNode: detailFocusNode,
        groupValue: groupValue,
        titleController: titleController,
        detailController: detailController,
        onChangedGood: onChangedGood,
        onChangedBad: onChangedBad,
      ),
      SpacerHeight.xm,
      ButtonIcon(
        icon: Icons.check_circle,
        text: "編集を完了",
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
