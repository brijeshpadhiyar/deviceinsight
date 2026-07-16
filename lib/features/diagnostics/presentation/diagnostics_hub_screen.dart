import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'package:flutter/services.dart';

class DiagnosticsHubScreen extends ConsumerWidget {
  const DiagnosticsHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hardware Diagnostics'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlassCard(
              padding: const EdgeInsets.all(AppSizes.p24),
              child: Column(
                children: [
                  const Icon(Icons.build_circle, size: 48, color: Colors.blue),
                  gapH16,
                  Text('Interactive Testing Suite', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  gapH8,
                  Text('Perform manual validations of your hardware components to ensure maximum reliability.', textAlign: TextAlign.center, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                ],
              ),
            ).animate().fadeIn(),
            gapH24,
            
            Text('Display & Touch', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)).animate().fadeIn(delay: 100.ms),
            gapH12,
            _buildTestItem(context, 'Color Accuracy & Pixels', Icons.palette, Colors.purple, () {
              // Placeholder for full screen RGB test
            }).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1),
            _buildTestItem(context, 'Multi-touch Validation', Icons.touch_app, Colors.blue, () {
              // Placeholder for Multi-touch
            }).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1),

            gapH24,
            Text('Audio & Haptics', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)).animate().fadeIn(delay: 400.ms),
            gapH12,
            _buildTestItem(context, 'Vibration Engine', Icons.vibration, Colors.orange, () {
               const MethodChannel('com.example.deviceinsight/native').invokeMethod('vibrate', {'duration': 1000});
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Testing Haptic Engine...')));
            }).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1),
            _buildTestItem(context, 'Speaker Output', Icons.speaker, Colors.green, () {
            }).animate().fadeIn(delay: 600.ms).slideX(begin: 0.1),

            gapH24,
            Text('Sensors & Hardware', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)).animate().fadeIn(delay: 700.ms),
            gapH12,
            _buildTestItem(context, 'Flashlight Toggle', Icons.flashlight_on, Colors.yellow.shade700, () {
               const MethodChannel('com.example.deviceinsight/native').invokeMethod('setFlashlight', {'enable': true});
               Future.delayed(const Duration(seconds: 2), () {
                 const MethodChannel('com.example.deviceinsight/native').invokeMethod('setFlashlight', {'enable': false});
               });
            }).animate().fadeIn(delay: 800.ms).slideX(begin: 0.1),
            
          ],
        ),
      ),
    );
  }

  Widget _buildTestItem(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.p12),
      child: GlassCard(
        onTap: onTap,
        padding: const EdgeInsets.all(AppSizes.p16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: Icon(icon, color: color),
            ),
            gapW16,
            Expanded(
              child: Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            ),
            Icon(Icons.chevron_right, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
          ],
        ),
      ),
    );
  }
}
