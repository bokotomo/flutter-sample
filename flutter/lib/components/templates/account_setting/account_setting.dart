import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

Widget view(BuildContext context) {
  ListView cloumn = ListView(
    children: [
      const SizedBox(height: ConstantSizeUI.l3),
      Box(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            BasicText(
              text: '現在の振り返り名',
              size: "M",
            ),
            SizedBox(height: ConstantSizeUI.l3),
            BasicText(
              text: '振り返り名A',
              size: "M",
            ),
          ],
        ),
      ),
      const SizedBox(height: ConstantSizeUI.l3),
      Box(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            BasicText(
              text: '振り返りグループを作成する',
              size: "M",
            ),
            SizedBox(height: ConstantSizeUI.l3),
            BasicText(
              text: '作成する',
              size: "M",
            ),
          ],
        ),
      ),
      const SizedBox(height: ConstantSizeUI.l3),
      Box(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            BasicText(
              text: '言語',
              size: "M",
            ),
            SizedBox(height: ConstantSizeUI.l3),
            BasicText(
              text: '日本語',
              size: "M",
            ),
          ],
        ),
      ),
    ],
  );

  Padding content = Padding(
    padding: const EdgeInsets.only(
      left: ConstantSizeUI.l3,
      right: ConstantSizeUI.l3,
    ),
    child: cloumn,
  );

  Scaffold wrapper = Scaffold(
    backgroundColor: ConstantColor.content,
    appBar: const Header(title: "アカウント設定"),
    body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: content,
    ),
  );

  return wrapper;
}

/// テンプレート: アカウント設定
class TemplateAccountSetting extends StatelessWidget {
  const TemplateAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return view(context);
  }
}
