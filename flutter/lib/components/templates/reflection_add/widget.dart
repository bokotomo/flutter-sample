import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_add/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/modules/domain/reflection_add/reflection.dart'
    show DomainReflectionAddReflection;
import 'package:gamer_reflection/components/templates/reflection_add/view.dart'
    show view;

/// テンプレート: 振り返りの追加
class TemplateReflectionAdd extends HookWidget {
  const TemplateReflectionAdd({
    super.key,
    required this.reflections,
    required this.title,
    required this.groupId,
  });

  /// 振り返りの一覧
  final List<DomainReflectionAddReflection> reflections;

  /// タイトル
  final String title;

  /// 振り返りグループID
  final int groupId;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(reflections, groupId);

    return view(
      reflections,
      title,
      hooks.textFieldFocusNode,
      hooks.formKey,
      hooks.textReflection,
      hooks.onPressedAddReflection,
      hooks.onPressedAddCandidate,
      hooks.onPressedReflectionDone,
      hooks.onPressedRemoveText,
      hooks.onChangeTextReflection,
      hooks.candidatesForListener,
    );
  }
}
