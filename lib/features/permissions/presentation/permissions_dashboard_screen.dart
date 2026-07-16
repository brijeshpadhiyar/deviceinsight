import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_colors.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/permissions_provider.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Permission Manager'),
        backgroundColor: Colors.transparent,
      ),
      body: stateAsync.when(
        data: (state) {
          return RefreshIndicator(
            onRefresh: () => ref.read(permissionsStateProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.all(AppSizes.p20),
              children: [
                _buildHeader(theme),
                gapH24,
                Text('Critical Permissions', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                gapH12,
                _buildPermissionCard(
                  context: context,
                  title: 'Usage Access',
                  description: 'Required to accurately calculate cache, data, and total storage sizes for applications.',
                  isGranted: state.hasUsageStats,
                  icon: Icons.data_usage,
                  onGrant: () => ref.read(permissionsStateProvider.notifier).requestUsageStats(),
                ),
                gapH12,
                _buildPermissionCard(
                  context: context,
                  title: 'Draw Over Other Apps',
                  description: 'Required for floating performance monitors and overlay widgets.',
                  isGranted: state.hasOverlay,
                  icon: Icons.layers,
                  onGrant: () => ref.read(permissionsStateProvider.notifier).requestOverlay(),
                ),
                gapH24,
                Text('Standard Permissions', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                gapH12,
                _buildPermissionCard(
                  context: context,
                  title: 'Notifications',
                  description: 'Required to alert you about battery temperature, security risks, and background optimizations.',
                  isGranted: state.hasNotifications,
                  icon: Icons.notifications,
                  onGrant: () async {
                    await Permission.notification.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                ),
                gapH12,
                _buildPermissionCard(
                  context: context,
                  title: 'Storage',
                  description: 'Required for exporting diagnostic PDF reports and analyzing deeply nested files.',
                  isGranted: state.hasStorage,
                  icon: Icons.storage,
                  onGrant: () async {
                    await Permission.storage.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                ),
                gapH12,
                _buildPermissionCard(
                  context: context,
                  title: 'Location',
                  description: 'Required for detailed Wi-Fi, Cell Tower, and Network analytics (Android 10+).',
                  isGranted: state.hasLocation,
                  icon: Icons.location_on,
                  onGrant: () async {
                    await Permission.location.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                ),
                gapH12,
                _buildPermissionCard(
                  context: context,
                  title: 'Sensors',
                  description: 'Required for real-time hardware diagnostics and gyroscope monitoring.',
                  isGranted: state.hasSensors,
                  icon: Icons.sensors,
                  onGrant: () async {
                    await Permission.sensors.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                ),
                gapH12,
                _buildPermissionCard(
                  context: context,
                  title: 'Camera',
                  description: 'Required for Flashlight control and Camera hardware testing.',
                  isGranted: state.hasCamera,
                  icon: Icons.camera,
                  onGrant: () async {
                    await Permission.camera.request();
                    ref.read(permissionsStateProvider.notifier).refresh();
                  },
                ),
                gapH32,
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
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.security, size: 32, color: theme.colorScheme.primary),
          ),
          gapW20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Smart Permissions', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                gapH4,
                Text(
                  'DeviceInsight never asks for unnecessary permissions. Grant access only to the features you intend to use.',
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
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
  }) {
    final theme = Theme.of(context);
    final statusColor = isGranted ? AppColors.success : AppColors.warning;

    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: theme.colorScheme.primary),
              gapW12,
              Expanded(
                child: Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(isGranted ? Icons.check_circle : Icons.error_outline, size: 14, color: statusColor),
                    gapW4,
                    Text(
                      isGranted ? 'Granted' : 'Missing',
                      style: theme.textTheme.labelSmall?.copyWith(color: statusColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          gapH12,
          Text(description, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7))),
          if (!isGranted) ...[
            gapH16,
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onGrant,
                icon: const Icon(Icons.settings),
                label: const Text('Grant Access'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
