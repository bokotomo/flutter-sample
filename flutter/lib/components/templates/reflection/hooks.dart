import 'package:flutter/material.dart'
    show BuildContext, Navigator, MaterialPageRoute;
import 'package:gamer_reflection/components/pages/reflection_add/reflection_add.dart'
    show PageReflectionAdd;

class UseReturn {
  const UseReturn({
    required this.onPressedStart,
  });
  final Function(BuildContext) onPressedStart;
}

///
UseReturn useHooks() {
  /// 開始を押した
  void onPressedStart(BuildContext context) {
    const PageReflectionAdd page = PageReflectionAdd(title: "振り返り名A");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => page,
      ),
    ).then((v) {});
  }

  return UseReturn(
    onPressedStart: onPressedStart,
  );
}
