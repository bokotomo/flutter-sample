import 'package:gamer_reflection/modules/type/reflection.dart'
    show ReflectionType;
import 'package:gamer_reflection/modules/type/tag_text_color.dart'
    show TagTextColor;

/// ドメイン: 振り返り
class DomainReflection {
  const DomainReflection({
    required this.id,
    required this.text,
    required this.detail,
    required this.count,
    required this.reflectionType,
    required this.priority,
    required this.tagColor,
    required this.updatedAt,
  });

  /// ID
  final int id;

  /// 振り返り内容
  final String text;

  /// 振り返りの対策内容
  final String detail;

  /// 回数
  final int count;

  /// 優先度
  final int priority;

  /// 優先度の色
  final TagTextColor tagColor;

  /// 振り返りの種類
  final ReflectionType reflectionType;

  /// 日付
  final DateTime updatedAt;
}
