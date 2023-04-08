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
import 'package:gamer_reflection/components/templates/reflection_add/organisms/bottom_contents.dart'
    show BottomContents;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

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
  void Function() onPressedRemoveText,
) {
  ListView cloumn = ListView(
    children: [],
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
