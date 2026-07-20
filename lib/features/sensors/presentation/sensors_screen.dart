import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/sensors_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class SensorsScreen extends ConsumerWidget {
  const SensorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorsAsync = ref.watch(sensorsProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Sensors'),
      ),
      body: sensorsAsync.when(
        data: (sensors) {
          return SingleChildScrollView(
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
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryDark.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.secondaryDark.withValues(alpha: 0.3),
                              blurRadius: 20,
                            )
                          ]
                        ),
                        child: const Icon(Icons.sensors, size: 48, color: AppColors.secondaryDark)
                          .animate(onPlay: (c) => c.repeat(reverse: true))
                          .scale(begin: const Offset(1,1), end: const Offset(1.1,1.1), duration: 1.seconds),
                      ),
                      gapW24,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${sensors.length}', style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900, color: AppColors.secondaryDark)),
                          Text('Sensors Detected', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ],
                  ),
                ),
                gapH32,
                const EducationalCard(
                  title: 'Sensors & Privacy',
                  icon: Icons.privacy_tip_outlined,
                  content: 'Modern devices pack dozens of physical and virtual sensors (accelerometer, gyroscope, light, proximity). Virtual sensors combine data from multiple hardware sensors using algorithms.',
                  optimizationTips: [
                    'The gyroscope allows you to look around in 360 videos.',
                    'The proximity sensor turns off your screen when you hold the phone to your ear.',
                    'Some apps abuse sensors to track your physical activity without GPS permission.',
                  ],
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                gapH32,
                Text('All Sensors', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 300.ms),
                gapH16,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sensors.length,
                  itemBuilder: (context, index) {
                    final sensor = sensors[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.p16),
                      child: GlassCard(
                        animateOnEntry: true,
                        padding: const EdgeInsets.all(AppSizes.p20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary.withValues(alpha: 0.15),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.sensors_outlined, size: 20, color: theme.colorScheme.primary),
                                ),
                                gapW12,
                                Expanded(
                                  child: Text(
                                    sensor.name,
                                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                            gapH12,
                            Text(
                              'Vendor: ${sensor.vendor}',
                              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
                            ),
                            gapH16,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildChip(theme, 'Version: ${sensor.version}', Icons.memory_outlined),
                                _buildChip(theme, 'Power: ${sensor.power} mA', Icons.battery_charging_full_outlined),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: theme.colorScheme.primary),
          gapW6,
          Text(text, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
