import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/ranking_history/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/templates/ranking_history/view.dart'
    show view;

/// テンプレート: 振り返り一覧
class TemplateReflectionHistory extends HookWidget {
  const TemplateReflectionHistory({
    super.key,
    required this.reflections,
  });
  final List<DomainReflection> reflections;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks();

    return view(
      context,
      hooks.textFieldFocusNode,
      reflections,
      hooks.formKey,
      hooks.textReflection,
      hooks.onPressedAddReflection,
      hooks.onPressedAddCandidate,
      hooks.onPressedReflectionDone,
      hooks.onPressedRemoveText,
    );
  }
}