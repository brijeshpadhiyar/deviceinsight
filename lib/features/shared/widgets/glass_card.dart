import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_motion.dart';

class GlassCard extends StatefulWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final bool animateOnEntry;

  const GlassCard({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.1,
    this.padding = const EdgeInsets.all(AppSizes.p16),
    this.onTap,
    this.animateOnEntry = false,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isPressed = false;
  bool _isHovered = false;

  void _handleTapDown(TapDownDetails details) {
    if (widget.onTap != null) setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.onTap != null) {
      setState(() => _isPressed = false);
      widget.onTap!();
    }
  }

  void _handleTapCancel() {
    if (widget.onTap != null) setState(() => _isPressed = false);
  }

  void _handleMouseEnter(PointerEvent details) {
    if (widget.onTap != null) setState(() => _isHovered = true);
  }

  void _handleMouseExit(PointerEvent details) {
    if (widget.onTap != null) setState(() => _isHovered = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final color = Colors.white;
    // Enhanced glass reflections
    final gradientStart = color.withValues(alpha: isDark ? 0.08 : 0.6);
    final gradientEnd = color.withValues(alpha: isDark ? 0.02 : 0.15);
    final borderColor = isDark 
        ? Colors.white.withValues(alpha: AppColors.glassBorderOpacityDark) 
        : Colors.white.withValues(alpha: AppColors.glassBorderOpacityLight);
    
    // Add subtle glow to the background in dark mode
    final bgColor = isDark 
        ? AppColors.primaryDark.withValues(alpha: 0.03) 
        : Colors.white.withValues(alpha: 0.3);

    Widget card = ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: AppSizes.glassBlur, sigmaY: AppSizes.glassBlur),
        child: MouseRegion(
          onEnter: _handleMouseEnter,
          onExit: _handleMouseExit,
          cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: GestureDetector(
            onTapDown: _handleTapDown,
            onTapUp: _handleTapUp,
            onTapCancel: _handleTapCancel,
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                border: Border.all(
                  color: borderColor,
                  width: AppSizes.glassBorderWidth,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [gradientStart, gradientEnd],
                  stops: const [0.0, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black.withValues(alpha: 0.4) : Colors.black.withValues(alpha: 0.05),
                    blurRadius: _isHovered ? AppSizes.glassElevation * 1.5 : AppSizes.glassElevation,
                    offset: Offset(0, _isHovered ? 12 : 8),
                  ),
                  // Inner highlight simulation
                  BoxShadow(
                    color: Colors.white.withValues(alpha: isDark ? 0.05 : 0.4),
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              padding: widget.padding,
              child: widget.child,
            ),
          ),
        ),
      ),
    );

    // Calculate target scale based on press and hover states
    double targetScale = 1.0;
    if (_isPressed) {
      targetScale = 0.97;
    } else if (_isHovered) {
      targetScale = 1.02;
    }

    // Apply press animation
    card = card.animate(target: targetScale)
        .scale(
          begin: const Offset(1, 1), 
          duration: AppMotion.fast, 
          curve: AppMotion.decelerate
        )
        .tint(color: Colors.white, end: _isPressed ? 0.1 : 0);

    // Optional entry animation
    if (widget.animateOnEntry) {
      card = card.animate()
          .fade(duration: AppMotion.standard, curve: AppMotion.defaultCurve)
          .slideY(begin: 0.1, end: 0, duration: AppMotion.standard, curve: AppMotion.emphasized);
    }

    return card;
  }
}

