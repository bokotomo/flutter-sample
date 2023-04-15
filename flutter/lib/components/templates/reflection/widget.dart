import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/components/templates/reflection/view.dart'
    show view;

/// テンプレート: 振り返り
class TemplateReflection extends HookWidget {
  const TemplateReflection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return view(
      context,
      hooks.onPressedStart,
    );
  }
}
