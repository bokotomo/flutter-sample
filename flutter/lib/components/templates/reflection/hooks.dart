import 'package:flutter/material.dart'
    show BuildContext, Navigator, MaterialPageRoute;
import 'package:gamer_reflection/components/pages/reflection_add/reflection_add.dart'
    show PageReflectionAdd;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/storage/selected_reflection_group.dart'
    show selectReflectionGroup;

class UseReturn {
  const UseReturn({
    required this.onPressedStart,
  });
  final Future<void> Function(BuildContext) onPressedStart;
}

///
UseReturn useHooks(List<DomainReflectionGroup> reflectionGroups) {
  /// 開始を押した
  Future<void> onPressedStart(BuildContext context) async {
    final groupId = await selectReflectionGroup.get() ?? "0";
    final int id = int.parse(groupId.toString());
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == id,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

    if (context.mounted) {
      final PageReflectionAdd page = PageReflectionAdd(title: d.name);
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
