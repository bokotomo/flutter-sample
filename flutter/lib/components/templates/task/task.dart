import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/common/atoms/text.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/text_annotation.dart'
    show TextAnnotation;
import 'package:gamer_reflection/components/common/molecules/header.dart'
    show Header;
import 'package:gamer_reflection/modules/const/color.dart' show ConstantColor;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;

///
Widget view(List<DomainReflection> reflections) {
  /// データがない場合
  Column noDataAnnotation = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.info,
        color: ConstantColor.textOpacity,
        size: 60,
      ),
      SizedBox(height: ConstantSizeUI.l3),
      TextAnnotation(
        text: 'まだタスクがありません。振り返りから追加しましょう！',
        size: "M",
        textAlign: TextAlign.center,
      ),
    ],
  );

  /// 振り返り一覧
  Column reflectionList = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (int i = 0; i < reflections.length; i++) ...{
        BasicText(text: reflections[i].text, size: "M"),
        BasicText(text: "${reflections[i].count}回", size: "M"),
      }
    ],
  );

  Padding content = Padding(
    padding: const EdgeInsets.all(ConstantSizeUI.l3),
    child: reflections.isEmpty ? noDataAnnotation : reflectionList,
  );

  Scaffold wrapper = Scaffold(
    backgroundColor: ConstantColor.content,
    appBar: const Header(title: "タスク"),
    body: content,
  );

  return wrapper;
}

/// テンプレート: タスク一覧
class TemplateTask extends StatelessWidget {
  const TemplateTask({
    super.key,
    required this.reflections,
  });
  final List<DomainReflection> reflections;

  @override
  Widget build(BuildContext context) {
    return view(reflections);
  }
}
