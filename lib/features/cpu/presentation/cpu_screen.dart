import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../dashboard/providers/dashboard_provider.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/live_gauge.dart';
import '../../shared/widgets/educational_card.dart';
import '../domain/models/cpu_info.dart';
import 'providers/cpu_provider.dart';

class CpuScreen extends ConsumerWidget {
  const CpuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cpuAsync = ref.watch(cpuProvider);
    final history = ref.read(cpuProvider.notifier).history;
    final dashboardState = ref.watch(dashboardProvider);
    final isThrottling = dashboardState.batteryTemperature > 40.0;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CPU Info'),
        backgroundColor: Colors.transparent,
      ),
      body: cpuAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (cpu) => SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMainGauge(cpu, theme),
              gapH24,
              if (isThrottling) ...[
                _buildThrottlingWarning(theme),
                gapH24,
              ],
              _buildCpuChart(cpu, history, theme),
              gapH24,
              _buildDetailsGrid(cpu, theme),
              gapH24,
              const EducationalCard(
                title: 'CPU Architecture & Governors',
                icon: Icons.memory,
                content: 'Your Central Processing Unit (CPU) executes all device operations. Multi-core processors split tasks to improve efficiency. The "Governor" decides when to ramp up clock speed (for performance) or scale down (to save battery).',
                optimizationTips: [
                  'High CPU usage directly causes battery drain and thermal throttling.',
                  'Clear recent apps to stop runaway background processes.',
                  'If the device overheats, the CPU automatically slows down (throttling) to prevent damage.',
                ],
              ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainGauge(CpuInfo cpu, ThemeData theme) {
    final bool isHighLoad = cpu.overallUsage > 85.0;

    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Center(
        child: LiveGauge(
          title: '${cpu.overallUsage.toStringAsFixed(1)}%',
          subtitle: isHighLoad ? 'High Load' : 'Normal Load',
          value: cpu.overallUsage / 100,
          color: isHighLoad ? AppColors.error : AppColors.info,
          icon: Icons.memory,
        ),
      ),
    ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack);
  }

  Widget _buildThrottlingWarning(ThemeData theme) {
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
              'Thermal Throttling Active! CPU performance is reduced to lower device temperature.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ).animate().shake(delay: 500.ms);
  }

  Widget _buildCpuChart(CpuInfo cpu, List<double> history, ThemeData theme) {
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
              const Icon(Icons.auto_graph, color: AppColors.info, size: 20),
              gapW8,
              Text(
                'Utilization Trend',
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
                    color: AppColors.info,
                    barWidth: 4,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.info.withValues(alpha: 0.2),
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

  Widget _buildDetailsGrid(CpuInfo cpu, ThemeData theme) {
    final details = [
      {
        'title': 'Architecture',
        'value': cpu.architecture,
        'icon': Icons.architecture,
        'color': Colors.deepPurple,
      },
      {
        'title': 'Cores',
        'value': '${cpu.coreCount}',
        'icon': Icons.developer_board,
        'color': Colors.teal,
      },
      {
        'title': 'Max Freq',
        'value': 'Unknown',
        'icon': Icons.speed,
        'color': Colors.amber,
      },
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
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
              gapH4,
              Text(
                item['value'] as String,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ).animate().fadeIn(delay: (400 + index * 100).ms).slideY(begin: 0.1);
      },
    );
  }
}
