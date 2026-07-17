import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/memory_provider.dart';

class MemoryScreen extends ConsumerWidget {
  const MemoryScreen({super.key});

  String _formatBytes(int bytes) {
    if (bytes >= 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    if (bytes >= 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    return '${bytes.toString()} B';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoryAsync = ref.watch(memoryProvider);
    final history = ref.read(memoryProvider.notifier).history;
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Memory Analyzer'), backgroundColor: Colors.transparent),
      body: memoryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (memory) {
          final usagePercent = memory.totalMemory > 0 
              ? (memory.usedMemory / memory.totalMemory) * 100 
              : 0.0;
              
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMainChart(usagePercent, theme),
                gapH24,
                _buildHistoryChart(history, theme),
                gapH24,
                _buildDetailsGrid(memory, theme),
                gapH24,
                if (memory.isLowMemory) ...[
                  _buildWarning(theme),
                  gapH24,
                ],
                const EducationalCard(
                  title: 'What is RAM?',
                  icon: Icons.memory,
                  content: 'Random Access Memory (RAM) is your device\'s short-term memory. It temporarily stores data for the operating system and active apps to allow quick access.',
                  optimizationTips: [
                    'Close apps you are no longer using.',
                    'Restart your device regularly to clear fragmented memory.',
                    'Uninstall unused heavy apps that run in the background.',
                  ],
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainChart(double usagePercent, ThemeData theme) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sectionsSpace: 4,
                    centerSpaceRadius: 70,
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(
                        value: usagePercent,
                        color: Colors.purple,
                        title: '',
                        radius: 25,
                      ),
                      PieChartSectionData(
                        value: 100 - usagePercent,
                        color: Colors.purple.withValues(alpha: 0.2),
                        title: '',
                        radius: 25,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${usagePercent.toStringAsFixed(1)}%',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      'RAM Used',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack),
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

    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.show_chart, color: Colors.purple, size: 20),
              gapW8,
              Text(
                'Memory Pressure Trend',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          gapH16,
          SizedBox(
            height: 150,
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
                    color: Colors.purple,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.purple.withValues(alpha: 0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildDetailsGrid(dynamic memory, ThemeData theme) {
    final details = [
      {'title': 'Total RAM', 'value': _formatBytes(memory.totalMemory), 'icon': Icons.storage},
      {'title': 'Used RAM', 'value': _formatBytes(memory.usedMemory), 'icon': Icons.memory},
      {'title': 'Available RAM', 'value': _formatBytes(memory.availableMemory), 'icon': Icons.check_circle_outline},
      {'title': 'Low Memory Threshold', 'value': _formatBytes(memory.memoryThreshold), 'icon': Icons.warning_amber},
      {'title': 'App Memory Class', 'value': '${memory.memoryClass} MB', 'icon': Icons.apps},
      {'title': 'Large Memory Class', 'value': '${memory.largeMemoryClass} MB', 'icon': Icons.apps_outage},
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
        return GlassCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item['icon'] as IconData, color: Colors.purple.withValues(alpha: 0.8)),
              gapH8,
              Text(
                item['title'] as String,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
                textAlign: TextAlign.center,
              ),
              gapH4,
              Text(
                item['value'] as String,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (300 + index * 50).ms).slideY(begin: 0.1);
      },
    );
  }

  Widget _buildWarning(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.p16),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning, color: AppColors.error),
          gapW12,
          Expanded(
            child: Text(
              'Your device is experiencing low memory! Performance may be severely degraded.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ).animate().shake(delay: 800.ms);
  }
}
