import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_add/widget.dart'
    show TemplateReflectionAdd;
import 'package:gamer_reflection/components/pages/reflection_add/fetch.dart'
    show useFetch;

/// ページ: 振り返りの追加
class PageReflectionAdd extends HookWidget {
  const PageReflectionAdd({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final d = useFetch();

    return Scaffold(
      body: TemplateReflectionAdd(
        title: title,
        reflections: d.reflections,
      ),
    );
  }
}
