import 'package:intl/intl.dart' show DateFormat;

const String tableNameTodo = "todo";

/// Model: Todo やること
class ModelTodo {
  ModelTodo({
    this.id,
    required this.indexNum,
    required this.reflectionId,
    required this.reflectionGroupId,
    required this.createdAt,
  });

  /// ID
  final int? id;

  /// 番号
  final int indexNum;

  /// 対象の振り返りID
  final int reflectionId;

  /// GROUP_ID
  final int reflectionGroupId;

  /// 追加日
  final DateTime createdAt;

  Map<String, Object> toMap() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(createdAt);
    return {
      'index_num': indexNum,
      'reflection_id': reflectionId,
      'reflection_group_id': reflectionGroupId,
      'created_at': formatted,
    };
  }
}
