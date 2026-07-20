import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/live_gauge.dart';
import '../../shared/widgets/educational_card.dart';
import '../../shared/widgets/glass_scaffold.dart';
import '../providers/dashboard_provider.dart';
import '../providers/dashboard_state.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      body: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppSizes.p48, 
                  left: AppSizes.p20, 
                  right: AppSizes.p20, 
                  bottom: 100, // Padding for floating nav bar
                ),
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
    );
  }

  Widget _buildHeader(BuildContext context, DashboardState state, ThemeData theme) {
    final bool isOverheating = state.batteryTemperature > 40.0;
    final bool isPoorHealth = state.overallHealthScore < 50;
    
    final statusColor = isOverheating ? AppColors.error : (isPoorHealth ? AppColors.healthPoor : AppColors.healthExcellent);
    final statusIcon = isOverheating ? Icons.local_fire_department : (isPoorHealth ? Icons.warning_amber : Icons.verified_user);
    final statusText = isOverheating ? 'Overheating' : (isPoorHealth ? 'Attention' : 'Protected');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: theme.colorScheme.primary,
              highlightColor: theme.colorScheme.secondary,
              period: const Duration(seconds: 4),
              child: Text(
                'DeviceInsight',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w900, // Extra bold for premium feel
                  letterSpacing: -1.0,
                ),
              ),
            ).animate().fadeIn().slideX(begin: -0.1),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(30), // Pill shape
                border: Border.all(color: statusColor.withValues(alpha: 0.4), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: statusColor.withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(statusIcon, color: statusColor, size: 18)
                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                    .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: 1.seconds),
                  gapW8,
                  Text(
                    statusText,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
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
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ).animate().fadeIn(delay: 100.ms),
        Text(
          'Android ${state.androidVersion}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            letterSpacing: 1.0,
          ),
        ).animate().fadeIn(delay: 100.ms),
        gapH32,
        Text(
          'Quick Actions',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ).animate().fadeIn(delay: 200.ms),
        gapH16,
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: AppSizes.p16,
          mainAxisSpacing: AppSizes.p16,
          childAspectRatio: 1.1, // Slightly taller for more elegance
          children: [
            _buildNavCard(context, 'Security', Icons.shield_outlined, AppColors.error, '/security', 0),
            _buildNavCard(context, 'Sensors', Icons.explore_outlined, Colors.purpleAccent, '/sensors', 1),
            _buildNavCard(context, 'Camera', Icons.camera_alt_outlined, AppColors.info, '/camera', 2),
            _buildNavCard(context, 'Apps', Icons.apps_outlined, Colors.greenAccent, '/apps', 3),
          ],
        ),
      ],
    );
  }

  Widget _buildNavCard(BuildContext context, String title, IconData icon, Color color, String route, int index) {
    final theme = Theme.of(context);
    return GlassCard(
      onTap: () => context.go(route),
      animateOnEntry: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.2),
                  blurRadius: 16,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Icon(icon, color: color, size: 36),
          ),
          gapH16,
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (200 + index * 100).ms).slideY(begin: 0.1);
  }

  Widget _buildHealthScore(DashboardState state, ThemeData theme) {
    final score = state.overallHealthScore;
    final color = score >= 90 ? AppColors.healthExcellent 
                : score >= 70 ? AppColors.healthGood 
                : score >= 50 ? AppColors.healthFair : AppColors.healthPoor;
    
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p24),
      animateOnEntry: true,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall Health',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    letterSpacing: 1.0,
                  ),
                ),
                gapH8,
                Text(
                  score >= 90 ? 'Excellent' : score >= 70 ? 'Good' : 'Fair',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
                gapH8,
                Text(
                  'Your device is performing optimally.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 24,
                  spreadRadius: -5,
                )
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 90,
                  height: 90,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: score / 100),
                    duration: const Duration(milliseconds: 2000), // Longer, smoother animation
                    curve: Curves.easeOutCirc,
                    builder: (context, val, _) {
                      return CircularProgressIndicator(
                        value: val,
                        strokeWidth: 10,
                        color: color,
                        backgroundColor: color.withValues(alpha: 0.15),
                        strokeCap: StrokeCap.round,
                      );
                    },
                  ),
                ),
                Text(
                  '$score',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveGauges(DashboardState state, ThemeData theme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          LiveGauge(
            title: '${state.cpuUsage.toStringAsFixed(0)}%',
            subtitle: 'CPU Usage',
            value: state.cpuUsage / 100,
            color: AppColors.secondaryDark, // Using new neon cyan
            icon: Icons.memory_outlined,
          ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1),
          gapW24,
          LiveGauge(
            title: '${state.ramUsage.toStringAsFixed(0)}%',
            subtitle: 'RAM Used',
            value: state.ramUsage / 100,
            color: AppColors.primaryDark, // Using new amethyst
            icon: Icons.psychology_outlined,
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1),
          gapW24,
          LiveGauge(
            title: '${state.batteryPercentage.toStringAsFixed(0)}%',
            subtitle: state.isCharging ? 'Charging' : 'Battery',
            value: state.batteryPercentage / 100,
            color: AppColors.success,
            icon: state.isCharging ? Icons.bolt : Icons.battery_full_outlined,
          ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1),
        ],
      ),
    );
  }

  Widget _buildGrid(ThemeData theme) {
    final items = [
      {'title': 'Battery', 'icon': Icons.battery_charging_full_outlined, 'color': AppColors.success, 'route': '/battery'},
      {'title': 'CPU', 'icon': Icons.memory_outlined, 'color': AppColors.info, 'route': '/cpu'},
      {'title': 'Network', 'icon': Icons.wifi_outlined, 'color': Colors.orangeAccent, 'route': '/network'},
      {'title': 'Storage', 'icon': Icons.storage_outlined, 'color': Colors.purpleAccent, 'route': '/storage'},
      {'title': 'Display', 'icon': Icons.smartphone_outlined, 'color': Colors.tealAccent, 'route': '/display'},
      {'title': 'Memory', 'icon': Icons.psychology_outlined, 'color': Colors.indigoAccent, 'route': '/memory'},
      {'title': 'Security', 'icon': Icons.shield_outlined, 'color': AppColors.error, 'route': '/security'},
      {'title': 'Device', 'icon': Icons.devices_outlined, 'color': Colors.blueGrey, 'route': '/device'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.p16,
        mainAxisSpacing: AppSizes.p16,
        childAspectRatio: 2.2, // Slightly wider
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return GlassCard(
          animateOnEntry: true,
          onTap: () {
            try {
              context.go(item['route'] as String);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${item['title']} module coming soon')));
            }
          },
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16, vertical: AppSizes.p12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 22),
              ),
              gapW12,
              Expanded(
                child: Text(
                  item['title'] as String,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (400 + index * 50).ms).slideY(begin: 0.1);
      },
    );
  }

  Widget _buildDeviceCarePromos(ThemeData theme, BuildContext context) {
    return GlassCard(
      animateOnEntry: true,
      onTap: () => context.push('/device-care'),
      padding: const EdgeInsets.all(AppSizes.p24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryDark.withValues(alpha: 0.2), 
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryDark.withValues(alpha: 0.3),
                  blurRadius: 16,
                )
              ]
            ),
            child: const Icon(Icons.auto_awesome, color: AppColors.primaryDark, size: 36),
          ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(begin: const Offset(1,1), end: const Offset(1.05, 1.05), duration: 2.seconds),
          gapW20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AI Device Care', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                gapH4,
                Text('Scan & optimize your device instantly', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7))),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 20, color: AppColors.primaryDark),
        ],
      ),
    );
  }
}

