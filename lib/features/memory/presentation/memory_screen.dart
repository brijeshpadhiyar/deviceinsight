import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/educational_card.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/glass_scaffold.dart';
import 'providers/memory_provider.dart';

class MemoryScreen extends ConsumerWidget {
  const MemoryScreen({super.key});

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024 * 1024)
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    if (bytes >= 1024 * 1024)
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    return '${bytes.toString()} B';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoryAsync = ref.watch(memoryProvider);
    final history = ref.read(memoryProvider.notifier).history;
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(title: Text('Memory Analyzer')),
      body: memoryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (memory) {
          final usagePercent = memory.totalMemory > 0
              ? (memory.usedMemory / memory.totalMemory) * 100
              : 0.0;

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
                _buildMainChart(usagePercent, theme),
                gapH32,
                if (memory.isLowMemory) ...[_buildWarning(theme), gapH32],
                Text(
                  'Pressure Trend',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                ).animate().fadeIn(delay: 100.ms),
                gapH16,
                _buildHistoryChart(history, theme),
                gapH32,
                Text(
                  'Memory Allocation',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                ).animate().fadeIn(delay: 200.ms),
                gapH16,
                _buildDetailsGrid(memory, theme),
                gapH32,
                const EducationalCard(
                  title: 'What is RAM?',
                  icon: Icons.memory,
                  content:
                      'Random Access Memory (RAM) is your device\'s short-term memory. It temporarily stores data for the operating system and active apps to allow quick access.',
                  optimizationTips: [
                    'Close apps you are no longer using.',
                    'Restart your device regularly to clear fragmented memory.',
                    'Uninstall unused heavy apps that run in the background.',
                  ],
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainChart(double usagePercent, ThemeData theme) {
    final color = AppColors.primaryDark; // Amethyst purple

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Column(
        children: [
          SizedBox(
            height: 240,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 4,
                    centerSpaceRadius: 80,
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(
                        value: usagePercent,
                        color: color,
                        title: '',
                        radius: 30,
                      ),
                      PieChartSectionData(
                        value: 100 - usagePercent,
                        color: color.withValues(alpha: 0.15),
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
                      tween: Tween<double>(begin: 0, end: usagePercent),
                      duration: const Duration(milliseconds: 1400),
                      curve: Curves.easeOutCirc,
                      builder: (context, val, _) {
                        return Text(
                          '${val.toStringAsFixed(1)}%',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: color,
                          ),
                        );
                      }
                    ),
                    Text(
                      'RAM Used',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
        ],
      ),
    );
  }

  Widget _buildHistoryChart(List<double> history, ThemeData theme) {
    List<FlSpot> spots = [];
    if (history.isEmpty) {
      spots = [const FlSpot(0, 0)];
    } else {
      for (int i = 0; i < history.length; i++) {
        spots.add(FlSpot(i.toDouble(), history[i]));
      }
    }
    
    final color = AppColors.primaryDark;

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.show_chart, color: color, size: 24),
              gapW12,
              Text(
                'Memory Pressure Trend',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          gapH24,
          SizedBox(
            height: 180,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 30,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: color,
                    barWidth: 4,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          color.withValues(alpha: 0.4),
                          color.withValues(alpha: 0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsGrid(dynamic memory, ThemeData theme) {
    final details = [
      {
        'title': 'Total RAM',
        'value': _formatBytes(memory.totalMemory),
        'icon': Icons.storage_outlined,
        'color': Colors.blueAccent,
      },
      {
        'title': 'Used RAM',
        'value': _formatBytes(memory.usedMemory),
        'icon': Icons.memory_outlined,
        'color': AppColors.primaryDark,
      },
      {
        'title': 'Available',
        'value': _formatBytes(memory.availableMemory),
        'icon': Icons.check_circle_outline,
        'color': AppColors.healthExcellent,
      },
      {
        'title': 'Threshold',
        'value': _formatBytes(memory.memoryThreshold),
        'icon': Icons.warning_amber,
        'color': Colors.orangeAccent,
      },
      {
        'title': 'App Memory',
        'value': '${memory.memoryClass} MB',
        'icon': Icons.apps,
        'color': Colors.tealAccent,
      },
      {
        'title': 'Large Memory',
        'value': '${memory.largeMemoryClass} MB',
        'icon': Icons.apps_outage,
        'color': Colors.pinkAccent,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.p16,
        mainAxisSpacing: AppSizes.p16,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final item = details[index];
        final color = item['color'] as Color;
        return GlassCard(
          animateOnEntry: true,
          padding: const EdgeInsets.all(AppSizes.p16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      color: color,
                      size: 20,
                    ),
                  ),
                  gapW12,
                  Expanded(
                    child: Text(
                      item['title'] as String,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                item['value'] as String,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ).animate().fadeIn(delay: (300 + index * 50).ms).slideY(begin: 0.1);
      },
    );
  }

  Widget _buildWarning(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.p20),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.error.withValues(alpha: 0.2),
            blurRadius: 16,
          )
        ]
      ),
      child: Row(
        children: [
          const Icon(Icons.warning, color: AppColors.error, size: 32)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(begin: const Offset(1,1), end: const Offset(1.1,1.1), duration: 500.ms),
          gapW16,
          Expanded(
            child: Text(
              'Your device is experiencing low memory! Performance may be severely degraded.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    ).animate().shake(delay: 800.ms).fadeIn();
  }
}
