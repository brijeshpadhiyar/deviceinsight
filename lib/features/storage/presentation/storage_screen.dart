import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import '../domain/models/storage_stats.dart';
import 'providers/storage_provider.dart';

class StorageScreen extends ConsumerWidget {
  const StorageScreen({super.key});

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${bytes.toString()} B';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageAsync = ref.watch(storageStreamProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Analyzer'),
        backgroundColor: Colors.transparent,
      ),
      body: storageAsync.when(
        data: (storage) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildStorageHealth(storage, theme),
                gapH24,
                _buildStorageChart(storage, theme),
                gapH24,
                _buildBreakdownGrid(storage, theme),
                gapH24,
                const EducationalCard(
                  title: 'Storage & Performance',
                  icon: Icons.sd_storage,
                  content: 'Your device uses internal flash memory (like UFS or eMMC) to store apps and data. When storage is nearly full, the system struggles to write temporary files and cache, causing severe lag and degraded performance.',
                  optimizationTips: [
                    'Maintain at least 15% free space for optimal performance.',
                    'Clear app caches regularly from settings.',
                    'Delete large unused videos or backup photos to the cloud.',
                    'Uninstall unused applications.'
                  ],
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildStorageHealth(StorageStats storage, ThemeData theme) {
    final healthScore = storage.usagePercentage > 90 ? 40 : storage.usagePercentage > 75 ? 75 : 100;
    final color = healthScore == 100 ? AppColors.healthExcellent : healthScore == 75 ? AppColors.healthFair : AppColors.error;

    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(healthScore == 100 ? Icons.check_circle : Icons.warning_amber_rounded, color: color, size: 32),
          ),
          gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  healthScore == 100 ? 'Storage Health: Excellent' : healthScore == 75 ? 'Storage Health: Fair' : 'Storage Health: Critical',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: color),
                ),
                gapH4,
                Text(
                  healthScore == 100 ? 'You have plenty of free space.' : 'Consider freeing up space to improve performance.',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1);
  }

  Widget _buildStorageChart(StorageStats storage, ThemeData theme) {
    // Generate mock breakdown values for demonstration since native API doesn't provide them yet
    final appsSpace = storage.usedSpace * 0.4;
    final mediaSpace = storage.usedSpace * 0.35;
    final systemSpace = storage.usedSpace * 0.15;
    final otherSpace = storage.usedSpace * 0.1;

    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p24),
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 65,
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(value: appsSpace, color: Colors.orange, title: '', radius: 25),
                      PieChartSectionData(value: mediaSpace, color: Colors.blue, title: '', radius: 25),
                      PieChartSectionData(value: systemSpace, color: Colors.grey, title: '', radius: 25),
                      PieChartSectionData(value: otherSpace, color: Colors.green, title: '', radius: 25),
                      PieChartSectionData(value: storage.freeSpace.toDouble(), color: theme.colorScheme.surfaceContainerHighest, title: '', radius: 20),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${storage.usagePercentage.toStringAsFixed(1)}%',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Used of ${_formatBytes(storage.totalSpace)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack),
          gapH24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLegend(theme, 'Apps', Colors.orange),
              _buildLegend(theme, 'Media', Colors.blue),
              _buildLegend(theme, 'System', Colors.grey),
              _buildLegend(theme, 'Other', Colors.green),
            ],
          ).animate().fadeIn(delay: 300.ms),
        ],
      ),
    );
  }

  Widget _buildLegend(ThemeData theme, String title, Color color) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        gapW8,
        Text(title, style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildBreakdownGrid(StorageStats storage, ThemeData theme) {
    final details = [
      {'title': 'Total Space', 'value': _formatBytes(storage.totalSpace), 'icon': Icons.storage, 'color': theme.colorScheme.primary},
      {'title': 'Used Space', 'value': _formatBytes(storage.usedSpace), 'icon': Icons.folder, 'color': Colors.orange},
      {'title': 'Free Space', 'value': _formatBytes(storage.freeSpace), 'icon': Icons.check_circle_outline, 'color': AppColors.healthExcellent},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppSizes.p12,
        mainAxisSpacing: AppSizes.p12,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final item = details[index];
        return GlassCard(
          padding: const EdgeInsets.all(AppSizes.p8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item['icon'] as IconData, color: item['color'] as Color, size: 24),
              gapH8,
              Text(
                item['title'] as String,
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontSize: 10),
                textAlign: TextAlign.center,
              ),
              gapH4,
              Text(
                item['value'] as String,
                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ).animate().fadeIn(delay: (400 + index * 100).ms).slideY(begin: 0.1);
      },
    );
  }
}
