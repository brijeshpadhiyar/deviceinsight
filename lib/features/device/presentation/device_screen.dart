import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/device_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(deviceProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Device Properties'),
      ),
      body: deviceAsync.when(
        data: (device) {
          final props = [
            {'title': 'Device Name', 'value': device.device, 'icon': Icons.smartphone_outlined, 'color': Colors.blueAccent},
            {'title': 'Board', 'value': device.board, 'icon': Icons.developer_board_outlined, 'color': Colors.tealAccent},
            {'title': 'Hardware', 'value': device.hardware, 'icon': Icons.memory_outlined, 'color': AppColors.primaryDark},
            {'title': 'Bootloader', 'value': device.bootloader, 'icon': Icons.build_outlined, 'color': Colors.orangeAccent},
            {'title': 'Host', 'value': device.host, 'icon': Icons.computer_outlined, 'color': Colors.cyanAccent},
            {'title': 'Tags', 'value': device.tags, 'icon': Icons.label_outline, 'color': Colors.pinkAccent},
          ];

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
                const EducationalCard(
                  title: 'Device Fingerprint',
                  icon: Icons.fingerprint,
                  content: 'Your Android device has a unique fingerprint string built during compilation. It proves the build is authentic to Google Play Services.',
                  optimizationTips: [],
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                gapH32,
                GlassCard(
                  animateOnEntry: true,
                  padding: const EdgeInsets.all(AppSizes.p24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.verified_user_outlined, color: AppColors.primaryDark),
                          gapW12,
                          Text('Fingerprint', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                        ],
                      ),
                      gapH16,
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
                        ),
                        child: Text(
                          device.fingerprint, 
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.9), 
                            height: 1.5,
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().slideY(begin: 0.1),
                gapH32,
                Text('Hardware Details', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 300.ms),
                gapH16,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: props.length,
                  itemBuilder: (context, index) {
                    final item = props[index];
                    final color = item['color'] as Color;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.p16),
                      child: GlassCard(
                        animateOnEntry: true,
                        padding: const EdgeInsets.all(AppSizes.p20),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: color.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(item['icon'] as IconData, color: color, size: 24),
                            ),
                            gapW20,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['title'] as String, style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w600)),
                                  gapH4,
                                  Text(item['value'] as String, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: (400 + index * 100).ms).slideX(begin: 0.1),
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
}
