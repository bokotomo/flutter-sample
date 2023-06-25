import 'package:flutter/material.dart'
    show ValueNotifier, BuildContext, Navigator;
import 'package:flutter_hooks/flutter_hooks.dart' show useState, useEffect;
import 'package:gamer_reflection/domain/common/reflection_added.dart'
    show DomainReflectionAdded;

class UseReturn {
  const UseReturn({
    required this.reflectionsOnPage,
    required this.onClickRemove,
    required this.onWillPop,
  });
  final List<DomainReflectionAdded> reflectionsOnPage;
  final void Function(int) onClickRemove;
  final Future<bool> Function(BuildContext) onWillPop;
}

/// ロジック: 振り返り追加ページ
UseReturn useHooks(List<DomainReflectionAdded> reflections) {
  // 追加した保存するための振り返り一覧
  ValueNotifier<List<DomainReflectionAdded>> reflectionsOnPage =
      useState<List<DomainReflectionAdded>>([]);

  /// 削除を押した
  void onClickRemove(int index) {
    print(index);
    reflectionsOnPage.value.removeAt(index);
  }

  ///　戻るときに振り返り一覧も送る
  Future<bool> onWillPop(BuildContext context) {
    Navigator.pop(context, reflectionsOnPage.value);
    return Future.value(false);
  }

  useEffect(() {
    reflectionsOnPage.value = reflections;
    return;
  }, []);

  return UseReturn(
    reflectionsOnPage: reflectionsOnPage.value,
    onWillPop: onWillPop,
    onClickRemove: onClickRemove,
  );
}
