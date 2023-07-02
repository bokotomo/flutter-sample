import 'package:flutter/material.dart' show BuildContext;
import 'package:gamer_reflection/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/domain/reflection/game.dart'
    show DomainReflectionGame;
import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.onPressedStart,
    required this.onPressedHistory,
    required this.expText,
  });
  final Future<void> Function(BuildContext) onPressedStart;
  final Future<void> Function(BuildContext) onPressedHistory;
  final String Function() expText;
}

/// ロジック: 振り返りページ
UseReturn useHooks(
  List<DomainReflectionGroup> reflectionGroups,
  DomainReflectionGame game,
  void Function(BuildContext, String, int) pushReflection,
  void Function(BuildContext, int) pushHistory,
) {
  /// 振り返りの開始を押した
  Future<void> onPressedStart(BuildContext c) async {
    final cacheGroupId = await selectReflectionGroupId.get();
    if (cacheGroupId == null) return;

    final int groupId = int.parse(cacheGroupId.toString());
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == groupId,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

    // 追加ページを開く
    if (c.mounted) pushReflection(c, d.name, groupId);
  }

  /// 振り返り履歴を押した
  Future<void> onPressedHistory(BuildContext c) async {
    final cacheGroupId = await selectReflectionGroupId.get();
    if (cacheGroupId == null) return;

    final int groupId = int.parse(cacheGroupId.toString());

    // 履歴ページを開く
    if (c.mounted) pushHistory(c, groupId);
  }

  /// 経験値と次の経験値の文言を返す
  String expText() {
    return '${game.exp} / ${game.nextExp}';
  }

  return UseReturn(
    onPressedStart: onPressedStart,
    onPressedHistory: onPressedHistory,
    expText: expText,
  );
}
