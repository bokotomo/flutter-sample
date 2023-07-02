import 'package:flutter/material.dart'
    show
        StatelessWidget,
        Widget,
        TextEditingController,
        FocusNode,
        Column,
        CrossAxisAlignment,
        BuildContext,
        Icons,
        Form,
        GlobalKey,
        FormState,
        AutovalidateMode;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/input/text/widget.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button/icon.dart'
    show ButtonIcon;

Widget view(
  BuildContext context,
  AppLocalizations i18n,
  TextEditingController textReflectionNewName,
  FocusNode textReflectionNewNameFocusNode,
  Function(BuildContext context) onPressedNewName,
  GlobalKey<FormState> formKey,
) {
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: formKey,
    child: Box(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicText(
            text: i18n.accountPageAddReflection,
            size: "M",
          ),
          SpacerHeight.m,
          InputText(
            text: textReflectionNewName,
            hintText: i18n.accountPageAddReflectionPlaceHolder,
            focusNode: textReflectionNewNameFocusNode,
            maxLength: 20,
          ),
          SpacerHeight.m,
          ButtonIcon(
            icon: Icons.add,
            text: i18n.accountPageAddReflectionButton,
            onPressed: () => onPressedNewName(context),
          )
        ],
      ),
    ),
  );
}

/// 振り返り名の追加
class NewReflectionName extends StatelessWidget {
  const NewReflectionName({
    super.key,
    required this.i18n,
    required this.textReflectionNewNameFocusNode,
    required this.textReflectionNewName,
    required this.onPressedNewName,
    required this.formKey,
  });

  /// 言語
  final AppLocalizations i18n;

  ///
  final FocusNode textReflectionNewNameFocusNode;

  ///
  final TextEditingController textReflectionNewName;

  ///
  final Function(BuildContext context) onPressedNewName;

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return view(
      context,
      i18n,
      textReflectionNewName,
      textReflectionNewNameFocusNode,
      onPressedNewName,
      formKey,
    );
  }
}
