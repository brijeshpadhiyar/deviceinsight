import 'package:flutter/animation.dart';

class AppMotion {
  // Durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration standard = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration extraSlow = Duration(milliseconds: 800);

  // Curves
  static const Curve defaultCurve = Curves.fastOutSlowIn;
  static const Curve emphasized = Curves.easeInOutCubicEmphasized;
  static const Curve decelerate = Curves.easeOutQuart;
  static const Curve bounce = Curves.easeOutBack;
}
