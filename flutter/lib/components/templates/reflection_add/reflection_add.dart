import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
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
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;

///
Widget view(
  BuildContext context,
  FocusNode textFieldFocusNode,
  List<DomainReflection> reflections,
  GlobalKey<FormState> formKey,
  TextEditingController textReflection,
  void Function() onPressedAddReflection,
  void Function(String) onPressedAddCandidate,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      const BasicText(
        text: '振り返りの種類',
        size: "M",
      ),
      SpacerHeight.m,
      const BasicText(
        text: '悪かった/良かった',
        size: "S",
      ),
      SpacerHeight.xm,
      const BasicText(
        text: '悪かった点',
        size: "M",
      ),
      SpacerHeight.m,
      InputText(
        text: textReflection,
        hintText: '振り返りを書く(30文字以内)',
        focusNode: textFieldFocusNode,
        formKey: formKey,
        maxLength: 30,
      ),
      SpacerHeight.xm,
      ReflectionAddCandidate(
        reflections: reflections,
        onPressCandidate: (String text) => onPressedAddCandidate(text),
      ),
      SpacerHeight.xm,
      ButtonBasic(
        icon: Icons.add,
        text: '追加する',
        onPressed: () => onPressedAddReflection(),
      ),
      SpacerHeight.xm,
    ],
  );

  return BaseLayout(
    title: "振り返りの追加",
    onTap: () => textFieldFocusNode.unfocus(),
    child: Form(
      key: formKey,
      child: cloumn,
    ),
  );
}

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends HookWidget {
  const TemplateReflectionAdd({
    super.key,
    required this.reflections,
  });
  final List<DomainReflection> reflections;

  @override
  Widget build(BuildContext context) {
    final handler = useHandler();

    return view(
      context,
      handler.textFieldFocusNode,
      reflections,
      handler.formKey,
      handler.textReflection,
      handler.onPressedAddReflection,
      handler.onPressedAddCandidate,
    );
  }
}
