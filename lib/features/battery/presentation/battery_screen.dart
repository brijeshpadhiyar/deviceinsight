import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/live_gauge.dart';
import '../../shared/widgets/educational_card.dart';
import '../domain/models/battery_info.dart';
import 'providers/battery_provider.dart';

class BatteryScreen extends ConsumerWidget {
  const BatteryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batteryAsync = ref.watch(batteryStreamProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Health'),
        backgroundColor: Colors.transparent,
      ),
      body: batteryAsync.when(
        data: (battery) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHealthStatus(battery, theme),
                gapH24,
                _buildMainGauge(battery, theme),
                gapH24,
                _buildDetailsGrid(battery, theme),
                gapH24,
                const EducationalCard(
                  title: 'Battery Lifespan & Wear',
                  icon: Icons.battery_charging_full,
                  content: 'Lithium-ion batteries degrade over time due to charging cycles and high temperatures. "Battery Wear" represents the loss in total capacity. High voltage or temperatures above 40°C significantly accelerate this degradation.',
                  optimizationTips: [
                    'Avoid deep discharges (keep it above 20%).',
                    'Unplug when fully charged to avoid trickle stress.',
                    'Keep the device cool, especially while gaming or fast-charging.',
                    'Use original or certified chargers to ensure safe voltage levels.'
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

  Widget _buildHealthStatus(BatteryInfo battery, ThemeData theme) {
    final bool isHot = battery.temperature > 39.0;
    final bool isGood = battery.health.toLowerCase() == 'good' && !isHot;
    
    final color = isHot ? AppColors.error : (isGood ? AppColors.healthExcellent : AppColors.healthFair);
    final icon = isHot ? Icons.local_fire_department : (isGood ? Icons.verified : Icons.warning_amber);
    final title = isHot ? 'Overheating Warning' : (isGood ? 'Battery is Healthy' : 'Degraded Health');

    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, color: color, size: 32),
          ),
          gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: color),
                ),
                gapH4,
                Text(
                  isHot ? 'Your device is too hot! Cool it down.' : 'Operating in safe conditions.',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1);
  }

  Widget _buildMainGauge(BatteryInfo battery, ThemeData theme) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Center(
        child: LiveGauge(
          title: '${battery.percentage.toStringAsFixed(0)}%',
          subtitle: battery.isCharging ? 'Charging (${battery.status})' : battery.status,
          value: battery.percentage / 100,
          color: battery.isCharging ? AppColors.success : (battery.percentage <= 20 ? AppColors.error : theme.colorScheme.primary),
          icon: battery.isCharging ? Icons.bolt : Icons.battery_std,
        ),
      ),
    ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack);
  }

  Widget _buildDetailsGrid(BatteryInfo battery, ThemeData theme) {
    final details = [
      {'title': 'Health', 'value': battery.health, 'icon': Icons.favorite, 'color': AppColors.healthExcellent},
      {'title': 'Temperature', 'value': '${battery.temperature.toStringAsFixed(1)}°C', 'icon': Icons.thermostat, 'color': battery.temperature > 39 ? AppColors.error : Colors.orange},
      {'title': 'Voltage', 'value': '${battery.voltage.toInt()} mV', 'icon': Icons.electric_bolt, 'color': Colors.blue},
      {'title': 'Technology', 'value': battery.technology, 'icon': Icons.memory, 'color': Colors.purple},
      {'title': 'Capacity', 'value': battery.capacity > 0 ? '${battery.capacity} mAh' : 'Unknown', 'icon': Icons.battery_full, 'color': Colors.teal},
      {'title': 'Cycles', 'value': battery.cycleCount > 0 ? '${battery.cycleCount}' : 'N/A', 'icon': Icons.loop, 'color': Colors.cyan},
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
        ).animate().fadeIn(delay: (300 + index * 50).ms).slideY(begin: 0.1);
      },
    );
  }
}
