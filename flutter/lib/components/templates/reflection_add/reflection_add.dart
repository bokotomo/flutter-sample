import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/input_text.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/reflection_add/organisms/candidate.dart'
    show ReflectionAddCandidate;
import 'package:gamer_reflection/components/templates/reflection_add/handler.dart'
    show useHandler;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

///
Widget view(
  BuildContext context,
  FocusNode textFieldFocusNode,
  List<DomainReflection> reflections,
) {
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
      ReflectionAddCandidate(
        reflections: reflections,
        onPressCandidate: (String text) => handler.onPressedAddCandidate(text),
      ),
      const SizedBox(height: ConstantSizeUI.l4),
      ButtonBasic(
        icon: Icons.add,
        text: '追加する',
        onPressed: () => handler.onPressedAddReflection(),
      ),
      const SizedBox(height: ConstantSizeUI.l4),
    ],
  );

  return BaseLayout(
    title: "振り返りの追加",
    onTap: () => textFieldFocusNode.unfocus(),
    child: cloumn,
  );
}

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends StatefulWidget {
  const TemplateReflectionAdd({
    super.key,
    required this.reflections,
  });
  final List<DomainReflection> reflections;

  @override
  State<TemplateReflectionAdd> createState() => TemplateReflectionAddState();
}

/// テンプレート: タスク詳細
class TemplateReflectionAddState extends State<TemplateReflectionAdd> {
  final textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return view(
      context,
      textFieldFocusNode,
      widget.reflections,
    );
  }
}
