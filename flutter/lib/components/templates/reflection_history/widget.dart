import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_history/view.dart'
    show view;

/// テンプレート: 振り返り追加の履歴一覧
class TemplateReflectionHistory extends HookWidget {
  const TemplateReflectionHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return view(
      context,
    );
  }
}
