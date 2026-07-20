import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class GlassScaffold extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool safeArea;

  const GlassScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.safeArea = true,
  });

  @override
  State<GlassScaffold> createState() => _GlassScaffoldState();
}

class _GlassScaffoldState extends State<GlassScaffold> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Mesh colors based on theme
    final color1 = isDark ? AppColors.meshDark1 : AppColors.meshLight1;
    final color2 = isDark ? AppColors.meshDark2 : AppColors.meshLight2;
    final color3 = isDark ? AppColors.meshDark3 : AppColors.meshLight3;
    final color4 = isDark ? AppColors.meshDark4 : AppColors.meshLight4;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: widget.appBar,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      body: Stack(
        children: [
          // Animated Background Orbs (Organic movement)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final t = _controller.value * 2 * math.pi;
              
              return Stack(
                children: [
                  Positioned(
                    top: -100 + math.sin(t) * 100,
                    left: -100 + math.cos(t) * 50,
                    child: Container(
                      width: 500,
                      height: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color1.withValues(alpha: isDark ? 0.6 : 0.8),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -150 + math.cos(t + math.pi / 2) * 80,
                    right: -100 + math.sin(t) * 120,
                    child: Container(
                      width: 450,
                      height: 450,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color2.withValues(alpha: isDark ? 0.5 : 0.7),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200 + math.sin(t + math.pi) * 150,
                    right: -50 + math.cos(t + math.pi) * 80,
                    child: Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color3.withValues(alpha: isDark ? 0.6 : 0.8),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200 + math.cos(t + math.pi / 4) * 100,
                    left: -50 + math.sin(t + math.pi / 4) * 100,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color4.withValues(alpha: isDark ? 0.4 : 0.6),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          
          // Ultra-high blur layer for that premium glass/mesh feel
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          
          // Actual Content
          if (widget.safeArea) SafeArea(child: widget.body) else widget.body,
        ],
      ),
    );
  }
}

