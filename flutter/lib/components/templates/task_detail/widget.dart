import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
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
  });

  /// データ取得状態
  final DataFetchState dataFetchState;

  /// 振り返りタスクID
  final int taskId;

  /// 振り返り一覧
  final DomainReflection? reflection;

  /// 更新
  final Future<void> Function() updateReflection;

  @override
  Widget build(BuildContext context) {
    final hooks = useHooks(taskId, reflection, updateReflection);

    return view(
      context,
      hooks.titleFocusNode,
      hooks.detailFocusNode,
      taskId,
      reflection,
      hooks.isEditMode,
      hooks.toggleEditMode,
      hooks.titleController,
      hooks.detailController,
      hooks.formKey,
      hooks.onPressedEditDone,
      hooks.onPressedTaskDone,
      hooks.onPressedCancel,
    );
  }
}
