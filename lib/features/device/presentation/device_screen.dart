import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/device_provider.dart';

class DeviceScreen extends ConsumerWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceAsync = ref.watch(deviceProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Properties'),
        backgroundColor: Colors.transparent,
      ),
      body: deviceAsync.when(
        data: (device) {
          final props = [
            {'title': 'Device Name', 'value': device.device, 'icon': Icons.smartphone},
            {'title': 'Board', 'value': device.board, 'icon': Icons.developer_board},
            {'title': 'Hardware', 'value': device.hardware, 'icon': Icons.memory},
            {'title': 'Bootloader', 'value': device.bootloader, 'icon': Icons.build},
            {'title': 'Host', 'value': device.host, 'icon': Icons.computer},
            {'title': 'Tags', 'value': device.tags, 'icon': Icons.label},
          ];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const EducationalCard(
                  title: 'Device Fingerprint',
                  icon: Icons.fingerprint,
                  content: 'Your Android device has a unique fingerprint string built during compilation. It proves the build is authentic to Google Play Services.',
                  optimizationTips: [],
                ).animate().fadeIn(delay: 200.ms),
                gapH24,
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fingerprint', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      gapH8,
                      Text(device.fingerprint, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.primaryLight, height: 1.5)),
                    ],
                  ),
                ).animate().slideY(begin: 0.1),
                gapH24,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: props.length,
                  itemBuilder: (context, index) {
                    final item = props[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.p12),
                      child: GlassCard(
                        padding: const EdgeInsets.all(AppSizes.p16),
                        child: Row(
                          children: [
                            Icon(item['icon'] as IconData, color: theme.colorScheme.primary),
                            gapW16,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['title'] as String, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                                  Text(item['value'] as String, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
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
