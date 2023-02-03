import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/templates/reflection_add/handler.dart'
    show useHandler;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

Widget view(BuildContext context, FocusNode textFieldFocusNode) {
  final handler = useHandler();
  ListView cloumn = ListView(
    children: [
      const SizedBox(height: ConstantSizeUI.l3),
      const BasicText(
        text: '振り返りの種類',
        size: "M",
      ),
      const SizedBox(height: ConstantSizeUI.l3),
      const BasicText(
        text: '悪かった/良かった',
        size: "S",
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      const BasicText(
        text: '悪かった点',
        size: "M",
      ),
      const SizedBox(height: ConstantSizeUI.l3),
      InputText(
        text: handler.textReflection,
        hintText: '悪かった点を書く(40文字以内)',
        onChanged: handler.onChanged,
        focusNode: textFieldFocusNode,
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      const BasicText(
        text: 'もしかして？',
        size: "M",
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      const Box(
        child: TextAnnotation(
          text: 'まだ振り返りを追加していません。',
          size: "M",
        ),
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      ButtonBasic(
        icon: Icons.add,
        text: '追加する',
        onPressed: () => handler.onPressedAddReflection(),
      ),
    ],
  );

  Padding content = Padding(
    padding: const EdgeInsets.only(
      left: ConstantSizeUI.l3,
      right: ConstantSizeUI.l3,
    ),
    child: cloumn,
  );

  Scaffold wrapper = Scaffold(
    backgroundColor: ConstantColor.content,
    appBar: const Header(title: "振り返りの追加"),
    body: GestureDetector(
      onTap: () => textFieldFocusNode.unfocus(),
      child: content,
    ),
  );

  return wrapper;
}

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends StatefulWidget {
  const TemplateReflectionAdd({super.key});

  @override
  State<TemplateReflectionAdd> createState() => TemplateReflectionAddState();
}

/// テンプレート: タスク詳細
class TemplateReflectionAddState extends State<TemplateReflectionAdd> {
  final textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return view(context, textFieldFocusNode);
  }
}
