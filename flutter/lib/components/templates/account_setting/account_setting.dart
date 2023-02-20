import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/atoms/spacer_height.dart'
    show SpacerHeight;

Widget view(BuildContext context) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      Box(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            BasicText(
              text: '現在の振り返り名',
              size: "M",
            ),
            SpacerHeight.m,
            BasicText(
              text: '振り返り名A',
              size: "M",
            ),
          ],
        ),
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            BasicText(
              text: '新規で振り返りグループを作成する',
              size: "M",
            ),
            SpacerHeight.m,
            BasicText(
              text: '作成する',
              size: "M",
            ),
          ],
        ),
      ),
      SpacerHeight.m,
      Box(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            BasicText(
              text: '言語',
              size: "M",
            ),
            SpacerHeight.m,
            BasicText(
              text: '日本語',
              size: "M",
            ),
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
