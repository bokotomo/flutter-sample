import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection/widget.dart'
    show TemplateReflection;
import 'package:gamer_reflection/components/pages/reflection/fetch.dart'
    show useFetch;

/// ページ: 振り返り
class PageReflection extends HookWidget {
  const PageReflection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final d = useFetch();
    return Scaffold(
      body: TemplateReflection(
        reflectionGroups: d.reflectionGroups,
        game: d.game,
        pushReflection: d.pushReflection,
      ),
    );
  }
}
