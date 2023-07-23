import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        ListView,
        Column,
        Icons,
        TextEditingController,
        FocusNode,
        TextAlign,
        FormState,
        GlobalKey,
        Form,
        Container,
        EdgeInsets,
        Padding,
        Expanded,
        AutovalidateMode,
        CrossAxisAlignment;
import 'package:gamer_reflection/components/common/atoms/input/text/widget.dart'
    show InputText;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/molecules/select_language/widget.dart'
    show SelectLanguage;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/button/icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

/// 見た目
Widget view(
  BuildContext context,
  AppLocalizations i18n,
  GlobalKey<FormState> formKey,
  TextEditingController textReflectionName,
  FocusNode textFieldFocusNode,
  void Function() onPressedRegister,
  void Function(LocaleCode) changeLocale,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.xl,
      BasicText(
        size: "M",
        text: i18n.pageAddReflectionNameTitle,
        isBold: true,
        textAlign: TextAlign.center,
      ),
      SpacerHeight.m,
      BasicText(
        size: "M",
        text: i18n.pageAddReflectionNameSubTitle,
        textAlign: TextAlign.center,
      ),
      SpacerHeight.l,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              size: "M",
              text: i18n.pageAddReflectionNameFormTitle,
              isBold: true,
            ),
            SpacerHeight.s,
            TextAnnotation(
              size: "S",
              text: i18n.pageAddReflectionNameFormAnnotation,
            ),
            SpacerHeight.xm,
            InputText(
              i18n: i18n,
              text: textReflectionName,
              hintText: i18n.pageAddReflectionNameFormPlaceHolder,
              focusNode: textFieldFocusNode,
              maxLength: 28,
            ),
            SpacerHeight.xm,
            ButtonIcon(
              icon: Icons.add,
              text: i18n.pageAddReflectionNameFormButton,
              onPressed: onPressedRegister,
            ),
          ],
        ),
      ),
    ],
  );

  final form = Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    key: formKey,
    child: cloumn,
  );
  final bottomContent = Container(
    color: ConstantColor.content,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: ConstantSizeUI.l3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicText(
            text: i18n.pageAddReflectionNameLanguageTitle,
            size: "M",
          ),
          SpacerHeight.s,
          SelectLanguage(changeLocale: changeLocale),
        ],
      ),
    ),
  );

  final content = Column(
    children: <Widget>[
      Expanded(child: form),
      bottomContent,
    ],
  );

  return BaseLayoutPadding(
    i18n: i18n,
    title: "Ref",
    isBackGround: true,
    child: content,
  );
}
