import 'package:gamer_reflection/storage/kvs/selected_reflection_group.dart'
    show selectReflectionGroupId;
import 'package:gamer_reflection/modules/domain/common/reflection_group.dart'
    show DomainReflectionGroup;

class UseReturn {
  const UseReturn({
    required this.onChangeReflectionGroup,
  });

  final void Function(String?) onChangeReflectionGroup;
}

///
UseReturn useHooks(
  List<DomainReflectionGroup> reflectionGroups,
) {
  /// 振り返りグループ
  void onChangeReflectionGroup(String? id) {
    String groupId = id ??
        (reflectionGroups.isEmpty ? "1" : reflectionGroups[0].id.toString());
    selectReflectionGroupId.save(groupId);
  }

  return UseReturn(
    onChangeReflectionGroup: onChangeReflectionGroup,
  );
}
