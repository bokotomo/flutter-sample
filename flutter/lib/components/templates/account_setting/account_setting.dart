import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/molecules/select_language.dart'
    show SelectLanguage;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/components/common/atoms/button_basic.dart'
    show ButtonBasic;

Widget view(BuildContext context) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BasicText(
              text: '現在選択中の振り返り名',
              size: "M",
            ),
            SpacerHeight.m,
            SelectReflectionGroup(),
          ],
        ),
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BasicText(
              text: '振り返り名の変更',
              size: "M",
            ),
            SpacerHeight.m,
            BasicText(
              text: '振り返り名A',
              size: "M",
            ),
            SpacerHeight.m,
            ButtonBasic(
              icon: Icons.edit,
              text: "編集する",
              // onPressed: () => {},
            )
          ],
        ),
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BasicText(
              text: '振り返りグループの追加',
              size: "M",
            ),
            SpacerHeight.m,
            ButtonBasic(
              icon: Icons.add,
              text: "新規で作成する",
              // onPressed: () => {},
            )
          ],
        ),
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BasicText(
              text: '言語',
              size: "M",
            ),
            SpacerHeight.m,
            SelectLanguage(),
          ],
        ),
      ),
    ],
  );

  return BaseLayoutPadding(
    title: "アカウント設定",
    child: cloumn,
  );
}

/// テンプレート: アカウント設定
class TemplateAccountSetting extends StatelessWidget {
  const TemplateAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return view(context);
  }
}
