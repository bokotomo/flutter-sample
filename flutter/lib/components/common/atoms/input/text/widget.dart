import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor;
import 'package:gamer_reflection/modules/const/color/input.dart'
    show ConstantColorInput;
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;
import 'package:gamer_reflection/components/common/atoms/input/text/validate.dart'
    show useValidate;

/// input: 文字入力欄
class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.i18n,
    required this.hintText,
    required this.text,
    this.autofocus,
    this.focusNode,
    this.onChanged,
    this.maxLength,
    this.onPressedRemove,
  });

  /// 言語
  final AppLocalizations i18n;

  /// プレフィックス
  final TextEditingController text;

  /// プレフィックス
  final String hintText;

  /// 文字数
  final int? maxLength;

  /// 自動フォーカス
  final bool? autofocus;

  /// フォーカスノード
  final FocusNode? focusNode;

  /// 変更した
  final void Function(String?)? onChanged;

  /// 削除する
  final void Function()? onPressedRemove;

  @override
  Widget build(BuildContext context) {
    final v = useValidate(maxLength, i18n);

    /// 変更された
    void onChanged(String? t) {
      if (this.onChanged == null) return;
      this.onChanged!(t);
    }

    /// 削除を押した
    void onPressedRemove() {
      if (this.onPressedRemove == null) return;
      this.onPressedRemove!();
    }

    /// inputのスタイル
    InputDecoration decoration(String hintText) {
      return InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorderFocus,
            width: 2.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorder,
            width: 2.0,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorderError,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(
            color: ConstantColorInput.inputBorderError,
            width: 2.0,
          ),
        ),
        errorStyle: TextStyle(
          color: ConstantColorInput.inputErrorText,
          fontSize: i18n.localeName == 'de' ? 10 : 12,
        ),
        filled: true,
        fillColor: ConstantColorInput.input,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: ConstantColorInput.inputHintText,
        ),
        contentPadding: EdgeInsets.only(
          left: ConstantSizeUI.l3,
          right: this.onPressedRemove == null
              ? ConstantSizeUI.l3
              : ConstantSizeUI.l6,
        ),
      );
    }

    return Stack(
      children: [
        TextFormField(
          controller: text,
          style: const TextStyle(color: ConstantColor.text),
          decoration: decoration(hintText),
          autofocus: autofocus ?? false,
          focusNode: focusNode,
          onChanged: onChanged,
          maxLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: v.validateForm,
        ),

        /// 内容を消すバツボタン
        if (this.onPressedRemove != null)
          SizedBox(
            height: 45,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                color: ConstantColor.iconThin,
                padding: const EdgeInsets.only(right: ConstantSizeUI.l2),
                constraints: const BoxConstraints(),
                iconSize: 24,
                icon: const Icon(Icons.highlight_off),
                onPressed: onPressedRemove,
              ),
            ),
          )
      ],
    );
  }
}
