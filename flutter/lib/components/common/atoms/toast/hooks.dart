import 'package:flutter/material.dart' show BuildContext;
import 'package:gamer_reflection/components/common/atoms/toast/basic.dart'
    show ToastBasic;
import 'package:gamer_reflection/components/common/atoms/toast/alert.dart'
    show ToastAlert;
import 'package:fluttertoast/fluttertoast.dart' show FToast, ToastGravity;

class UseReturn {
  const UseReturn({
    required this.showNotification,
    required this.showAlert,
  });
  final Function(String, int) showNotification;
  final Function(String, int) showAlert;
}

/// トースト
UseReturn useToast(BuildContext context) {
  final FToast fToast = FToast();
  fToast.init(context);

  /// トーストを表示: 基本
  void showNotification(String text, int milliseconds) {
    fToast.showToast(
      child: ToastBasic(text: text),
      gravity: ToastGravity.TOP,
      toastDuration: Duration(milliseconds: milliseconds),
    );
  }

  /// トーストを表示: アラート
  void showAlert(String text, int milliseconds) {
    fToast.showToast(
      child: ToastAlert(text: text),
      gravity: ToastGravity.TOP,
      toastDuration: Duration(milliseconds: milliseconds),
    );
  }

  return UseReturn(
    showNotification: showNotification,
    showAlert: showAlert,
  );
}
