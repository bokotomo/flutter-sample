import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/templates/task_detail/organisms/top.dart'
    show TaskDetailTop;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/templates/task_detail/handler.dart'
    show useHandler;
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;

///
Widget view(
  BuildContext context,
  FocusNode titleTextFieldFocusNode,
  FocusNode textFieldFocusNode,
  int taskId,
  DomainReflection? reflection,
  bool isEditMode,
  Function toggleEditMode,
  Function updateReflection,
) {
  final id = reflection?.id ?? 0;
  final reflectionText = reflection?.text ?? "";
  final reflectionDetail = reflection?.detail ?? "";
  final handler = useHandler(reflectionText, reflectionDetail);
  TextEditingController textR = TextEditingController();

  ListView body = ListView(
    children: [
      const SizedBox(height: ConstantSizeUI.l4),
      InputText(
        text: textR,
        hintText: "振り返り名",
        // focusNode: titleTextFieldFocusNode,
        onChanged: (String t) => {print(t)},
      ),
      TaskDetailTop(
        reflection: reflection,
        isEditMode: isEditMode,
        titleTextFieldFocusNode: titleTextFieldFocusNode,
        textFieldFocusNode: textFieldFocusNode,
        titleController: handler.title,
        detailController: handler.detail,
      ),
      const SizedBox(height: ConstantSizeUI.l4),
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
      const SizedBox(height: ConstantSizeUI.l4),
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

  Padding content = Padding(
    padding: const EdgeInsets.only(
      left: ConstantSizeUI.l3,
      right: ConstantSizeUI.l3,
    ),
    child: body,
  );

  Scaffold wrapper = Scaffold(
    backgroundColor: ConstantColor.content,
    appBar: const Header(title: "タスク"),
    body: GestureDetector(
      onTap: () => {
        // titleTextFieldFocusNode.unfocus(),
        // textFieldFocusNode.unfocus(),
      },
      child: content,
    ),
  );

  return wrapper;
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
  final titleTextFieldFocusNode = FocusNode();
  final textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    void toggleEditMode() {
      setState(() {
        isEditMode = !isEditMode;
      });
    }

    return view(
      context,
      titleTextFieldFocusNode,
      textFieldFocusNode,
      widget.taskId,
      widget.reflection,
      isEditMode,
      toggleEditMode,
      widget.updateReflection,
    );
  }
}
