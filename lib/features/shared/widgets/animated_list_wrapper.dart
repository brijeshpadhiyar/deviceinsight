import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_motion.dart';

/// A wrapper that applies staggered entrance animations to a list of children.
class AnimatedListWrapper extends StatelessWidget {
  final List<Widget> children;
  final bool animateOnEntry;
  final Duration delay;
  final Duration interval;

  const AnimatedListWrapper({
    super.key,
    required this.children,
    this.animateOnEntry = true,
    this.delay = Duration.zero,
    this.interval = const Duration(milliseconds: 50),
  });

  @override
  Widget build(BuildContext context) {
    if (!animateOnEntry) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: AnimateList(
        interval: interval,
        effects: [
          FadeEffect(duration: AppMotion.standard, curve: AppMotion.defaultCurve, delay: delay),
          SlideEffect(begin: const Offset(0, 0.1), end: Offset.zero, duration: AppMotion.standard, curve: AppMotion.emphasized, delay: delay),
        ],
        children: children,
      ).toList(),
    );
  }
}
