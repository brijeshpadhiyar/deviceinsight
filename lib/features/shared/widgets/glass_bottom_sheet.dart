import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

Future<T?> showGlassBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  bool isScrollControlled = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    elevation: 0,
    isScrollControlled: isScrollControlled,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    builder: (BuildContext context) {
      return GlassBottomSheet(child: child);
    },
  );
}

class GlassBottomSheet extends StatelessWidget {
  final Widget child;

  const GlassBottomSheet({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final color = isDark ? Colors.white : Colors.white;
    final gradientStart = color.withValues(alpha: isDark ? 0.1 : 0.5);
    final gradientEnd = color.withValues(alpha: isDark ? 0.05 : 0.15);
    final borderColor = isDark ? Colors.white.withValues(alpha: AppColors.glassBorderOpacityDark) : Colors.white.withValues(alpha: AppColors.glassBorderOpacityLight);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLarge)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          decoration: BoxDecoration(
            color: (isDark ? Colors.black : Colors.white).withValues(alpha: 0.2),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLarge)),
            border: Border(
              top: BorderSide(color: borderColor, width: AppSizes.glassBorderWidth),
              left: BorderSide(color: borderColor, width: AppSizes.glassBorderWidth),
              right: BorderSide(color: borderColor, width: AppSizes.glassBorderWidth),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [gradientStart, gradientEnd],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSizes.p12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Flexible(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
