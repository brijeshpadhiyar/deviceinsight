import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/live_gauge.dart';
import '../../shared/widgets/educational_card.dart';
import '../providers/dashboard_provider.dart';
import '../providers/dashboard_state.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context, state, theme),
                      gapH32,
                      _buildHealthScore(state, theme),
                      gapH32,
                      _buildLiveGauges(state, theme),
                      gapH32,
                      _buildDeviceCarePromos(theme, context),
                      gapH32,
                      Text(
                        'Device Modules',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ).animate().fadeIn(delay: 300.ms),
                      gapH16,
                      _buildGrid(theme),
                      gapH32,
                      const EducationalCard(
                        title: 'What is Device Health?',
                        icon: Icons.health_and_safety,
                        content: 'Your overall device health is a weighted score calculated in real-time based on your battery capacity, CPU temperature, RAM availability, and storage fragmentation.',
                        optimizationTips: [
                          'Keep your battery between 20% and 80%',
                          'Close heavy background apps to free RAM',
                          'Maintain at least 15% free storage space',
                        ],
                      ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, DashboardState state, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'DeviceInsight',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ).animate().fadeIn().slideX(begin: -0.1),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.healthExcellent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.healthExcellent.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.verified_user, color: AppColors.healthExcellent, size: 16),
                  gapW4,
                  Text(
                    'Protected',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.healthExcellent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 200.ms),
          ],
        ),
        gapH8,
        Text(
          state.deviceName,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ).animate().fadeIn(delay: 100.ms),
        Text(
          state.androidVersion,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ).animate().fadeIn(delay: 100.ms),
        gapH24,
        Text(
          'Deep Android Analyzer',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ).animate().fadeIn(delay: 200.ms),
        gapH16,
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: AppSizes.p16,
          mainAxisSpacing: AppSizes.p16,
          childAspectRatio: 1.2,
          children: [
            _buildNavCard(context, 'Security', Icons.security, AppColors.error, '/security'),
            _buildNavCard(context, 'Sensors', Icons.sensors, Colors.purple, '/sensors'),
            _buildNavCard(context, 'Camera', Icons.camera, AppColors.info, '/camera'),
            _buildNavCard(context, 'Apps', Icons.apps, Colors.green, '/apps'),
            _buildNavCard(context, 'Device', Icons.smartphone, Colors.orange, '/device'),
          ],
        ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),
      ],
    );
  }

  Widget _buildNavCard(BuildContext context, String title, IconData icon, Color color, String route) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
      child: GlassCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            gapH12,
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthScore(DashboardState state, ThemeData theme) {
    final score = state.overallHealthScore;
    final color = score >= 90 ? AppColors.healthExcellent 
                : score >= 70 ? AppColors.healthGood 
                : score >= 50 ? AppColors.healthFair : AppColors.healthPoor;
    
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall Health',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                gapH4,
                Text(
                  score >= 90 ? 'Excellent' : score >= 70 ? 'Good' : 'Fair',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                gapH8,
                Text(
                  'Your device is performing optimally.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: score / 100),
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeOutCubic,
                  builder: (context, val, _) {
                    return CircularProgressIndicator(
                      value: val,
                      strokeWidth: 8,
                      color: color,
                      backgroundColor: color.withValues(alpha: 0.2),
                      strokeCap: StrokeCap.round,
                    );
                  },
                ),
              ),
              Text(
                '$score',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().scale(delay: 200.ms, curve: Curves.easeOutBack);
  }

  Widget _buildLiveGauges(DashboardState state, ThemeData theme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          LiveGauge(
            title: '${state.cpuUsage.toStringAsFixed(0)}%',
            subtitle: 'CPU Usage',
            value: state.cpuUsage / 100,
            color: AppColors.info,
            icon: Icons.memory,
          ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1),
          gapW24,
          LiveGauge(
            title: '${state.ramUsage.toStringAsFixed(0)}%',
            subtitle: 'RAM Used',
            value: state.ramUsage / 100,
            color: Colors.purple,
            icon: Icons.storage,
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1),
          gapW24,
          LiveGauge(
            title: '${state.batteryPercentage.toStringAsFixed(0)}%',
            subtitle: state.isCharging ? 'Charging' : 'Battery',
            value: state.batteryPercentage / 100,
            color: AppColors.success,
            icon: state.isCharging ? Icons.battery_charging_full : Icons.battery_full,
          ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1),
        ],
      ),
    );
  }

  Widget _buildGrid(ThemeData theme) {
    final items = [
      {'title': 'Battery', 'icon': Icons.battery_full, 'color': AppColors.success, 'route': '/battery'},
      {'title': 'CPU', 'icon': Icons.memory, 'color': AppColors.info, 'route': '/cpu'},
      {'title': 'Network', 'icon': Icons.wifi, 'color': Colors.orange, 'route': '/network'},
      {'title': 'Storage', 'icon': Icons.storage, 'color': Colors.purple, 'route': '/storage'},
      {'title': 'Display', 'icon': Icons.screenshot_monitor, 'color': Colors.teal, 'route': '/display'},
      {'title': 'Memory', 'icon': Icons.ramen_dining, 'color': Colors.indigo, 'route': '/memory'},
      {'title': 'Security', 'icon': Icons.security, 'color': AppColors.error, 'route': '/security'},
      {'title': 'Sensors', 'icon': Icons.explore, 'color': Colors.deepOrange, 'route': '/sensors'},
      {'title': 'Camera', 'icon': Icons.camera, 'color': Colors.pink, 'route': '/camera'},
      {'title': 'Apps', 'icon': Icons.apps, 'color': Colors.lightBlue, 'route': '/apps'},
      {'title': 'Device Properties', 'icon': Icons.smartphone, 'color': Colors.blueGrey, 'route': '/device'},
      {'title': 'Diagnostics', 'icon': Icons.build_circle, 'color': Colors.blue, 'route': '/diagnostics'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.p16,
        mainAxisSpacing: AppSizes.p16,
        childAspectRatio: 2.0,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return GlassCard(
          onTap: () {
            // Note: some routes might not exist yet, we will create them in subsequent phases
            try {
              context.go(item['route'] as String);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item['title']} module coming soon in Phase 3/4/5')));
            }
          },
          padding: const EdgeInsets.all(AppSizes.p12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 20),
              ),
              gapW12,
              Expanded(
                child: Text(
                  item['title'] as String,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (400 + index * 50).ms).slideY(begin: 0.2);
      },
    );
  }

  Widget _buildDeviceCarePromos(ThemeData theme, BuildContext context) {
    return GlassCard(
      onTap: () => context.push('/device-care'),
      padding: const EdgeInsets.all(AppSizes.p24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.info.withValues(alpha: 0.2), shape: BoxShape.circle),
            child: const Icon(Icons.auto_awesome, color: AppColors.info, size: 32),
          ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
          gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AI Device Care', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                Text('Scan & Optimize Your Device', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    ).animate().fadeIn(delay: 250.ms).slideY(begin: 0.1);
  }
}
