import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

Widget view(BuildContext context) {
  ListView cloumn = ListView(
    children: const [
      SizedBox(height: ConstantSizeUI.l3),
      TextAnnotation(
        text: 'ランキングを使うには、ニックネームを登録する必要があります。',
        size: "M",
        textAlign: TextAlign.center,
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
    appBar: const Header(title: "ランキング"),
    body: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: content,
    ),
  );

  return wrapper;
}

/// テンプレート: ランキング
class TemplateRanking extends StatelessWidget {
  const TemplateRanking({super.key});

  @override
  Widget build(BuildContext context) {
    return view(context);
  }
}
