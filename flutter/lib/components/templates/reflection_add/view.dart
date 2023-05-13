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
        AutovalidateMode,
        TextFieldTapRegion;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/reflection_add/organisms/candidate.dart'
    show ReflectionAddCandidate;
import 'package:gamer_reflection/components/templates/reflection_add/organisms/bottom_contents.dart'
    show BottomContents;
import 'package:gamer_reflection/modules/domain/reflection_add/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;

///
Widget view(
  String title,
  FocusNode textFieldFocusNode,
  List<DomainReflectionAddReflection> candidates,
  GlobalKey<FormState> formKey,
  TextEditingController textReflection,
  void Function(BuildContext) onPressedAddReflection,
  void Function(String) onPressedAddCandidate,
  void Function() onPressedReflectionDone,
  void Function() onPressedRemoveText,
  void Function(String?) onChangeTextReflection,
) {
  ListView cloumn = ListView(
    children: [
      ReflectionAddCandidate(
        reflections: candidates,
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
        onPressedRemoveText: onPressedRemoveText,
        onChangeTextReflection: onChangeTextReflection,
      ),
    ],
  );

  return BaseLayout(
    title: title,
    onTap: () => textFieldFocusNode.unfocus(),
    child: TextFieldTapRegion(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: content,
      ),
    ),
  );
}
