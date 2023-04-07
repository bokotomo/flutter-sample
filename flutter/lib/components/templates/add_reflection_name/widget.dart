import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/add_reflection_name/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/add_reflection_name/view.dart'
    show view;

/// テンプレート: 振り返り名の追加
class TemplateAddReflectionName extends HookWidget {
  const TemplateAddReflectionName({super.key});

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return view(
      context,
      hooks.textReflection,
      hooks.textFieldFocusNode,
    );
  }
}
