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
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';
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

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('CPU Performance'),
      ),
      body: cpuAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (cpu) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 100, 
            left: AppSizes.p20, 
            right: AppSizes.p20,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMainGauge(cpu, theme),
              gapH32,
              if (isThrottling) ...[
                _buildThrottlingWarning(theme),
                gapH32,
              ],
              Text(
                'Performance History',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
              ).animate().fadeIn(delay: 100.ms),
              gapH16,
              _buildCpuChart(cpu, history, theme),
              gapH32,
              Text(
                'Hardware Details',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
              ).animate().fadeIn(delay: 200.ms),
              gapH16,
              _buildDetailsGrid(cpu, theme),
              gapH32,
              const EducationalCard(
                title: 'CPU Architecture & Governors',
                icon: Icons.memory,
                content: 'Your Central Processing Unit (CPU) executes all device operations. Multi-core processors split tasks to improve efficiency. The "Governor" decides when to ramp up clock speed (for performance) or scale down (to save battery).',
                optimizationTips: [
                  'High CPU usage directly causes battery drain and thermal throttling.',
                  'Clear recent apps to stop runaway background processes.',
                  'If the device overheats, the CPU automatically slows down (throttling) to prevent damage.',
                ],
              ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainGauge(CpuInfo cpu, ThemeData theme) {
    final bool isHighLoad = cpu.overallUsage > 85.0;
    final color = isHighLoad ? AppColors.error : AppColors.secondaryDark; // Neon cyan

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Center(
        child: LiveGauge(
          title: '${cpu.overallUsage.toStringAsFixed(1)}%',
          subtitle: isHighLoad ? 'High Load' : 'Normal Load',
          value: cpu.overallUsage / 100,
          color: color,
          icon: Icons.memory_outlined,
        ),
      ),
    );
  }

  Widget _buildThrottlingWarning(ThemeData theme) {
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
          const Icon(Icons.whatshot, color: AppColors.error, size: 32)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(begin: const Offset(1,1), end: const Offset(1.1,1.1), duration: 500.ms),
          gapW16,
          Expanded(
            child: Text(
              'Thermal Throttling Active! CPU performance is heavily reduced to lower device temperature.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.error,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    ).animate().shake(delay: 500.ms).fadeIn();
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
    
    final color = theme.brightness == Brightness.dark ? AppColors.secondaryDark : AppColors.secondaryLight;

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_graph, color: color, size: 24),
              gapW12,
              Text(
                'Utilization Trend',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          gapH24,
          SizedBox(
            height: 180, // slightly taller
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
                      ),
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

  Widget _buildDetailsGrid(CpuInfo cpu, ThemeData theme) {
    final details = [
      {
        'title': 'Architecture',
        'value': cpu.architecture,
        'icon': Icons.architecture,
        'color': Colors.deepPurpleAccent,
      },
      {
        'title': 'Active Cores',
        'value': '${cpu.coreCount}',
        'icon': Icons.developer_board,
        'color': Colors.tealAccent,
      },
      {
        'title': 'Max Frequency',
        'value': 'Unknown',
        'icon': Icons.speed,
        'color': Colors.amberAccent,
      },
      {
        'title': 'Instruction Set',
        'value': '64-bit', // placeholder
        'icon': Icons.memory_outlined,
        'color': Colors.blueAccent,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Upgraded from 3 to 2
        crossAxisSpacing: AppSizes.p16,
        mainAxisSpacing: AppSizes.p16,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final item = details[index];
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
                      color: (item['color'] as Color).withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 20),
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
        ).animate().fadeIn(delay: (400 + index * 100).ms).slideY(begin: 0.1);
      },
    );
  }
}

