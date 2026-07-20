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
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';


class StorageScreen extends ConsumerWidget {
  const StorageScreen({super.key});

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    }
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    if (bytes >= 1024) {
      return '${(bytes / 1024).toStringAsFixed(0)} KB';
    }
    return '$bytes B';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageAsync = ref.watch(storageStreamProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Storage Analyzer'),
      ),
      body: storageAsync.when(
        data: (storage) {
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
                _buildStorageHealth(storage, theme),
                gapH32,
                _buildStorageChart(storage, theme),
                gapH32,
                _buildOverviewCards(storage, theme),
                gapH32,
                _buildFileTypeBreakdown(storage, theme),
                gapH32,
                const EducationalCard(
                  title: 'Storage & Performance',
                  icon: Icons.sd_storage,
                  content:
                      'Your device uses internal flash memory (like UFS or eMMC) to store apps and data. When storage is nearly full, the system struggles to write temporary files and cache, causing severe lag and degraded performance.',
                  optimizationTips: [
                    'Maintain at least 15% free space for optimal performance.',
                    'Clear app caches regularly from Settings.',
                    'Delete large unused videos or back up photos to the cloud.',
                    'Uninstall unused applications.',
                  ],
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  // ─── Health Banner ────────────────────────────────────────────────────────
  Widget _buildStorageHealth(StorageStats storage, ThemeData theme) {
    final pct = storage.usagePercentage;
    final isCritical = pct > 90;
    final isFair = pct > 75;
    final color = isCritical
        ? AppColors.error
        : isFair
            ? AppColors.warning
            : AppColors.healthExcellent;
    final label = isCritical
        ? 'Critical — Free up space now!'
        : isFair
            ? 'Fair — Consider cleaning up'
            : 'Excellent — Plenty of space';
    final sub = isCritical
        ? 'Device may lag severely. Delete large files immediately.'
        : isFair
            ? 'Performance may degrade soon. Clear caches & remove unused apps.'
            : 'Your storage is healthy and performing optimally.';

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 16,
                )
              ]
            ),
            child: Icon(
              isCritical ? Icons.error_rounded : (isFair ? Icons.warning_amber_rounded : Icons.check_circle_rounded),
              color: color,
              size: 36,
            ).animate(onPlay: (c) => isCritical ? c.repeat(reverse: true) : null)
             .scale(begin: const Offset(1,1), end: const Offset(1.1, 1.1), duration: 1.seconds),
          ),
          gapW20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w900, color: color, letterSpacing: -0.5)),
                gapH4,
                Text(sub,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.7))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Donut Chart ─────────────────────────────────────────────────────────
  Widget _buildStorageChart(StorageStats storage, ThemeData theme) {
    final categories = _buildCategories(storage, theme);
    final hasData = storage.usedSpace > 0;

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Column(
        children: [
          Text('Storage Overview',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w900)),
          gapH24,
          SizedBox(
            height: 240,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 4,
                    centerSpaceRadius: 80, // slightly larger
                    startDegreeOffset: -90,
                    sections: hasData
                        ? [
                            ...categories.map(
                              (c) => PieChartSectionData(
                                value: c.bytes.toDouble(),
                                color: c.color,
                                title: '',
                                radius: 30,
                              ),
                            ),
                            PieChartSectionData(
                              value: storage.freeSpace.toDouble(),
                              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                              title: '',
                              radius: 20,
                            ),
                          ]
                        : [
                            PieChartSectionData(
                              value: 1,
                              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                              title: '',
                              radius: 20,
                            ),
                          ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: storage.usagePercentage),
                      duration: const Duration(milliseconds: 1400),
                      curve: Curves.easeOutCirc,
                      builder: (context, val, _) => Text(
                        '${val.toStringAsFixed(1)}%',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    Text(
                      'of ${_formatBytes(storage.totalSpace)}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          gapH24,
          // Legend
          Wrap(
            spacing: 16,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              ...categories.map(
                (c) => _buildLegendChip(theme, c.label, c.color),
              ),
              _buildLegendChip(
                  theme, 'Free Space', theme.colorScheme.surfaceContainerHighest),
            ],
          ).animate().fadeIn(delay: 400.ms),
        ],
      ),
    );
  }

  Widget _buildLegendChip(ThemeData theme, String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        gapW8,
        Text(label, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }

  // ─── Overview Cards (Total / Used / Free) ─────────────────────────────────
  Widget _buildOverviewCards(StorageStats storage, ThemeData theme) {
    final cards = [
      _CardInfo('Total', _formatBytes(storage.totalSpace), Icons.storage_outlined, theme.colorScheme.primary),
      _CardInfo('Used', _formatBytes(storage.usedSpace), Icons.folder_open_outlined, Colors.orangeAccent),
      _CardInfo('Free', _formatBytes(storage.freeSpace), Icons.check_circle_outline, AppColors.healthExcellent),
    ];

    return Row(
      children: cards.asMap().entries.map((e) {
        final idx = e.key;
        final c = e.value;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: idx == 0 ? 0 : 8, right: idx == 2 ? 0 : 8),
            child: GlassCard(
              animateOnEntry: true,
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.p12, vertical: AppSizes.p16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: c.color.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(c.icon, color: c.color, size: 24),
                  ),
                  gapH12,
                  Text(c.label,
                      style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  gapH4,
                  Text(c.value,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center),
                ],
              ),
            ).animate().fadeIn(delay: (300 + idx * 80).ms).slideY(begin: 0.1),
          ),
        );
      }).toList(),
    );
  }

  // ─── File Type Breakdown List ─────────────────────────────────────────────
  Widget _buildFileTypeBreakdown(StorageStats storage, ThemeData theme) {
    final categories = _buildCategories(storage, theme);
    if (categories.isEmpty || storage.usedSpace == 0) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'File Type Breakdown',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
        ).animate().fadeIn(delay: 400.ms),
        gapH16,
        ...categories.asMap().entries.map((e) {
          final idx = e.key;
          final cat = e.value;
          final fraction = storage.usedSpace > 0
              ? (cat.bytes / storage.usedSpace).clamp(0.0, 1.0)
              : 0.0;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.p16),
            child: _buildCategoryRow(theme, cat, fraction)
                .animate()
                .fadeIn(delay: (450 + idx * 60).ms)
                .slideX(begin: 0.1),
          );
        }),
      ],
    );
  }

  Widget _buildCategoryRow(ThemeData theme, _CategoryInfo cat, double fraction) {
    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cat.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(cat.icon, color: cat.color, size: 26),
              ),
              gapW20,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cat.label,
                            style: theme.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w800)),
                        Text(
                          _formatBytes(cat.bytes),
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: cat.color,
                          ),
                        ),
                      ],
                    ),
                    gapH8,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: fraction),
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeOutCubic,
                        builder: (context, val, _) => LinearProgressIndicator(
                          value: val,
                          minHeight: 8,
                          color: cat.color,
                          backgroundColor:
                              cat.color.withValues(alpha: 0.15),
                        ),
                      ),
                    ),
                    gapH8,
                    Text(
                      '${(fraction * 100).toStringAsFixed(1)}% of used space',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Data helpers ─────────────────────────────────────────────────────────
  List<_CategoryInfo> _buildCategories(StorageStats storage, ThemeData theme) {
    if (storage.usedSpace == 0) return [];

    return [
      _CategoryInfo(
          label: 'Images',
          icon: Icons.image_outlined,
          color: const Color(0xFFE91E8C),
          bytes: storage.imagesBytes),
      _CategoryInfo(
          label: 'Videos',
          icon: Icons.videocam_outlined,
          color: Colors.deepPurpleAccent,
          bytes: storage.videosBytes),
      _CategoryInfo(
          label: 'Audio',
          icon: Icons.music_note_outlined,
          color: Colors.orangeAccent,
          bytes: storage.audioBytes),
      _CategoryInfo(
          label: 'Apps',
          icon: Icons.apps_outlined,
          color: Colors.lightBlueAccent,
          bytes: storage.appsBytes),
      _CategoryInfo(
          label: 'Documents',
          icon: Icons.description_outlined,
          color: Colors.tealAccent,
          bytes: storage.documentsBytes),
      _CategoryInfo(
          label: 'Other',
          icon: Icons.folder_special_outlined,
          color: Colors.blueGrey,
          bytes: storage.otherBytes),
    ].where((c) => c.bytes > 0).toList();
  }
}

class _CategoryInfo {
  final String label;
  final IconData icon;
  final Color color;
  final int bytes;

  const _CategoryInfo({
    required this.label,
    required this.icon,
    required this.color,
    required this.bytes,
  });
}

class _CardInfo {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _CardInfo(this.label, this.value, this.icon, this.color);
}
