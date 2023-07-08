import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/domain/solution_detail/reflection.dart'
    show DomainSolutionDetailReflection;
import 'package:gamer_reflection/modules/fetch/solution_detail.dart'
    show FetchSolutionDetailPage;
import 'package:gamer_reflection/modules/type/data_fetch.dart'
    show DataFetchState;

class UseReturn {
  const UseReturn({
    required this.reflection,
    required this.updateReflection,
    required this.dataFetchState,
    required this.todoExist,
  });

  final DomainSolutionDetailReflection? reflection;
  final Future<void> Function() updateReflection;
  final DataFetchState dataFetchState;
  final bool? todoExist;
}

/// データ取得: タスク詳細
UseReturn useFetch(int reflectionId) {
  final ValueNotifier<DomainSolutionDetailReflection?> reflection =
      useState<DomainSolutionDetailReflection?>(null);
  final ValueNotifier<DataFetchState> dataFetchState =
      useState<DataFetchState>(DataFetchState.none);
  final ValueNotifier<bool?> todoExist = useState<bool?>(null);

  /// データ取得
  Future<void> eventRepository() async {
    dataFetchState.value = DataFetchState.fetching;

    final DomainSolutionDetailReflection r =
        await FetchSolutionDetailPage().fetchReflectionById(reflectionId);

    reflection.value = r;
    dataFetchState.value = DataFetchState.end;

    final bool t =
        await FetchSolutionDetailPage().fetchTodoExistById(reflectionId);
    todoExist.value = t;
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
    todoExist: todoExist.value,
  );
}
