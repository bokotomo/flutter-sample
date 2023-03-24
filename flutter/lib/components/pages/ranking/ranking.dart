import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/ranking/ranking.dart'
    show TemplateRanking;

/// ページ: ランキング
class PageRanking extends HookWidget {
  const PageRanking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TemplateRanking(),
    );
  }
}
