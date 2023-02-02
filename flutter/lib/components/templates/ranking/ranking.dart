import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

///
Center body = const Center(
  child: TextAnnotation(
    text: 'ランキングを使うには、ニックネームを登録する必要があります。',
    size: "M",
    textAlign: TextAlign.center,
  ),
);

Padding content = Padding(
  padding: const EdgeInsets.all(ConstantSizeUI.l3),
  child: body,
);

Scaffold wrapper = Scaffold(
  backgroundColor: ConstantColor.content,
  appBar: const Header(title: "ランキング"),
  body: content,
);

/// テンプレート: ランキング
class TemplateRanking extends StatelessWidget {
  const TemplateRanking({super.key});

  @override
  Widget build(BuildContext context) {
    return wrapper;
  }
}
