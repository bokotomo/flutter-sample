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
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/molecules/select_language/widget.dart'
    show SelectLanguage;
import 'package:gamer_reflection/components/common/molecules/select_color_mode/widget.dart'
    show SelectColorMode;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/components/templates/account_setting/organisms/new_reflection_name.dart'
    show NewReflectionName;
import 'package:gamer_reflection/components/templates/account_setting/organisms/edit_reflection_name.dart'
    show EditReflectionName;

/// アカウント設定
Widget view(
  void Function() onPressedEdit,
  void Function(BuildContext context) onPressedNewName,
  TextEditingController textReflectionName,
  FocusNode textReflectionNameFocusNode,
  TextEditingController textReflectionNewName,
  FocusNode textReflectionNewNameFocusNode,
  GlobalKey<FormState> formKeyNewName,
  GlobalKey<FormState> formKeyEditName,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BasicText(
              text: '選択中の振り返り名',
              size: "M",
            ),
            SpacerHeight.m,
            SelectReflectionGroup(),
          ],
        ),
      ),
      SpacerHeight.m,
      EditReflectionName(
        textReflectionName: textReflectionName,
        textReflectionNameFocusNode: textReflectionNameFocusNode,
        onPressedEdit: onPressedEdit,
        formKeyEditName: formKeyEditName,
      ),
      SpacerHeight.m,
      NewReflectionName(
        textReflectionNewName: textReflectionNewName,
        textReflectionNewNameFocusNode: textReflectionNewNameFocusNode,
        onPressedNewName: onPressedNewName,
        formKeyNewName: formKeyNewName,
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BasicText(
              text: '言語の変更',
              size: "M",
            ),
            SpacerHeight.m,
            SelectLanguage(),
          ],
        ),
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
          children: const [
            BasicText(
              text: '利用規約',
              size: "M",
            ),
            SpacerHeight.m,
            BasicText(
              text: 'プライバシーポリシー',
              size: "M",
            ),
          ],
        ),
      ),
      SpacerHeight.m,
    ],
  );

  return BaseLayoutPadding(
    title: "アカウント設定",
    isBackGround: true,
    child: cloumn,
  );
}
