import 'package:flutter/material.dart'
    show BuildContext, Navigator, MaterialPageRoute;
import 'package:gamer_reflection/components/pages/reflection_add/reflection_add.dart'
    show PageReflectionAdd;
import 'package:gamer_reflection/modules/domain/reflection_group.dart'
    show DomainReflectionGroup;
import 'package:gamer_reflection/modules/storage/selected_reflection_group.dart'
    show selectReflectionGroupId;

class UseReturn {
  const UseReturn({
    required this.onPressedStart,
    required this.onChangeReflectionGroup,
  });
  final Future<void> Function(BuildContext) onPressedStart;
  final void Function(String?) onChangeReflectionGroup;
}

///
UseReturn useHooks(List<DomainReflectionGroup> reflectionGroups) {
  /// 開始を押した
  Future<void> onPressedStart(BuildContext context) async {
    final groupId = await selectReflectionGroupId.get() ?? "1";
    final int id = int.parse(groupId.toString());
    final DomainReflectionGroup d = reflectionGroups.firstWhere(
      (r) => r.id == id,
      orElse: () => const DomainReflectionGroup(id: 0, name: ""),
    );

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

  /// 振り返りグループ
  void onChangeReflectionGroup(String? id) {
    print(id);
  }

  return UseReturn(
    onPressedStart: onPressedStart,
    onChangeReflectionGroup: onChangeReflectionGroup,
  );
}
