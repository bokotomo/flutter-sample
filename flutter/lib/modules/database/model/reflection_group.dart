const String tableNameReflectionGroup = "reflection_group";

/// Model: ReflectionGroup
class ModelReflectionGroup {
  ModelReflectionGroup({
    this.id,
    required this.name,
    required this.createdAt,
  });

  /// ID
  final int? id;

  /// グループ名
  final String name;

  /// 追加日
  final DateTime createdAt;

  Map<String, Object> toMap() {
    return {
      'name': name,
    };
  }
}
