import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/components/templates/task/view.dart' show view;
import 'package:gamer_reflection/components/templates/task/hooks.dart'
    show useHooks;

/// テンプレート: タスク一覧
class TemplateTask extends HookWidget {
  const TemplateTask({
    super.key,
    required this.reflections,
    required this.pushTaskDetail,
  });

  /// 振り返り一覧
  final List<DomainReflection> reflections;

  /// クリックした
  final void Function(BuildContext context, int taskId) pushTaskDetail;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(reflections);

    return view(
      context,
      pushTaskDetail,
      reflections,
      hooks.periodIndex,
      hooks.filteredReflections,
      hooks.changePeriodIndex,
    );
  }
}
