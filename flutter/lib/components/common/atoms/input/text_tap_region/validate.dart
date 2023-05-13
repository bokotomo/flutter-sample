import 'package:gamer_reflection/modules/validate/text.dart'
    show fisrtSpace, lastSpace, allSpace, maxLengthOver;

class UseReturn {
  const UseReturn({
    required this.validateForm,
  });

  final String? Function(String? v) validateForm;
}

/// バリデーションを返す
UseReturn useValidate(int? maxLength) {
  /// バリデーション
  String? validateForm(String? v) {
    if (v == null || v.isEmpty) return "※文字が未入力です。";
    if (maxLengthOver(v, maxLength)) return "※文字数は$maxLength以内です。";
    if (allSpace(v)) return "※全て空白では追加できません。";
    if (fisrtSpace(v)) return "※先頭に空白は入れられません。";
    if (lastSpace(v)) return "※末尾に空白は入れられません。";

    return null;
  }

  return UseReturn(
    validateForm: validateForm,
  );
}
