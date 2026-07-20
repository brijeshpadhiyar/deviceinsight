import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

Future<T?> showGlassDialog<T>({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withValues(alpha: 0.2), // Lighter barrier for glass
    builder: (BuildContext context) {
      return GlassDialog(child: child);
    },
  );
}

class GlassDialog extends StatelessWidget {
  final Widget child;

  const GlassDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final color = isDark ? Colors.white : Colors.white;
    final gradientStart = color.withValues(alpha: isDark ? 0.1 : 0.6);
    final gradientEnd = color.withValues(alpha: isDark ? 0.05 : 0.2);
    final borderColor = isDark ? Colors.white.withValues(alpha: AppColors.glassBorderOpacityDark) : Colors.white.withValues(alpha: AppColors.glassBorderOpacityLight);

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
              color: (isDark ? Colors.black : Colors.white).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
              border: Border.all(
                color: borderColor,
                width: AppSizes.glassBorderWidth,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [gradientStart, gradientEnd],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
