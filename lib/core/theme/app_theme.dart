import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class AppTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    // Exclusively using Outfit for a modern, premium flagship feel
    return GoogleFonts.outfitTextTheme(base).copyWith(
      displayLarge: GoogleFonts.outfit(textStyle: base.displayLarge, fontWeight: FontWeight.bold, letterSpacing: -1.5),
      displayMedium: GoogleFonts.outfit(textStyle: base.displayMedium, fontWeight: FontWeight.bold, letterSpacing: -1.0),
      displaySmall: GoogleFonts.outfit(textStyle: base.displaySmall, fontWeight: FontWeight.bold, letterSpacing: -0.5),
      headlineLarge: GoogleFonts.outfit(textStyle: base.headlineLarge, fontWeight: FontWeight.w700, letterSpacing: -0.5),
      headlineMedium: GoogleFonts.outfit(textStyle: base.headlineMedium, fontWeight: FontWeight.w600, letterSpacing: -0.25),
      headlineSmall: GoogleFonts.outfit(textStyle: base.headlineSmall, fontWeight: FontWeight.w600),
      titleLarge: GoogleFonts.outfit(textStyle: base.titleLarge, fontWeight: FontWeight.w600, letterSpacing: 0),
      titleMedium: GoogleFonts.outfit(textStyle: base.titleMedium, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      titleSmall: GoogleFonts.outfit(textStyle: base.titleSmall, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: GoogleFonts.outfit(textStyle: base.bodyLarge, fontWeight: FontWeight.normal, letterSpacing: 0.2),
      bodyMedium: GoogleFonts.outfit(textStyle: base.bodyMedium, fontWeight: FontWeight.normal, letterSpacing: 0.2),
      labelLarge: GoogleFonts.outfit(textStyle: base.labelLarge, fontWeight: FontWeight.w600, letterSpacing: 0.5),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        tertiary: AppColors.accentLight,
        surface: Colors.transparent, // Important for glass scaffold
        error: AppColors.error,
      ),
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: _buildTextTheme(ThemeData.light().textTheme).apply(
        bodyColor: AppColors.textPrimaryLight,
        displayColor: AppColors.textPrimaryLight,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight.withValues(alpha: AppColors.glassOpacityLight),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: SharedAxisPageTransitionsBuilder(transitionType: SharedAxisTransitionType.horizontal),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.textPrimaryLight.withValues(alpha: 0.1),
        thickness: 1,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        tertiary: AppColors.accentDark,
        surface: Colors.transparent, // Important for glass scaffold
        error: AppColors.error,
      ),
      scaffoldBackgroundColor: AppColors.backgroundDark,
      textTheme: _buildTextTheme(ThemeData.dark().textTheme).apply(
        bodyColor: AppColors.textPrimaryDark,
        displayColor: AppColors.textPrimaryDark,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark.withValues(alpha: AppColors.glassOpacityDark),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: SharedAxisPageTransitionsBuilder(transitionType: SharedAxisTransitionType.horizontal),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.textPrimaryDark.withValues(alpha: 0.1),
        thickness: 1,
      ),
    );
  }
}
