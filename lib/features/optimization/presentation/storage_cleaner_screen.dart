import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import '../../storage/presentation/providers/storage_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class StorageCleanerScreen extends ConsumerWidget {
  const StorageCleanerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageAsync = ref.watch(storageStreamProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Storage Optimizer'),
      ),
      body: storageAsync.when(
        data: (state) {
          final usedGb = state.usedSpace / (1024 * 1024 * 1024);
          final freeGb = state.freeSpace / (1024 * 1024 * 1024);
          final usedPercent = state.usagePercentage;
          final isCritical = usedPercent > 90;
          final progressColor = isCritical ? AppColors.error : AppColors.primaryLight;

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
                  child: Column(
                    children: [
                      Text('Internal Storage', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                      gapH24,
                      Stack(
                        children: [
                          Container(
                            height: 24,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: (usedPercent / 100).clamp(0.0, 1.0),
                            child: Container(
                              height: 24,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    progressColor.withValues(alpha: 0.8),
                                    progressColor,
                                  ]
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: progressColor.withValues(alpha: 0.4),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  )
                                ]
                              ),
                            ),
                          ).animate().scaleX(alignment: Alignment.centerLeft, duration: 600.ms, curve: Curves.easeOutCirc),
                        ],
                      ),
                      gapH24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Used', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w600)),
                              gapH4,
                              Text('${usedGb.toStringAsFixed(1)} GB', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Free', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w600)),
                              gapH4,
                              Text('${freeGb.toStringAsFixed(1)} GB', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900, color: AppColors.success)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                gapH32,
                const EducationalCard(
                  title: 'Android Cache Policy',
                  icon: Icons.info_outline,
                  content: 'Android restricts third-party apps from clearing other apps\' caches silently to protect user privacy and system stability. You can free up space manually by reviewing large applications.',
                  optimizationTips: [],
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                gapH32,
                Text('Optimization Tasks', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 300.ms),
                gapH16,
                _buildActionItem(context, 'Review Large Apps', 'Find and clear app caches', Icons.apps_outlined, () {
                  // Navigate to App Manager
                }, 400),
                _buildActionItem(context, 'Clear Downloads', 'Manage downloaded files', Icons.download_outlined, () {
                  // Prompt open settings
                }, 500),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, String title, String subtitle, IconData icon, VoidCallback onTap, int delay) {
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
              decoration: BoxDecoration(color: theme.colorScheme.primary.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: Icon(icon, color: theme.colorScheme.primary, size: 24),
            ),
            gapW20,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                  gapH4,
                  Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
          ],
        ),
      ).animate().fadeIn(delay: delay.ms).slideX(begin: 0.1),
    );
  }
}
