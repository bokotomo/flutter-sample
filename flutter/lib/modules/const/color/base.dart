import 'package:flutter/material.dart' show Color, AsyncSnapshot, ValueNotifier;
import 'package:gamer_reflection/modules/const/color/colors.dart'
    show darkBlue, darkBlueLittle, white, grayDark, grayLight;
import 'package:flutter_hooks/flutter_hooks.dart'
    show useMemoized, useFuture, useEffect, useState;
import 'package:gamer_reflection/storage/kvs/selected_color_mode.dart'
    show selectColorMode;

class UseReturn {
  const UseReturn({
    required this.header,
  });

  final Color header;
}

UseReturn useColorBase() {
  /// 選択している期間
  // final Future<String?> memoedColorMode =
  //     useMemoized(() => selectColorMode.get());
  // final AsyncSnapshot<String?> futuredColorMode = useFuture(memoedColorMode);

  /// 選択カラー
  ValueNotifier<bool> isDark = useState<bool>(true);

  // // final isDark = futuredColorMode.data == "dark";
  // print("okfokreofkeorefr");

  // useEffect(() {
  //   if (futuredColorMode.data == null) return;
  //   print("tomtomot");
  //   isDark.value = futuredColorMode.data == "dark";
  //   print(futuredColorMode.data);
  // }, [futuredColorMode.data]);
  // isDark() async => await selectColorMode.get() == "dark";

  final header =
      isDark.value ? darkBlueLittle : const Color.fromARGB(120, 255, 104, 104);

  // /// ヘッダーの背景色
  // Color header() async {
  //   final a = await isDark();
  //   return a ? darkBlueLittle : Color.fromARGB(120, 255, 104, 104);
  // }

  return UseReturn(header: header);
  // return UseReturn(header: Color.fromARGB(120, 255, 104, 104));
}

/// 用途ごとに色を定義する
class ConstantColor {
  ConstantColor._();

  /// ヘッダーの背景色
  static const Color header = darkBlueLittle;

  /// フッターの背景色
  static const Color footer = darkBlueLittle;

  /// コンテンツの背景色
  static const Color content = darkBlue;

  /// 基本的な文字色
  static const Color text = white;

  /// 薄い文字
  static const Color textOpacity = Color.fromARGB(120, 255, 255, 255);

  /// ボックスの背景色
  static const Color box = grayDark;

  /// ボックスの枠線色
  static const Color boxBorder = grayLight;

  /// タスクリストの矢印の色
  static const Color taskListArrow = Color.fromARGB(55, 255, 255, 255);

  /// アイコンの色
  static const Color icon = Color.fromARGB(200, 255, 255, 255);

  /// 薄いアイコンの色
  static const Color iconThin = Color.fromARGB(160, 255, 255, 255);

  /// モーダルのコンテンツ後ろの背景
  static const Color modalBackground = Color.fromARGB(180, 0, 0, 0);
}
