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
    if (maxLength != null && v.length > maxLength!) return "※文字数が超えています。";
    final String noSpaceStr = v.replaceAll(RegExp(r'\s+'), '');
    if (noSpaceStr.isEmpty) return "※全て空白では追加できません。";
    if (RegExp(r'^\s+').hasMatch(v)) return "※先頭に空白は入れられません。";
    if (RegExp(r'\s+$').hasMatch(v)) return "※末尾に空白は入れられません。";

    return null;
  }

  return UseReturn(
    validateForm: validateForm,
  );
}
