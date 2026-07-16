import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import '../../storage/presentation/providers/storage_provider.dart';

class StorageCleanerScreen extends ConsumerWidget {
  const StorageCleanerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageAsync = ref.watch(storageStreamProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Optimizer'),
        backgroundColor: Colors.transparent,
      ),
      body: storageAsync.when(
        data: (state) {
          final usedGb = state.usedSpace / (1024 * 1024 * 1024);
          final freeGb = state.freeSpace / (1024 * 1024 * 1024);
          final usedPercent = state.usagePercentage;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p24),
                  child: Column(
                    children: [
                      Text('Internal Storage', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      gapH16,
                      LinearProgressIndicator(
                        value: usedPercent / 100,
                        backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                        color: usedPercent > 90 ? AppColors.error : AppColors.info,
                        minHeight: 12,
                        borderRadius: BorderRadius.circular(6),
                      ).animate().scaleX(alignment: Alignment.centerLeft),
                      gapH16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Used', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                              Text('${usedGb.toStringAsFixed(1)} GB', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Free', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                              Text('${freeGb.toStringAsFixed(1)} GB', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.success)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ).animate().fadeIn(),
                gapH24,
                const EducationalCard(
                  title: 'Android Cache Policy',
                  icon: Icons.info_outline,
                  content: 'Android restricts third-party apps from clearing other apps\' caches silently to protect user privacy and system stability. You can free up space manually by reviewing large applications.',
                  optimizationTips: [],
                ).animate().fadeIn(delay: 100.ms),
                gapH24,
                Text('Optimization Tasks', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)).animate().fadeIn(delay: 200.ms),
                gapH12,
                _buildActionItem(context, 'Review Large Apps', 'Find and clear app caches', Icons.apps, () {
                  // Navigate to App Manager
                }).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1),
                _buildActionItem(context, 'Clear Downloads', 'Manage downloaded files', Icons.download, () {
                  // Prompt open settings
                }).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, String title, String subtitle, IconData icon, VoidCallback onTap) {
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
              decoration: BoxDecoration(color: theme.colorScheme.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: Icon(icon, color: theme.colorScheme.primary),
            ),
            gapW16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
          ],
        ),
      ),
    );
  }
}
