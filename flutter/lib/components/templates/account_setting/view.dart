import 'package:flutter/material.dart'
    show
        Widget,
        BuildContext,
        TextEditingController,
        FocusNode,
        ListView,
        Column,
        CrossAxisAlignment,
        GlobalKey,
        FormState;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text/annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/button/delete.dart'
    show ButtonDelete;
import 'package:gamer_reflection/components/common/molecules/select_language/widget.dart'
    show SelectLanguage;
// import 'package:gamer_reflection/components/common/molecules/select_color_mode/widget.dart'
//     show SelectColorMode;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/templates/account_setting/organisms/new_reflection_name.dart'
    show NewReflectionName;
import 'package:gamer_reflection/components/templates/account_setting/organisms/edit_reflection_name.dart'
    show EditReflectionName;
import 'package:gamer_reflection/components/templates/account_setting/molecules/button_links.dart'
    show ButtonLinks, ButtonLinksParam;
import 'package:gamer_reflection/modules/const/app_info.dart'
    show ConstantAppInfo;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

/// アカウント設定
Widget view(
  AppLocalizations i18n,
  BuildContext context,
  void Function(LocaleCode) changeLocale,
  List<DomainReflectionGroup> reflectionGroups,
  void Function() onPressedEdit,
  void Function(BuildContext context) onPressedDelete,
  void Function(BuildContext context) onPressedNewName,
  void Function(String?) onChangeReflectionGroup,
  TextEditingController textReflectionName,
  FocusNode textReflectionNameFocusNode,
  TextEditingController textReflectionNewName,
  FocusNode textReflectionNewNameFocusNode,
  GlobalKey<FormState> formKeyNewName,
  GlobalKey<FormState> formKeyEditName,
) {
  final i18n = AppLocalizations.of(context)!;

  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              text: i18n.accountPageCurrentReflectionName,
              size: "M",
            ),
            SpacerHeight.m,
            SelectReflectionGroup(
              reflectionGroups: reflectionGroups,
              onChanged: onChangeReflectionGroup,
            ),
          ],
        ),
      ),
      SpacerHeight.m,
      EditReflectionName(
        i18n: i18n,
        textReflectionName: textReflectionName,
        textReflectionNameFocusNode: textReflectionNameFocusNode,
        onPressedEdit: onPressedEdit,
        formKey: formKeyEditName,
      ),
      SpacerHeight.m,
      NewReflectionName(
        i18n: i18n,
        textReflectionNewName: textReflectionNewName,
        textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
        onPressedNewName: onPressedNewName,
        formKey: formKeyNewName,
      ),
      SpacerHeight.m,
      // Box(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       BasicText(
      //         text: i18n.accountPageChangeColorMode,
      //         size: "M",
      //       ),
      //       SpacerHeight.m,
      //       const SelectColorMode(),
      //     ],
      //   ),
      // ),
      // SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              text: i18n.accountPageChangeLanguage,
              size: "M",
            ),
            SpacerHeight.m,
            SelectLanguage(changeLocale: changeLocale),
          ],
        ),
      ),
      SpacerHeight.m,
      ButtonLinks(
        params: [
          ButtonLinksParam(
            text: i18n.accountPageTermsOfService,
            link: 'https://flutter.dev',
          ),
          ButtonLinksParam(
            text: i18n.accountPagePrivacyPolicy,
            link: 'https://flutter.dev',
          ),
        ],
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              text: i18n.accountPageAppInfo,
              size: "M",
            ),
            SpacerHeight.m,
            const BasicText(
              text: 'Version ${ConstantAppInfo.version}',
              size: "M",
            ),
          ],
        ),
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              text: i18n.accountPageDeleteReflection,
              size: "M",
            ),
            SpacerHeight.xs,
            TextAnnotation(
              text: i18n.accountPageDeleteReflectionDetail,
              size: "S",
            ),
            SpacerHeight.m,
            ButtonDelete(
              text: i18n.accountPageDeleteButton,
              onPressed: () => onPressedDelete(context),
            ),
          ],
        ),
      ),
      SpacerHeight.m,
    ],
  );

  return BaseLayoutPadding(
    i18n: i18n,
    title: i18n.accountPageTitle,
    onTap: () => {
      textReflectionNameFocusNode.unfocus(),
      textReflectionNewNameFocusNode.unfocus(),
    },
    isBackGround: true,
    child: cloumn,
  );
}
