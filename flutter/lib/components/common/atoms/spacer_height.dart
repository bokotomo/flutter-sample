import 'package:flutter/material.dart';
import 'package:gamer_reflection/modules/const/size.dart' show ConstantSizeUI;

/// スペーサー
class SpacerHeight {
  SpacerHeight._();

  /// XS
  static const SizedBox xs = SizedBox(height: ConstantSizeUI.l1);

  /// S
  static const SizedBox s = SizedBox(height: ConstantSizeUI.l2);

  /// M
  static const SizedBox m = SizedBox(height: ConstantSizeUI.l3);

  /// XM
  static const SizedBox xm = SizedBox(height: ConstantSizeUI.l4);

  /// L
  static const SizedBox l = SizedBox(height: ConstantSizeUI.l5);

  /// XL
  static const SizedBox xl = SizedBox(height: ConstantSizeUI.l6);
}
