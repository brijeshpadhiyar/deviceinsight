import 'package:flutter/material.dart';

class AppColors {
  // Dark Theme Colors - True OLED Black & Deep Amethyst
  static const Color backgroundDark = Color(0xFF000000); // True OLED black
  static const Color surfaceDark = Color(0xFF09090B); // Very dark gray for slight elevation
  static const Color primaryDark = Color(0xFF8B5CF6); // Vibrant Amethyst (Purple)
  static const Color secondaryDark = Color(0xFF06B6D4); // Neon Cyan
  static const Color accentDark = Color(0xFFF43F5E); // Rose Pink accent
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  
  // Mesh Gradient Colors Dark - Deep, ethereal glows
  static const Color meshDark1 = Color(0xFF4C1D95); // Deep Purple
  static const Color meshDark2 = Color(0xFF0F172A); // Slate
  static const Color meshDark3 = Color(0xFF0891B2); // Deep Cyan
  static const Color meshDark4 = Color(0xFF000000); // Fade to black

  // Light Theme Colors - Soft, Frosted Alabaster
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color primaryLight = Color(0xFF4F46E5); // Indigo
  static const Color secondaryLight = Color(0xFF0EA5E9); // Sky Blue
  static const Color accentLight = Color(0xFFE11D48); // Rose
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);

  // Mesh Gradient Colors Light - Airy, soft pastels
  static const Color meshLight1 = Color(0xFFE0E7FF);
  static const Color meshLight2 = Color(0xFFF1F5F9);
  static const Color meshLight3 = Color(0xFFE0F2FE);
  static const Color meshLight4 = Color(0xFFFFFFFF);

  // Shared status colors - More vibrant for premium feel
  static const Color success = Color(0xFF10B981); // Vibrant Emerald
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color error = Color(0xFFEF4444); // Red
  static const Color info = Color(0xFF3B82F6); // Blue

  // Health Score Colors
  static const Color healthExcellent = Color(0xFF10B981);
  static const Color healthGood = Color(0xFF84CC16); // Lime
  static const Color healthFair = Color(0xFFF59E0B);
  static const Color healthPoor = Color(0xFFE11D48);
  
  // Glassmorphism specific constants
  static const double glassOpacityLight = 0.50; // Increased transparency for better frosted look
  static const double glassOpacityDark = 0.15; // Kept low for OLED blending
  static const double glassBorderOpacityLight = 0.25;
  static const double glassBorderOpacityDark = 0.08; // Very subtle borders in dark mode
}
