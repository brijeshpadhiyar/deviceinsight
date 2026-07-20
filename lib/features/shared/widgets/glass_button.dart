import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_motion.dart';

class GlassButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final Color? color;

  const GlassButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.p32, vertical: AppSizes.p16),
    this.color,
  });

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) => setState(() => _isPressed = true);
  
  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    widget.onPressed();
  }
  
  void _handleTapCancel() => setState(() => _isPressed = false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primaryColor = widget.color ?? theme.colorScheme.primary;
    
    final color = Colors.white;
    final gradientStart = color.withValues(alpha: isDark ? 0.15 : 0.6);
    final gradientEnd = color.withValues(alpha: isDark ? 0.05 : 0.2);
    final borderColor = isDark 
        ? Colors.white.withValues(alpha: AppColors.glassBorderOpacityDark * 2) 
        : Colors.white.withValues(alpha: AppColors.glassBorderOpacityLight * 1.5);

    Widget button = GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: isDark ? 0.2 : 0.1),
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
                  color: primaryColor.withValues(alpha: _isPressed ? 0.3 : 0.1),
                  blurRadius: _isPressed ? 12 : 24,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: widget.padding,
            child: Center(
              child: DefaultTextStyle(
                style: theme.textTheme.labelLarge!.copyWith(
                  color: isDark ? Colors.white : primaryColor.withRed(primaryColor.r.toInt() - 20),
                  letterSpacing: 1.0,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );

    return button.animate(target: _isPressed ? 1 : 0)
        .scale(
          begin: const Offset(1, 1), 
          end: const Offset(0.92, 0.92), 
          duration: AppMotion.fast, 
          curve: AppMotion.decelerate
        );
  }
}
