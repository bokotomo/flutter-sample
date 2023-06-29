// import 'package:flutter/material.dart'
//     show Widget, BuildContext, ListView, Column;
import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/layouts/base_padding.dart'
    show BaseLayoutPadding;
import 'package:gamer_reflection/components/common/atoms/spacer/height.dart'
    show SpacerHeight;
import 'package:gamer_reflection/components/common/atoms/text/basic.dart'
    show BasicText;
import 'package:gamer_reflection/components/common/atoms/box.dart' show Box;
import 'package:gamer_reflection/components/common/molecules/select_reflection_group/widget.dart'
    show SelectReflectionGroup;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/common/atoms/button/basic.dart'
    show ButtonBasic;

class Bar extends AnimatedWidget {
  const Bar({
    super.key,
    required this.animation,
    required this.widget,
    required super.listenable,
  });
  final Animation<double> animation;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    List<Widget> progressWidgets = [];
    Widget progressWidget = Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        // gradient: ,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.0,
          color: Colors.blue,
        ),
      ),
    );
    progressWidgets.add(progressWidget);

    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.0,
          color: Colors.blue,
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            flex: (animation.value * 100).toInt(),
            child: Stack(
              children: progressWidgets,
            ),
          ),
          Expanded(
            flex: 100 - (animation.value * 100).toInt(),
            child: Container(),
          )
        ],
      ),
    );
  }
}

///
Widget view(
  BuildContext context,
  List<DomainReflectionGroup> reflectionGroups,
  Function(BuildContext) onPressedStart,
) {
  ListView cloumn = ListView(
    children: [
      SpacerHeight.m,
      SelectReflectionGroup(
        reflectionGroups: reflectionGroups,
        onChanged: (t) {},
      ),
      SpacerHeight.m,
      const Box(
        child: Column(
          children: [
            BasicText(
              text: "振り返りのやり方",
              size: "M",
              isBold: true,
            ),
            SpacerHeight.m,
            BasicText(
              text: "1. リプレイを見る\n\n2. 良かったこと悪かったことを書く\n\n3. 同じ振り返りは候補から追加する",
              size: "M",
            ),
          ],
        ),
      ),
      SpacerHeight.m,
      ButtonBasic(
        text: '振り返りを始める',
        onPressed: () => onPressedStart(context),
      ),
      SpacerHeight.m,
      const BasicText(
        text: 'ブロンズ',
        size: "M",
        textAlign: TextAlign.center,
      ),
      SpacerHeight.s,
      // Bar(
      //   animation: Tween<double>(begin: 1, end: 2).animate(),
      //   listenable: null,
      //   widget: null,
      // ),
    ],
  );

  return BaseLayoutPadding(
    title: "振り返りの追加",
    isBackGround: true,
    child: cloumn,
  );
}
