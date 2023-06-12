import 'package:intl/intl.dart' show DateFormat;

const String tableNameTodo = "todo";

/// Model: Todo やること
class ModelTodo {
  ModelTodo({
    this.id,
    required this.reflectionId,
    required this.createdAt,
  });

  /// ID
  final int? id;

  /// 対象の振り返りID
  final int reflectionId;

  /// 追加日
  final DateTime createdAt;

  Map<String, Object> toMap() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formatted = formatter.format(createdAt);
    return {
      'reflection_id': reflectionId,
      'created_at': formatted,
    };
  }
}
