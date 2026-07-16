import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/sensors_provider.dart';

class SensorsScreen extends ConsumerWidget {
  const SensorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorsAsync = ref.watch(sensorsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensors'),
        backgroundColor: Colors.transparent,
      ),
      body: sensorsAsync.when(
        data: (sensors) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p20),
                  child: Row(
                    children: [
                      const Icon(Icons.sensors, size: 48, color: AppColors.info),
                      gapW16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${sensors.length}', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                          Text('Sensors Detected', style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
                gapH24,
                const EducationalCard(
                  title: 'Sensors & Privacy',
                  icon: Icons.privacy_tip,
                  content: 'Modern devices pack dozens of physical and virtual sensors (accelerometer, gyroscope, light, proximity). Virtual sensors combine data from multiple hardware sensors using algorithms.',
                  optimizationTips: [
                    'The gyroscope allows you to look around in 360 videos.',
                    'The proximity sensor turns off your screen when you hold the phone to your ear.',
                    'Some apps abuse sensors to track your physical activity without GPS permission.',
                  ],
                ).animate().fadeIn(delay: 200.ms),
                gapH24,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sensors.length,
                  itemBuilder: (context, index) {
                    final sensor = sensors[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.p12),
                      child: GlassCard(
                        padding: const EdgeInsets.all(AppSizes.p16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sensor.name,
                              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            gapH4,
                            Text(
                              'Vendor: ${sensor.vendor}',
                              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
                            ),
                            gapH8,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildChip(theme, 'Version: ${sensor.version}', Icons.memory),
                                _buildChip(theme, 'Power: ${sensor.power} mA', Icons.battery_charging_full),
                              ],
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: (400 + index * 50).ms).slideX(begin: 0.1),
                    );
                  },
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildChip(ThemeData theme, String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 14, color: theme.colorScheme.primary),
        gapW4,
        Text(text, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
