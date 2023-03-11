import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
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
import 'package:gamer_reflection/components/common/atoms/button_icon.dart'
    show ButtonIcon;
import 'package:gamer_reflection/components/templates/account_setting/hooks.dart'
    show useHooks;

Widget view(BuildContext context, Function() onPressedEdit) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BasicText(
              text: '選択中の振り返りグループ',
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
          children: [
            const BasicText(
              text: '振り返りグループ名の変更',
              size: "M",
            ),
            SpacerHeight.m,
            const BasicText(
              text: '振り返り名A',
              size: "M",
            ),
            SpacerHeight.m,
            ButtonIcon(
              icon: Icons.edit,
              text: "編集する",
              onPressed: () => onPressedEdit(),
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
            ButtonIcon(
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
      SpacerHeight.m,
    ],
  );

  return BaseLayoutPadding(
    title: "アカウント設定",
    child: cloumn,
  );
}

/// テンプレート: アカウント設定
class TemplateAccountSetting extends HookWidget {
  const TemplateAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return view(
      context,
      hooks.onPressedEdit,
    );
  }
}
