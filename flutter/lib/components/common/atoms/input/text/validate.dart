import 'package:gamer_reflection/modules/validate/text.dart'
    show fisrtSpace, lastSpace, allSpace, maxLengthOver;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class UseReturn {
  const UseReturn({
    required this.validateForm,
  });

  final String? Function(String? v) validateForm;
}

/// バリデーションを返す
UseReturn useValidate(
  int? maxLength,
  AppLocalizations i18n,
) {
  /// バリデーション
  String? validateForm(String? v) {
    if (v == null || v.isEmpty) return i18n.commonInputTextValidationEmpty;
    if (maxLengthOver(v, maxLength)) {
      return i18n.commonInputTextValidationMaxLengthOver(maxLength!);
    }
    if (allSpace(v)) return i18n.commonInputTextValidationAllSpace;
    if (fisrtSpace(v)) return i18n.commonInputTextValidationFisrtSpace;
    if (lastSpace(v)) return i18n.commonInputTextValidationLastSpace;

    return null;
  }

  return UseReturn(
    validateForm: validateForm,
  );
}
