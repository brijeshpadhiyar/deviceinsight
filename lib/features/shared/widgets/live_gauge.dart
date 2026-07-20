import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_sizes.dart';

class LiveGauge extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final Color color;
  final String title;
  final String subtitle;
  final IconData? icon;

  const LiveGauge({
    super.key,
    required this.value,
    required this.color,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final glowColor = color.withValues(alpha: isDark ? 0.3 : 0.2);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Outer glow for the gauge
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: glowColor,
                      blurRadius: 20,
                      spreadRadius: -5,
                    ),
                  ],
                ),
              ),
              // Background track (subtle glass-like ring)
              CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 8,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
              ),
              // Actual progress
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: value.clamp(0.0, 1.0)),
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOutCubic,
                builder: (context, val, _) {
                  return CircularProgressIndicator(
                    value: val,
                    strokeWidth: 8,
                    color: color,
                    strokeCap: StrokeCap.round,
                    backgroundColor: Colors.transparent,
                  );
                },
              ),
              // Center content
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) 
                      Icon(icon, color: color, size: 24).animate().scale(delay: 200.ms),
                    if (icon != null) gapH4,
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                        letterSpacing: -0.5,
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                  ],
                ),
              ),
            ],
          ),
        ),
        gapH16, // Slightly increased gap
        Text(
          subtitle,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
