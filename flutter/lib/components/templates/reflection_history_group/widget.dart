import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/components/templates/reflection_history_group/view.dart'
    show view;
import 'package:gamer_reflection/components/templates/reflection_history_group/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/domain/reflection_history_group/reflection_history_group.dart'
    show DomainReflectionHistoryGroup;

/// テンプレート: 振り返り履歴グループ一覧
class TemplateReflectionHistoryGroup extends HookWidget {
  const TemplateReflectionHistoryGroup({
    super.key,
    required this.historyGroups,
    required this.pushDetail,
  });

  final List<DomainReflectionHistoryGroup> historyGroups;
  final void Function(BuildContext, String, int) pushDetail;

  @override
  Widget build(BuildContext context) {
    final h = useHooks();

    return view(
      context,
    );
  }
}
