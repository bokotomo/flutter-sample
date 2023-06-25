import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_added_list/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/components/templates/reflection_added_list/view.dart'
    show view;

/// テンプレート: 振り返りで追加した内容一覧
class TemplateReflectionAddedList extends HookWidget {
  const TemplateReflectionAddedList({
    super.key,
    required this.reflections,
  });

  /// 振り返りの一覧
  final List<DomainReflectionAdded> reflections;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(reflections);

    return view(
      context,
      h.reflectionsOnPage,
      h.onWillPop,
      h.onClickRemove,
    );
  }
}
