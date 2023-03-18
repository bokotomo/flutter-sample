import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/modules/domain/reflection.dart'
    show DomainReflection;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflection;
import 'package:gamer_reflection/modules/type/data_fetch.dart'
    show DataFetchState;

class UseReturn {
  const UseReturn({
    required this.reflection,
    required this.updateReflection,
    required this.dataFetchState,
  });

  final DomainReflection? reflection;
  final Future<void> Function() updateReflection;
  final DataFetchState dataFetchState;
}

/// データ取得: タスク詳細
UseReturn useFetch(int taskId) {
  ValueNotifier<DomainReflection?> reflection =
      useState<DomainReflection?>(null);
  ValueNotifier<DataFetchState> dataFetchState =
      useState<DataFetchState>(DataFetchState.none);

  ///
  Future<void> eventRepository() async {
    dataFetchState.value = DataFetchState.fetching;
    final DomainReflection r =
        await FetchReflection().fetchReflectionById(taskId);

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
