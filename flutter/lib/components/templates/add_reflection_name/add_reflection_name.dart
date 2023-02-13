import 'package:flutter/material.dart';
import 'package:gamer_reflection/components/layouts/base.dart' show BaseLayout;

Widget view(BuildContext context) {
  ListView cloumn = ListView(
    children: const [],
  );

  return BaseLayout(
    title: "振り返り名の追加",
    child: cloumn,
  );
}

/// テンプレート: 振り返り名の追加
class TemplateAddReflectionName extends StatelessWidget {
  const TemplateAddReflectionName({super.key});

  @override
  Widget build(BuildContext context) {
    return view(context);
  }
}
