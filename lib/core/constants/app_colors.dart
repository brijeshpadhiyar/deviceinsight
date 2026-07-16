import 'package:flutter/material.dart';

class AppColors {
  // Dark Theme Colors - Premium Charcoal & OLED Black
  static const Color backgroundDark = Color(0xFF09090B); // Deeper black for OLED support
  static const Color surfaceDark = Color(0xFF18181B);
  static const Color primaryDark = Color(0xFF3B82F6); // Electric Blue
  static const Color secondaryDark = Color(0xFF10B981); // Emerald Green
  static const Color textPrimaryDark = Color(0xFFFAFAFA);
  static const Color textSecondaryDark = Color(0xFFA1A1AA);

  // Light Theme Colors - Premium Whites & Grays
  static const Color backgroundLight = Color(0xFFF4F4F5);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color primaryLight = Color(0xFF2563EB); // Royal Blue
  static const Color secondaryLight = Color(0xFF059669); // Deep Emerald
  static const Color textPrimaryLight = Color(0xFF18181B);
  static const Color textSecondaryLight = Color(0xFF52525B);

  // Shared status colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Health Score Colors
  static const Color healthExcellent = Color(0xFF10B981);
  static const Color healthGood = Color(0xFF84CC16);
  static const Color healthFair = Color(0xFFF59E0B);
  static const Color healthPoor = Color(0xFFEF4444);
}
