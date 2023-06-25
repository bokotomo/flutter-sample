import 'package:flutter/material.dart' show Widget, BuildContext, Scaffold;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_added_list/widget.dart'
    show TemplateReflectionAddedList;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;

/// ページ: タスク一覧
class PageReflectionAddedList extends HookWidget {
  const PageReflectionAddedList({
    super.key,
    required this.reflections,
  });

  /// 振り返りの一覧
  final List<DomainReflectionAdded> reflections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateReflectionAddedList(
        reflections: reflections,
      ),
    );
  }
}
