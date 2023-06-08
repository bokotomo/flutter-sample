import 'package:flutter/material.dart'
    show BuildContext, Navigator, MaterialPageRoute;
import 'package:gamer_reflection/components/pages/reflection_add/reflection_add.dart'
    show PageReflectionAdd;
import 'package:gamer_reflection/modules/domain/common/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.onPressedStart,
  });
  final Future<void> Function(BuildContext) onPressedStart;
}

///
UseReturn useHooks(List<DomainReflectionGroup> reflectionGroups) {
  /// 振り返りの開始を押した
  Future<void> onPressedStart(BuildContext context) async {
    final groupId = await selectReflectionGroupId.get() ?? "1";
    final int id = int.parse(groupId.toString());
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == id,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

    // ページを開く
    if (context.mounted) {
      final PageReflectionAdd page = PageReflectionAdd(
        title: d.name,
        groupId: id,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (c) => page,
        ),
      );
    }
  }

  return UseReturn(
    onPressedStart: onPressedStart,
  );
}
