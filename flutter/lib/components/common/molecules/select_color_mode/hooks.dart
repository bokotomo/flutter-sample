import 'package:flutter/material.dart' show AsyncSnapshot, ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState;
import 'package:gamer_reflection/components/common/atoms/input_select.dart'
    show SelectItem;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useEffect, useMemoized, useFuture;
import 'package:gamer_reflection/modules/storage/selected_color_mode.dart'
    show selectColorMode;

class UseReturn {
  const UseReturn({
    required this.onChanged,
    required this.colors,
    required this.colorMode,
  });

  final Function(String? t) onChanged;
  final List<SelectItem> colors;
  final String colorMode;
}

///
UseReturn useHooks() {
  /// 選択している期間
  final Future<String?> memoedColorMode =
      useMemoized(() => selectColorMode.get());
  final AsyncSnapshot<String?> futuredColorMode = useFuture(memoedColorMode);

  /// 選択カラーモード
  ValueNotifier<String> colorMode = useState<String>("dark");

  /// 変更を押した
  void onChanged(String? t) {
    selectColorMode.save(t ?? "dark");
  }

  /// カラーモード
  const List<SelectItem> colors = [
    SelectItem(text: 'ダークモード', value: 'dark'),
    SelectItem(text: 'ライトモード', value: 'light'),
  ];

  useEffect(() {
    if (futuredColorMode.data == null) return;

    /// 初期選択言語
    colorMode.value = futuredColorMode.data ?? "dark";
  }, [futuredColorMode.data]);

  return UseReturn(
    onChanged: onChanged,
    colors: colors,
    colorMode: colorMode.value,
  );
}
