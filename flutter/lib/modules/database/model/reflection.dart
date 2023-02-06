const String tableNameReflection = "reflection";

/// Model: Reflection
class ModelReflection {
  ModelReflection({
    this.id,
    required this.reflectionGroupId,
    required this.reflectionType,
    required this.text,
    required this.detail,
    required this.count,
    this.createdAt,
  });

  /// ID
  final int? id;

  /// GROUP_ID
  final int reflectionGroupId;

  /// 振り返りの種類
  final int reflectionType;

  /// 振り返り内容
  final String text;

  /// 振り返りの対策内容
  final String detail;

  /// 回数
  final int count;

  /// 日付
  final DateTime? createdAt;

  Map<String, Object> toMap() {
    return {
      'reflection_group_id': reflectionGroupId,
      'reflection_type': reflectionType,
      'text': text,
      'detail': detail,
      'count': count,
    };
  }

  Map<String, Object> toMapReflectionGroupId() {
    return {
      'reflection_group_id': reflectionGroupId,
    };
  }

  Map<String, Object> toMapReflectionType() {
    return {
      'reflection_type': reflectionType,
    };
  }

  Map<String, Object> toMapText() {
    return {
      'text': text,
    };
  }

  Map<String, Object> toMapDetail() {
    return {
      'detail': detail,
    };
  }

  Map<String, Object> toMapCount() {
    return {
      'count': count,
    };
  }
}
