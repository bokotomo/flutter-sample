import 'package:flutter/material.dart' show Widget, BuildContext, ListView;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;
import 'package:gamer_reflection/components/templates/reflection_history/molecules/button_history.dart'
    show ButtonHistory;
import 'package:gamer_reflection/domain/reflection_history/reflection_history.dart'
    show DomainReflectionHistory;

/// View: 振り返り履歴グループ詳細
Widget view(
  BuildContext context,
  String title,
  List<DomainReflectionHistory> historys,
) {
  ListView cloumn = ListView(
    children: [
      for (int i = 0; i < historys.length; i++) ...{
        ButtonHistory(
          text: historys[i].text,
          count: historys[i].count,
          isThin: i % 2 == 0,
        )
      }
    ],
  );

  return BaseLayout(
    title: title,
    isBackGround: false,
    child: cloumn,
  );
}
