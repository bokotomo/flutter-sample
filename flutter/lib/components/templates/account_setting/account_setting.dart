import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart' as text;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    as header;
import 'package:gamer_reflection/modules/const/color.dart' as color;

///
Center body = const Center(
  child: text.BasicText(
    text: 'アカウント設定',
    size: "M",
  ),
);

Scaffold wrapper = Scaffold(
  backgroundColor: color.contentColor,
  appBar: const header.Header(title: "アカウント設定"),
  body: body,
);

/// テンプレート: アカウント設定
class TemplateAccountSetting extends StatelessWidget {
  const TemplateAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return wrapper;
  }
}
