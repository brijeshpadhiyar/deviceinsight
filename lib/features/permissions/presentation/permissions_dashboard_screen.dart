import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/permissions_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class PermissionsDashboardScreen extends ConsumerStatefulWidget {
  const PermissionsDashboardScreen({super.key});

  @override
  ConsumerState<PermissionsDashboardScreen> createState() => _PermissionsDashboardScreenState();
}

class _PermissionsDashboardScreenState extends ConsumerState<PermissionsDashboardScreen> with WidgetsBindingObserver {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(permissionsStateProvider.notifier).refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final stateAsync = ref.watch(permissionsStateProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Permission Manager'),
      ),
      body: stateAsync.when(
        data: (state) {
          return RefreshIndicator(
            onRefresh: () => ref.read(permissionsStateProvider.notifier).refresh(),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                top: 100,
                left: AppSizes.p20,
                right: AppSizes.p20,
                bottom: 120, // accommodate floating nav bar
              ),
              children: [
                _buildHeader(theme).animate().fadeIn().slideY(begin: 0.1),
                gapH32,
                Text('Critical Permissions', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 100.ms),
                gapH16,
                _buildPermissionCard(
                  context: context,
                  title: 'Usage Access',
                  description: 'Required to accurately calculate cache, data, and total storage sizes for applications.',
                  isGranted: state.hasUsageStats,
                  icon: Icons.data_usage_outlined,
                  onGrant: () => ref.read(permissionsStateProvider.notifier).requestUsageStats(),
                  delay: 200,
                ),
                gapH16,
                _buildPermissionCard(
                  context: context,
                  title: 'Draw Over Other Apps',
                  description: 'Required for floating performance monitors and overlay widgets.',
                  isGranted: state.hasOverlay,
                  icon: Icons.layers_outlined,
                  onGrant: () => ref.read(permissionsStateProvider.notifier).requestOverlay(),
                  delay: 300,
                ),
                gapH32,
                Text('Standard Permissions', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 400.ms),
                gapH16,
                _buildPermissionCard(
                  context: context,
                  title: 'Notifications',
                  description: 'Required to alert you about battery temperature, security risks, and background optimizations.',
                  isGranted: state.hasNotifications,
                  icon: Icons.notifications_outlined,
                  onGrant: () async {
                    await Permission.notification.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                  delay: 500,
                ),
                gapH16,
                _buildPermissionCard(
                  context: context,
                  title: 'Storage',
                  description: 'Required for exporting diagnostic PDF reports and analyzing deeply nested files.',
                  isGranted: state.hasStorage,
                  icon: Icons.storage_outlined,
                  onGrant: () async {
                    await Permission.storage.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                  delay: 600,
                ),
                gapH16,
                _buildPermissionCard(
                  context: context,
                  title: 'Location',
                  description: 'Required for detailed Wi-Fi, Cell Tower, and Network analytics (Android 10+).',
                  isGranted: state.hasLocation,
                  icon: Icons.location_on_outlined,
                  onGrant: () async {
                    await Permission.location.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                  delay: 700,
                ),
                gapH16,
                _buildPermissionCard(
                  context: context,
                  title: 'Sensors',
                  description: 'Required for real-time hardware diagnostics and gyroscope monitoring.',
                  isGranted: state.hasSensors,
                  icon: Icons.sensors_outlined,
                  onGrant: () async {
                    await Permission.sensors.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                  delay: 800,
                ),
                gapH16,
                _buildPermissionCard(
                  context: context,
                  title: 'Camera',
                  description: 'Required for Flashlight control and Camera hardware testing.',
                  isGranted: state.hasCamera,
                  icon: Icons.camera_outlined,
                  onGrant: () async {
                    await Permission.camera.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                  delay: 900,
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.security_outlined, size: 36, color: theme.colorScheme.primary),
          ),
          gapW20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Smart Permissions', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
                gapH8,
                Text(
                  'DeviceInsight never asks for unnecessary permissions. Grant access only to the features you intend to use.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionCard({
    required BuildContext context,
    required String title,
    required String description,
    required bool isGranted,
    required IconData icon,
    required VoidCallback onGrant,
    required int delay,
  }) {
    final theme = Theme.of(context);
    final statusColor = isGranted ? AppColors.success : AppColors.warning;

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: theme.colorScheme.primary, size: 24),
              ),
              gapW16,
              Expanded(
                child: Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(isGranted ? Icons.check_circle_outline : Icons.error_outline, size: 16, color: statusColor),
                    gapW6,
                    Text(
                      isGranted ? 'Granted' : 'Missing',
                      style: theme.textTheme.labelSmall?.copyWith(color: statusColor, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
          gapH16,
          Text(description, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7))),
          if (!isGranted) ...[
            gapH20,
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onGrant,
                icon: const Icon(Icons.settings),
                label: const Text('Grant Access', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ],
      ),
    ).animate().fadeIn(delay: delay.ms).slideY(begin: 0.1);
  }
}
