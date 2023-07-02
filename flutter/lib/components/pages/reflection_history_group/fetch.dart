import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator, MaterialPageRoute;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/components/pages/reflection_history/widget.dart'
    show PageReflectionHistory;
import 'package:gamer_reflection/domain/reflection_history_group/reflection_history_group.dart'
    show DomainReflectionHistoryGroup;
import 'package:gamer_reflection/modules/fetch/reflection_history_group.dart'
    show FetchReflectionHistoryGroupPage;

class UseReturn {
  const UseReturn({
    required this.historyGroups,
    required this.pushDetail,
  });

  final List<DomainReflectionHistoryGroup> historyGroups;
  final void Function(BuildContext, String, int) pushDetail;
}

/// データ取得: 振り返り履歴グループ一覧
UseReturn useFetch(int reflectionGroupId) {
  final ValueNotifier<List<DomainReflectionHistoryGroup>> historyGroups =
      useState<List<DomainReflectionHistoryGroup>>([]);

  /// データ取得
  Future<void> fetch() async {
    final List<DomainReflectionHistoryGroup> r =
        await FetchReflectionHistoryGroupPage()
            .fetchReflectionHistoryGroups(reflectionGroupId);
    historyGroups.value = r;
  }

  /// タスク詳細ページへ移動
  void pushDetail(BuildContext context, String name, int historyGroupId) {
    final PageReflectionHistory page = PageReflectionHistory(
      title: name,
      historyGroupId: historyGroupId,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => page,
      ),
    ).then((v) {
      fetch();
    });
  }

  useEffect(() {
    fetch();
    return;
  }, []);

  return UseReturn(
    historyGroups: historyGroups.value,
    pushDetail: pushDetail,
  );
}
