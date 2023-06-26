import 'package:flutter/material.dart' show Widget, BuildContext, ListView;
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;

///
Widget view(
  BuildContext context,
) {
  ListView cloumn = ListView(
    children: [],
  );

  return BaseLayout(
    title: "振り返りの追加",
    isBackGround: false,
    child: cloumn,
  );
}
