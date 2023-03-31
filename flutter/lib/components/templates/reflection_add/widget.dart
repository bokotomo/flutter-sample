import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_add/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/templates/reflection_add/view.dart'
    show view;

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends HookWidget {
  const TemplateReflectionAdd({
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
