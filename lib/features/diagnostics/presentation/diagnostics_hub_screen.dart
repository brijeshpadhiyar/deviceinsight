import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'package:flutter/services.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class DiagnosticsHubScreen extends ConsumerWidget {
  const DiagnosticsHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Hardware Diagnostics'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 100,
          left: AppSizes.p20,
          right: AppSizes.p20,
          bottom: 120, // accommodate floating nav bar
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlassCard(
              animateOnEntry: true,
              padding: const EdgeInsets.all(AppSizes.p32),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withValues(alpha: 0.3),
                          blurRadius: 24,
                        )
                      ]
                    ),
                    child: const Icon(Icons.build_circle_outlined, size: 48, color: Colors.blueAccent)
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .scale(begin: const Offset(1,1), end: const Offset(1.05, 1.05), duration: 1.seconds),
                  ),
                  gapH24,
                  Text('Interactive Testing Suite', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                  gapH12,
                  Text(
                    'Perform manual validations of your hardware components to ensure maximum reliability.', 
                    textAlign: TextAlign.center, 
                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7), height: 1.5)
                  ),
                ],
              ),
            ),
            gapH32,
            
            Text('Display & Touch', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 100.ms),
            gapH16,
            _buildTestItem(context, 'Color Accuracy & Pixels', Icons.palette_outlined, Colors.purpleAccent, () {
              // Placeholder for full screen RGB test
            }, 200),
            _buildTestItem(context, 'Multi-touch Validation', Icons.touch_app_outlined, Colors.lightBlueAccent, () {
              // Placeholder for Multi-touch
            }, 300),

            gapH32,
            Text('Audio & Haptics', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 400.ms),
            gapH16,
            _buildTestItem(context, 'Vibration Engine', Icons.vibration_outlined, Colors.orangeAccent, () {
               const MethodChannel('com.example.deviceinsight/native').invokeMethod('vibrate', {'duration': 1000});
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content: const Text('Testing Haptic Engine...', style: TextStyle(fontWeight: FontWeight.bold)),
                 backgroundColor: theme.colorScheme.primary,
                 behavior: SnackBarBehavior.floating,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
               ));
            }, 500),
            _buildTestItem(context, 'Speaker Output', Icons.speaker_outlined, AppColors.healthExcellent, () {
            }, 600),

            gapH32,
            Text('Sensors & Hardware', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 700.ms),
            gapH16,
            _buildTestItem(context, 'Flashlight Toggle', Icons.flashlight_on_outlined, Colors.amberAccent, () {
               const MethodChannel('com.example.deviceinsight/native').invokeMethod('setFlashlight', {'enable': true});
               Future.delayed(const Duration(seconds: 2), () {
                 const MethodChannel('com.example.deviceinsight/native').invokeMethod('setFlashlight', {'enable': false});
               });
            }, 800),
            
          ],
        ),
      ),
    );
  }

  Widget _buildTestItem(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap, int delay) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.p16),
      child: GlassCard(
        animateOnEntry: true,
        onTap: onTap,
        padding: const EdgeInsets.all(AppSizes.p20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 24),
            ),
            gapW20,
            Expanded(
              child: Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
            ),
            Icon(Icons.chevron_right, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
          ],
        ),
      ).animate().fadeIn(delay: delay.ms).slideX(begin: 0.1),
    );
  }
}
