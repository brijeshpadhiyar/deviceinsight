import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  const GlassAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final color = Colors.white;
    final gradientStart = color.withValues(alpha: isDark ? 0.08 : 0.6);
    final gradientEnd = color.withValues(alpha: isDark ? 0.02 : 0.15);
    final borderColor = isDark
        ? Colors.white.withValues(alpha: AppColors.glassBorderOpacityDark)
        : Colors.white.withValues(alpha: AppColors.glassBorderOpacityLight);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          decoration: BoxDecoration(
            color: (isDark ? Colors.black : Colors.white).withValues(
              alpha: isDark ? 0.15 : 0.4,
            ),
            border: Border(
              bottom: BorderSide(
                color: borderColor,
                width: AppSizes.glassBorderWidth,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [gradientStart, gradientEnd],
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 64.0, // Slightly taller for premium feel
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.p12,
                    ),
                    child: Row(
                      children: [
                        ?leading,
                        if (leading == null && Navigator.canPop(context))
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 20,
                            ),
                            onPressed: () => Navigator.pop(context),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.white.withValues(alpha: 0.1),
                          ),
                        Expanded(
                          child: Align(
                            alignment: centerTitle
                                ? Alignment.center
                                : Alignment.centerLeft,
                            child: DefaultTextStyle(
                              style: theme.textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                              ),
                              child: title,
                            ),
                          ),
                        ),
                        ...?actions,
                      ],
                    ),
                  ),
                ),
                ?bottom,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    64.0 + AppSizes.glassBorderWidth + (bottom?.preferredSize.height ?? 0.0),
  );
}
