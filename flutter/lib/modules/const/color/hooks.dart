import 'package:flutter/material.dart' show Color, AsyncSnapshot, ValueNotifier;
import 'package:gamer_reflection/modules/const/color/base.dart'
    show ConstantColor, ConstantColorLight;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useMemoized, useFuture, useEffect, useState;
import 'package:gamer_reflection/storage/kvs/selected_color_mode.dart'
    show selectColorMode;

class ColorBase {
  const ColorBase({
    required this.header,
    required this.footer,
    required this.content,
  });

  final Color header;
  final Color footer;
  final Color content;
}

class UseReturn {
  const UseReturn({
    required this.changeColor,
    required this.base,
  });

  final Function changeColor;
  final ColorBase base;
}

UseReturn useColor() {
  /// 選択している期間
  final Future<String?> memoedColorMode =
      useMemoized(() => selectColorMode.get());
  final AsyncSnapshot<String?> futuredColorMode = useFuture(memoedColorMode);

  /// 選択カラー
  ValueNotifier<String> colorMode = useState<String>('dark');

  useEffect(() {
    if (futuredColorMode.data == null) return;
    colorMode.value = futuredColorMode.data ?? "dark";
    return;
  }, [futuredColorMode.data]);

  /// 色モード変更
  changeColor(String mode) => colorMode.value = mode;

  /// カラーモードはダークか
  isDark() => colorMode.value == 'dark';

  /// ヘッダーの背景色
  header() {
    if (isDark()) return ConstantColor.header;
    return ConstantColorLight.header;
  }

  /// フッターの背景色
  footer() {
    if (isDark()) return ConstantColor.footer;
    return ConstantColorLight.footer;
  }

  /// コンテンツの背景色
  content() {
    if (isDark()) return ConstantColor.content;
    return ConstantColorLight.content;
  }

  return UseReturn(
    changeColor: changeColor,
    base: ColorBase(
      header: header(),
      footer: footer(),
      content: content(),
    ),
  );
}
