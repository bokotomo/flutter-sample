import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;
import 'package:gamer_reflection/modules/request/reflection.dart'
    show RequestReflection;
import 'package:gamer_reflection/modules/request/reflection_history_group.dart'
    show RequestReflectionHistoryGroup;
import 'package:gamer_reflection/modules/request/game.dart' show RequestGame;
import 'package:gamer_reflection/components/common/atoms/toast/hooks.dart'
    show useToast;

class UseReturn {
  const UseReturn({
    required this.reflectionsOnPage,
    required this.onClickRemove,
    required this.onWillPop,
    required this.onPressedReflectionDone,
  });
  final List<DomainReflectionAdded> reflectionsOnPage;
  final void Function(String) onClickRemove;
  final Future<bool> Function(BuildContext) onWillPop;
  final void Function(BuildContext) onPressedReflectionDone;
}

/// ロジック: 振り返り追加ページ
UseReturn useHooks(
  BuildContext context,
  List<DomainReflectionAdded> reflections,
  int groupId,
) {
  // 追加した保存するための振り返り一覧
  ValueNotifier<List<DomainReflectionAdded>> reflectionsOnPage =
      useState<List<DomainReflectionAdded>>([]);
  final toast = useToast(context);

  /// 削除を押した
  void onClickRemove(String text) {
    reflectionsOnPage.value =
        reflectionsOnPage.value.where((e) => e.text != text).toList();
  }

  ///　戻るときに振り返り一覧も送る
  Future<bool> onWillPop(BuildContext context) {
    Navigator.pop(context, reflectionsOnPage.value);
    return Future.value(false);
  }

  /// 完了を押した
  void onPressedReflectionDone(BuildContext context) {
    // todo: 複数のDB処理はトランザクションにする
    // 振り返りをDBに保存する
    RequestReflection().addReflection(
      reflectionsOnPage.value,
      groupId,
    );

    // 履歴をDBに保存する
    RequestReflectionHistoryGroup().addReflectionHisotry(
      reflectionsOnPage.value,
      groupId,
    );

    // 経験値は固定
    const exp = 35;
    // 経験値加算をDBに保存する
    RequestGame().updateAddExp(exp);

    toast.showNotification("振り返りを追加しました。", 2500);

    // 二つ前のページへ戻る
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  useEffect(() {
    reflectionsOnPage.value = reflections;
    return;
  }, []);

  return UseReturn(
    reflectionsOnPage: reflectionsOnPage.value,
    onWillPop: onWillPop,
    onClickRemove: onClickRemove,
    onPressedReflectionDone: onPressedReflectionDone,
  );
}
