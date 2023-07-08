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
  AppLocalizations i18n,
  TextEditingController textReflectionName,
  FocusNode textReflectionNameFocusNode,
  void Function() onPressedEdit,
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
            text: i18n.accountPageChangeReflectionName,
            size: "M",
          ),
          SpacerHeight.m,
          InputText(
            i18n: i18n,
            text: textReflectionName,
            hintText: i18n.accountPageChangeReflectionNamePlaceHolder,
            focusNode: textReflectionNameFocusNode,
            maxLength: 20,
          ),
          SpacerHeight.m,
          ButtonIcon(
            icon: Icons.edit,
            text: i18n.accountPageChangeReflectionNameButton,
            onPressed: () => onPressedEdit(),
          )
        ],
      ),
    ),
  );
}

/// 振り返り名変更
class EditReflectionName extends StatelessWidget {
  const EditReflectionName({
    super.key,
    required this.i18n,
    required this.textReflectionNameFocusNode,
    required this.textReflectionName,
    required this.onPressedEdit,
    required this.formKey,
  });

  /// 言語
  final AppLocalizations i18n;

  ///
  final FocusNode textReflectionNameFocusNode;

  ///
  final TextEditingController textReflectionName;

  ///
  final Function() onPressedEdit;

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return view(
      i18n,
      textReflectionName,
      textReflectionNameFocusNode,
      onPressedEdit,
      formKey,
    );
  }
}
