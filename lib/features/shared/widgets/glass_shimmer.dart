import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants/app_sizes.dart';

class GlassShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const GlassShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = AppSizes.radiusMedium,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final baseColor = isDark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.05);
    final highlightColor = isDark ? Colors.white.withValues(alpha: 0.2) : Colors.black.withValues(alpha: 0.1);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
