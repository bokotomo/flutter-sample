import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/add_reflection_name/widget.dart'
    show TemplateAddReflectionName;

/// ページ: 振り返り名追加
class PageAddReflectionName extends HookWidget {
  const PageAddReflectionName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TemplateAddReflectionName(),
    );
  }
}
