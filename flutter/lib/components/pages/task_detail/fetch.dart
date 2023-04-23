import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/task_detail/reflection.dart'
    show DomainTaskDetailReflection;
import 'package:gamer_reflection/modules/fetch/task_detail.dart'
    show FetchTaskDetailPage;
import 'package:gamer_reflection/modules/type/data_fetch.dart'
    show DataFetchState;

class UseReturn {
  const UseReturn({
    required this.reflection,
    required this.updateReflection,
    required this.dataFetchState,
  });

  final DomainTaskDetailReflection? reflection;
  final Future<void> Function() updateReflection;
  final DataFetchState dataFetchState;
}

/// データ取得: タスク詳細
UseReturn useFetch(int taskId) {
  final ValueNotifier<DomainTaskDetailReflection?> reflection =
      useState<DomainTaskDetailReflection?>(null);
  final ValueNotifier<DataFetchState> dataFetchState =
      useState<DataFetchState>(DataFetchState.none);

  /// データ取得
  Future<void> eventRepository() async {
    dataFetchState.value = DataFetchState.fetching;

    final DomainTaskDetailReflection r =
        await FetchTaskDetailPage().fetchReflectionById(taskId);

    reflection.value = r;
    dataFetchState.value = DataFetchState.end;
  }

  ///
  Future<void> updateReflection() async {
    await eventRepository();
  }

  useEffect(() {
    eventRepository();
    return;
  }, []);

  return UseReturn(
    reflection: reflection.value,
    updateReflection: updateReflection,
    dataFetchState: dataFetchState.value,
  );
}
