/// 先頭が空白
bool fisrtSpace(String v) {
  return RegExp(r'^\s+').hasMatch(v);
}

/// 末尾が空白
bool lastSpace(String v) {
  return RegExp(r'\s+$').hasMatch(v);
}

/// 空白しか入っていない
bool allSpace(String v) {
  final String noSpaceStr = v.replaceAll(RegExp(r'\s+'), '');
  return noSpaceStr.isEmpty;
}

/// 文字数が超えた
bool maxLengthOver(String v, int? maxLength) {
  if (maxLength == null) return false;
  return v.length > maxLength;
}
