import 'package:gamer_reflection/domain/site/reflection_group.dart'
    show DomainReflectionGroupId, DomainReflectionGroupName;

/// ドメイン: 振り返りグループ
class DomainAccountSettingReflectionGroup
    implements DomainReflectionGroupId, DomainReflectionGroupName {
  const DomainAccountSettingReflectionGroup({
    required this.id,
    required this.name,
  });

  /// ID
  @override
  final int id;

  /// 振り返りグループ名
  @override
  final String name;
}
