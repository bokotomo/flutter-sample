import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        FocusNode,
        GlobalKey,
        ValueNotifier,
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
import 'package:gamer_reflection/domain/reflection_add/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

///
Widget view(
  List<DomainReflectionAddReflection> reflections,
  String title,
  FocusNode textFieldFocusNode,
  GlobalKey<FormState> formKey,
  TextEditingController textReflection,
  void Function(BuildContext) onPressedAddReflection,
  void Function(String) onPressedAddCandidate,
  void Function() onPressedReflectionDone,
  void Function() onPressedRemoveText,
  void Function(String?) onChangeTextReflection,
  ValueNotifier<List<DomainReflectionAddReflection>> candidatesForListener,
) {
  ListView cloumn = ListView(
    children: [
      ReflectionAddCandidate(
        reflections: reflections,
        onPressCandidate: (String text) => onPressedAddCandidate(text),
        candidatesForListener: candidatesForListener,
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
        onPressedRemoveText: onPressedRemoveText,
        onChangeTextReflection: onChangeTextReflection,
      ),
    ],
  );

  return BaseLayout(
    title: title,
    onTap: () => textFieldFocusNode.unfocus(),
    child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: content,
    ),
  );
}
