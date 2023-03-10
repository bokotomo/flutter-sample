import 'package:flutter/material.dart' show ValueNotifier;
import 'package:flutter_hooks/flutter_hooks.dart' show useState;

class UseReturn {
  const UseReturn({
    required this.onPressedEdit,
  });

  final void Function() onPressedEdit;
}

///
UseReturn useHooks() {
  ValueNotifier<bool> isEditMode = useState<bool>(false);

  /// 振り返りの追加を押した
  void onPressedEdit() {
    isEditMode.value = true;
  }

  return UseReturn(
    onPressedEdit: onPressedEdit,
  );
}
