import 'package:flutter/material.dart' show Widget, BuildContext, ListView;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;

/// View: 振り返り履歴グループ一覧
Widget view(
  BuildContext context,
) {
  ListView cloumn = ListView(
    children: [],
  );

  return BaseLayout(
    title: "振り返り履歴",
    isBackGround: false,
    child: cloumn,
  );
}
