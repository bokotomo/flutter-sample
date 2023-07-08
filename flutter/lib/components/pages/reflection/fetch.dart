import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator, MaterialPageRoute;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/components/pages/reflection_add/reflection_add.dart'
    show PageReflectionAdd;
import 'package:gamer_reflection/components/pages/reflection_history_group/widget.dart'
    show PageReflectionHistoryGroup;
import 'package:gamer_reflection/domain/reflection/game.dart'
    show DomainReflectionGame;
import 'package:gamer_reflection/modules/fetch/reflection.dart'
    show FetchReflectionPage;

class UseReturn {
  const UseReturn({
    required this.reflectionGroups,
    required this.game,
    required this.pushReflection,
    required this.pushHistory,
  });

  final List<DomainReflectionGroup> reflectionGroups;
  final DomainReflectionGame game;
  final void Function(BuildContext, String, int) pushReflection;
  final void Function(BuildContext, String, int) pushHistory;
}

/// データ取得: 振り返りグループ一覧
UseReturn useFetch() {
  final ValueNotifier<List<DomainReflectionGroup>> reflectionGroups =
      useState<List<DomainReflectionGroup>>([]);
  final ValueNotifier<DomainReflectionGame> game =
      useState<DomainReflectionGame>(
          const DomainReflectionGame(exp: 0, nextExp: 0, prevExp: 0, rank: ''));

  /// データ取得
  Future<void> fetch() async {
    final List<DomainReflectionGroup> r =
        await FetchReflectionPage().fetchReflectionGroups();
    reflectionGroups.value = r;

    final DomainReflectionGame g = await FetchReflectionPage().fetchGame();
    game.value = g;
  }

  /// 振り返り追加ページへ移動
  void pushReflection(BuildContext context, String name, int groupId) {
    final PageReflectionAdd page = PageReflectionAdd(
      title: name,
      groupId: groupId,
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

  /// 振り返り履歴ページへ移動
  void pushHistory(BuildContext context, String name, int groupId) {
    final PageReflectionHistoryGroup page = PageReflectionHistoryGroup(
      groupId: groupId,
      title: name,
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
    reflectionGroups: reflectionGroups.value,
    game: game.value,
    pushReflection: pushReflection,
    pushHistory: pushHistory,
  );
}
