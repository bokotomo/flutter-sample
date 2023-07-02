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
        FormState,
        Localizations,
        Locale;
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
import 'package:gamer_reflection/components/common/molecules/select_color_mode/widget.dart'
    show SelectColorMode;
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/modules/type/locale.dart' show LocaleCode;

/// アカウント設定
Widget view(
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
  Locale locale = Localizations.localeOf(context);
  final i18n = AppLocalizations.of(context)!;

  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BasicText(
              text: '選択中の振り返り名',
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
        textReflectionName: textReflectionName,
        textReflectionNameFocusNode: textReflectionNameFocusNode,
        onPressedEdit: onPressedEdit,
        formKey: formKeyEditName,
      ),
      SpacerHeight.m,
      NewReflectionName(
        textReflectionNewName: textReflectionNewName,
        textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
        onPressedNewName: onPressedNewName,
        formKey: formKeyNewName,
      ),
      SpacerHeight.m,
      const Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicText(
              text: 'カラーモードの変更',
              size: "M",
            ),
            SpacerHeight.m,
            SelectColorMode(),
          ],
        ),
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BasicText(
              text: '言語の変更',
              size: "M",
            ),
            SpacerHeight.m,
            SelectLanguage(changeLocale: changeLocale),
          ],
        ),
      ),
      SpacerHeight.m,
      const ButtonLinks(
        params: [
          ButtonLinksParam(
            text: '利用規約',
            link: 'https://flutter.dev',
          ),
          ButtonLinksParam(
            text: 'プライバシーポリシー',
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
              text: 'Version 1.0.0',
              size: "M",
            ),
            SpacerHeight.m,
            BasicText(
              text: locale.languageCode.toString(),
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
            const BasicText(
              text: '選択中の振り返りの削除',
              size: "M",
            ),
            SpacerHeight.xs,
            const TextAnnotation(
              text: "※振り返りした内容も削除されます。",
              size: "S",
            ),
            SpacerHeight.m,
            ButtonDelete(
              text: "削除する",
              onPressed: () => onPressedDelete(context),
            ),
          ],
        ),
      ),
      SpacerHeight.m,
    ],
  );
  return BaseLayoutPadding(
    title: "アカウント設定",
    onTap: () => {
      textReflectionNameFocusNode.unfocus(),
      textReflectionNewNameFocusNode.unfocus(),
    },
    isBackGround: true,
    child: cloumn,
  );
}
