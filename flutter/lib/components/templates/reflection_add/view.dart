import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        FocusNode,
        GlobalKey,
        FormState,
        TextEditingController,
        ListView,
        Column,
        Expanded,
        Form,
        AutovalidateMode;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/reflection_add/organisms/candidate.dart'
    show ReflectionAddCandidate;
import 'package:gamer_reflection/components/templates/reflection_add/organisms/bottom_contents.dart'
    show BottomContents;
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
  void Function() onPressedReflectionDone,
) {
  ListView cloumn = ListView(
    children: [
      // SpacerHeight.m,
      ReflectionAddCandidate(
        reflections: reflections,
        onPressCandidate: (String text) => onPressedAddCandidate(text),
      ),
      SpacerHeight.xl,
    ],
  );

  final content = Column(
    children: <Widget>[
      Expanded(child: cloumn),
      BottomContents(
        textReflection: textReflection,
        textFieldFocusNode: textFieldFocusNode,
        onPressedReflectionDone: onPressedReflectionDone,
        onPressedAddReflection: onPressedAddReflection,
      ),
    ],
  );

  return BaseLayout(
    title: "振り返りの追加",
    onTap: () => textFieldFocusNode.unfocus(),
    child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: content,
    ),
  );
}
