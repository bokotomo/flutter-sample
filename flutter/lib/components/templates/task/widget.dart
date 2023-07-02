import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/domain/task/reflection.dart'
    show DomainTaskReflection;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/templates/task/view.dart' show view;
import 'package:gamer_reflection/components/templates/task/hooks.dart'
    show useHooks;

/// テンプレート: タスク一覧
class TemplateTask extends HookWidget {
  const TemplateTask({
    super.key,
    required this.i18n,
    required this.reflections,
    required this.reflectionGroups,
    required this.pushTaskDetail,
    required this.fetchReflections,
  });

  /// 言語
  final AppLocalizations i18n;

  /// 振り返り一覧
  final List<DomainTaskReflection> reflections;

  /// 振り返りグループ一覧
  final List<DomainReflectionGroup> reflectionGroups;

  /// クリックした
  final void Function(BuildContext context, int taskId) pushTaskDetail;

  /// 振り返りの取得をする
  final Future<void> Function() fetchReflections;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(reflections, reflectionGroups, fetchReflections);

    return view(
      context,
      reflectionGroups,
      pushTaskDetail,
      hooks.period,
      hooks.filteredReflections,
      hooks.isSelectedGood,
      hooks.onPressedAll,
      hooks.onPressedThreeMonth,
      hooks.onPressedMonth,
      hooks.onPressedBad,
      hooks.onPressedGood,
      hooks.onChangeReflectionGroup,
    );
  }
}
