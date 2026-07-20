import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16, vertical: AppSizes.p16),
          child: _GlassNavBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _GlassNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _GlassNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final borderColor = isDark 
        ? Colors.white.withValues(alpha: AppColors.glassBorderOpacityDark * 2) 
        : Colors.white.withValues(alpha: AppColors.glassBorderOpacityLight);

    final items = [
      (Icons.dashboard_outlined, Icons.dashboard, 'Dashboard'),
      (Icons.battery_full_outlined, Icons.battery_full, 'Battery'),
      (Icons.memory_outlined, Icons.memory, 'CPU'),
      (Icons.psychology_outlined, Icons.psychology, 'Memory'),
      (Icons.wifi_outlined, Icons.wifi, 'Network'),
      (Icons.storage_outlined, Icons.storage, 'Storage'),
      (Icons.security_outlined, Icons.security, 'Security'),
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.p8),
          decoration: BoxDecoration(
            color: (isDark ? Colors.black : Colors.white).withValues(alpha: isDark ? 0.3 : 0.7),
            borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
            border: Border.all(color: borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isSelected = currentIndex == index;
              final icon = isSelected ? items[index].$2 : items[index].$1;
              
              Widget itemWidget = GestureDetector(
                onTap: () => onTap(index),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? theme.colorScheme.primary.withValues(alpha: 0.15) 
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                  ),
                  child: Icon(
                    icon,
                    color: isSelected ? theme.colorScheme.primary : theme.iconTheme.color?.withValues(alpha: 0.5),
                    size: 26,
                  ),
                ),
              );

              if (isSelected) {
                itemWidget = itemWidget.animate()
                    .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1), duration: 200.ms, curve: Curves.easeOutBack)
                    .tint(color: theme.colorScheme.primary, end: 0.2);
              }

              return itemWidget;
            }),
          ),
        ),
      ),
    );
  }
}
