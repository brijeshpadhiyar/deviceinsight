import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/live_gauge.dart';
import '../../shared/widgets/educational_card.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';
import '../domain/models/battery_info.dart';
import 'providers/battery_provider.dart';

class BatteryScreen extends ConsumerWidget {
  const BatteryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batteryAsync = ref.watch(batteryStreamProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Battery Health'),
      ),
      body: batteryAsync.when(
        data: (battery) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 100, // accommodate app bar
              left: AppSizes.p20, 
              right: AppSizes.p20,
              bottom: 120, // accommodate floating nav bar
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHealthStatus(battery, theme),
                gapH32,
                _buildMainGauge(battery, theme),
                gapH32,
                Text(
                  'Battery Details',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                ).animate().fadeIn(delay: 200.ms),
                gapH16,
                _buildDetailsGrid(battery, theme),
                gapH32,
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
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
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
    final icon = isHot ? Icons.whatshot : (isGood ? Icons.verified : Icons.warning_amber);
    final title = isHot ? 'Overheating Warning' : (isGood ? 'Battery is Healthy' : 'Degraded Health');

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
            child: Icon(icon, color: color, size: 36)
                .animate(onPlay: (c) => isHot ? c.repeat(reverse: true) : null)
                .scale(begin: const Offset(1,1), end: const Offset(1.1,1.1), duration: 1.seconds),
          ),
          gapW20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900, color: color, letterSpacing: -0.5),
                ),
                gapH4,
                Text(
                  isHot ? 'Your device is too hot! Cool it down.' : 'Operating in safe conditions.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainGauge(BatteryInfo battery, ThemeData theme) {
    final bool isLow = battery.percentage <= 20;
    final color = battery.isCharging ? AppColors.success : (isLow ? AppColors.error : AppColors.primaryDark);

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Center(
        child: LiveGauge(
          title: '${battery.percentage.toStringAsFixed(0)}%',
          subtitle: battery.isCharging ? 'Charging (${battery.status})' : battery.status,
          value: battery.percentage / 100,
          color: color,
          icon: battery.isCharging ? Icons.bolt : (isLow ? Icons.battery_alert : Icons.battery_std),
        ),
      ),
    );
  }

  Widget _buildDetailsGrid(BatteryInfo battery, ThemeData theme) {
    final String speedStr = battery.isCharging 
        ? (battery.currentNow > 0 ? '${(battery.currentNow / 1000).toStringAsFixed(0)} mA' : 'Fast')
        : (battery.currentNow < 0 ? '${(battery.currentNow / 1000).toStringAsFixed(0)} mA' : 'Idle');

    final details = [
      {'title': 'Health Status', 'value': battery.health, 'icon': Icons.favorite_outline, 'color': AppColors.healthExcellent},
      {'title': 'Temperature', 'value': '${battery.temperature.toStringAsFixed(1)}°C', 'icon': Icons.thermostat, 'color': battery.temperature > 39 ? AppColors.error : Colors.orangeAccent},
      {'title': 'Voltage', 'value': '${battery.voltage.toInt()} mV', 'icon': Icons.electric_bolt, 'color': Colors.lightBlueAccent},
      {'title': 'Max Capacity', 'value': battery.capacity > 0 ? '${battery.capacity} mAh' : 'Unknown', 'icon': Icons.battery_full_outlined, 'color': Colors.tealAccent},
      {'title': 'Drain Speed', 'value': speedStr, 'icon': Icons.speed, 'color': Colors.purpleAccent},
      {'title': 'Charge Cycles', 'value': battery.cycleCount > 0 ? '${battery.cycleCount}' : 'N/A', 'icon': Icons.loop, 'color': Colors.cyanAccent},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Changed from 3 to 2 for a much more premium and readable layout
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
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (300 + index * 50).ms).slideY(begin: 0.1);
      },
    );
  }
}

