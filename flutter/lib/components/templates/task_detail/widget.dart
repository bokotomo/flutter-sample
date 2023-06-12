import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/modules/domain/task_detail/reflection.dart'
    show DomainTaskDetailReflection;
import 'package:gamer_reflection/components/templates/task_detail/hooks.dart'
    show useHooks;
import 'package:gamer_reflection/modules/type/data_fetch.dart'
    show DataFetchState;
import 'package:gamer_reflection/components/templates/task_detail/view.dart'
    show view;

/// ページ: タスク一覧
class TemplateTaskDetail extends HookWidget {
  const TemplateTaskDetail({
    super.key,
    required this.dataFetchState,
    required this.taskId,
    required this.reflection,
    required this.updateReflection,
    required this.todoExist,
  });

  /// データ取得状態
  final DataFetchState dataFetchState;

  /// 振り返りタスクID
  final int taskId;

  /// 振り返り一覧
  final DomainTaskDetailReflection? reflection;

  /// 更新
  final Future<void> Function() updateReflection;

  /// やることに追加済みか
  final bool todoExist;

  @override
  Widget build(BuildContext context) {
    final h = useHooks(taskId, reflection, updateReflection);

    return view(
      context,
      todoExist,
      h.titleFocusNode,
      h.detailFocusNode,
      taskId,
      reflection,
      h.isEditMode,
      h.toggleEditMode,
      h.titleController,
      h.detailController,
      h.formKey,
      h.groupValue,
      h.onPressedEditDone,
      h.onPressedTaskDone,
      h.onPressedCancel,
      h.onChangedGood,
      h.onChangedBad,
      h.onPressedToggleTodo,
    );
  }
}
