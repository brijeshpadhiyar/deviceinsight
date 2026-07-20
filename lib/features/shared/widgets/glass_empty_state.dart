import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_motion.dart';
import 'glass_button.dart';
import 'glass_card.dart';

class GlassEmptyState extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final VoidCallback? onAction;
  final String? actionText;

  const GlassEmptyState({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    this.onAction,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.p32),
        child: GlassCard(
          padding: const EdgeInsets.all(AppSizes.p32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.p20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: theme.colorScheme.primary, size: 48),
              ).animate().scale(
                  duration: AppMotion.standard,
                  delay: AppMotion.fast, 
                  curve: AppMotion.bounce
              ),
              gapH24,
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: AppMotion.standard, delay: const Duration(milliseconds: 250)).slideY(begin: 0.2, curve: AppMotion.emphasized),
              gapH12,
              Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: AppMotion.standard, delay: AppMotion.standard).slideY(begin: 0.2, curve: AppMotion.emphasized),
              if (onAction != null && actionText != null) ...[
                gapH32,
                GlassButton(
                  onPressed: onAction!,
                  child: Text(actionText!),
                ).animate().fadeIn(duration: AppMotion.standard, delay: const Duration(milliseconds: 400)).slideY(begin: 0.2, curve: AppMotion.emphasized),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
