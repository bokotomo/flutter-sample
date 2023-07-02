import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/domain/reflection_history/reflection_history.dart'
    show DomainReflectionHistory;
import 'package:gamer_reflection/components/templates/reflection_history/view.dart'
    show view;

/// テンプレート: 振り返り履歴グループ詳細
class TemplateReflectionHistory extends HookWidget {
  const TemplateReflectionHistory({
    super.key,
    required this.historys,
    required this.title,
  });

  final List<DomainReflectionHistory> historys;
  final String title;

  @override
  Widget build(BuildContext context) {
    return view(
      context,
      title,
      historys,
    );
  }
}
