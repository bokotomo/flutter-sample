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
    required this.expText,
  });
  final Future<void> Function(BuildContext) onPressedStart;
  final String Function() expText;
}

/// ロジック: 振り返りページ
UseReturn useHooks(
  List<DomainReflectionGroup> reflectionGroups,
  DomainReflectionGame game,
  void Function(BuildContext, String, int) pushReflection,
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

    // 詳細ページを開く
    if (c.mounted) pushReflection(c, d.name, groupId);
  }

  /// 経験値と次の経験値の文言を返す
  String expText() {
    return '${game.exp} / ${game.nextExp}';
  }

  return UseReturn(
    onPressedStart: onPressedStart,
    expText: expText,
  );
}
