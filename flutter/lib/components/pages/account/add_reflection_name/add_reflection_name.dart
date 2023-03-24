import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/add_reflection_name/add_reflection_name.dart'
    show TemplateAddReflectionName;

/// ページ: 振り返り名追加
class PageAccountAddReflectionName extends HookWidget {
  const PageAccountAddReflectionName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TemplateAddReflectionName(),
    );
  }
}
