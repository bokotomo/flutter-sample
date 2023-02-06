import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/input_text_form.dart'
    show InputTextForm;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/button_done.dart'
    show ButtonDone;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/templates/task_detail/handler.dart'
    show useHandler;

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
  final isGood = reflection?.reflectionType == ReflectionType.good;
  final count = reflection?.count ?? 0;
  final id = reflection?.id ?? 0;
  final detailNotExist = reflection?.detail == "";
  final reflectionText = reflection?.text ?? "";
  final reflectionDetail = reflection?.detail ?? "";

  final handler = useHandler(reflectionText, reflectionDetail);
  final titleForm = InputText(
    text: handler.title,
    hintText: "振り返り名",
    focusNode: titleTextFieldFocusNode,
  );
  final detailForm = InputTextForm(
    text: handler.detail,
    hintText: "振り返りを書きましょう。",
    focusNode: textFieldFocusNode,
  );
  final title = isEditMode
      ? titleForm
      : Box(
          child: BasicText(
            text: reflectionText,
            size: "M",
          ),
        );
  final detailBox = isEditMode
      ? detailForm
      : Box(
          child: detailNotExist
              ? const TextAnnotation(
                  text: "まだ追加していません",
                  size: "M",
                )
              : BasicText(
                  text: reflectionDetail,
                  size: "M",
                ),
        );

  ListView body = ListView(
    children: [
      const SizedBox(height: ConstantSizeUI.l4),
      title,
      const SizedBox(height: ConstantSizeUI.l4),
      Row(
        children: [
          BasicText(
            text: "回数: $count回",
            size: "M",
          ),
          const SizedBox(width: ConstantSizeUI.l4),
          BasicText(
            text: isGood ? "種類: 良かった点" : "種類: 悪かった点",
            size: "M",
          ),
        ],
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      BasicText(
        text: isGood ? "良かった点を伸ばすには" : "悪かった点の対策",
        size: "M",
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      detailBox,
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
      onTap: () => textFieldFocusNode.unfocus(),
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
