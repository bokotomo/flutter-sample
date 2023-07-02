import 'package:flutter/material.dart' show Widget, BuildContext, ListView;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;

/// View: 振り返り履歴グループ詳細
Widget view(
  BuildContext context,
  String title,
) {
  ListView cloumn = ListView(
    children: [],
  );

  return BaseLayout(
    title: title,
    isBackGround: false,
    child: cloumn,
  );
}
