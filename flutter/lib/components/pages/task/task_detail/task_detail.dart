import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' show HookWidget;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/components/templates/task_detail/task_detail.dart'
    show TemplateTaskDetail;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;
import 'package:gamer_reflection/modules/type/data_fetch.dart'
    show DataFetchState;

/// ページ: タスク詳細
class PageTaskDetail extends HookWidget {
  const PageTaskDetail({
    super.key,
    required this.taskId,
  });
  final int taskId;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<DomainReflection?> reflection =
        useState<DomainReflection?>(null);
    ValueNotifier<DataFetchState> dataFetchState =
        useState<DataFetchState>(DataFetchState.none);

    ///
    Future<void> eventRepository() async {
      dataFetchState.value = DataFetchState.fetching;
      final r = await FetchReflection().fetchReflectionById(taskId);

      reflection.value = r;
      dataFetchState.value = DataFetchState.end;
    }

    ///
    Future<void> updateReflection() async {
      await eventRepository();
    }

    useEffect(() {
      print("タスク詳細 ${taskId}");
      eventRepository();
    }, []);

    return Scaffold(
      body: TemplateTaskDetail(
        taskId: taskId,
        reflection: reflection.value,
        updateReflection: updateReflection,
        dataFetchState: dataFetchState.value,
      ),
    );
  }
}
