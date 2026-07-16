import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/network_provider.dart';

class NetworkScreen extends ConsumerWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkAsync = ref.watch(networkStreamProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Network Monitor'),
        backgroundColor: Colors.transparent,
      ),
      body: networkAsync.when(
        data: (state) {
          final isWifi = state.connectionType == 'WiFi';
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Live Speed Cards
                Row(
                  children: [
                    Expanded(
                      child: GlassCard(
                        padding: const EdgeInsets.all(AppSizes.p16),
                        child: Column(
                          children: [
                            const Icon(Icons.download, color: AppColors.success, size: 32),
                            gapH8,
                            Text('Rx (Download)', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                            Text('${(state.downloadSpeed / (1024 * 1024)).toStringAsFixed(2)} MB/s', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: AppColors.success)),
                          ],
                        ),
                      ).animate().fadeIn(),
                    ),
                    gapW16,
                    Expanded(
                      child: GlassCard(
                        padding: const EdgeInsets.all(AppSizes.p16),
                        child: Column(
                          children: [
                            const Icon(Icons.upload, color: Colors.blue, size: 32),
                            gapH8,
                            Text('Tx (Upload)', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                            Text('${(state.uploadSpeed / (1024 * 1024)).toStringAsFixed(2)} MB/s', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                          ],
                        ),
                      ).animate().fadeIn(delay: 100.ms),
                    ),
                  ],
                ),
                gapH24,
                
                // Connection Stats
                Text('Active Connection', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)).animate().fadeIn(delay: 200.ms),
                gapH12,
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(isWifi ? Icons.wifi : Icons.cell_tower, size: 32, color: theme.colorScheme.primary),
                          gapW16,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.connectionType, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                                if (isWifi) Text('BSSID: ${state.bssid}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                              ],
                            ),
                          ),
                          if (isWifi)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('${state.wifiSignalStrength} dBm', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                                Text('Signal', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                              ],
                            ),
                        ],
                      ),
                      if (isWifi) ...[
                        const Divider(height: 32),
                        _buildInfoRow(theme, 'Frequency', '${state.frequency} MHz'),
                        const SizedBox(height: 8),
                        _buildInfoRow(theme, 'MAC Address', state.macAddress),
                      ]
                    ],
                  ),
                ).animate().fadeIn(delay: 300.ms),
                gapH24,

                // IP Config
                Text('IP Configuration', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)).animate().fadeIn(delay: 400.ms),
                gapH12,
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p20),
                  child: Column(
                    children: [
                      _buildInfoRow(theme, 'IPv4 Address', state.ipAddress),
                      const SizedBox(height: 8),
                      _buildInfoRow(theme, 'IPv6 Address', state.ipv6Address, copyable: true),
                      const SizedBox(height: 8),
                      _buildInfoRow(theme, 'DNS Server(s)', state.dnsServers.isEmpty ? 'Unknown' : state.dnsServers.join(', ')),
                    ],
                  ),
                ).animate().fadeIn(delay: 500.ms),
                gapH24,

                ElevatedButton.icon(
                  onPressed: () => context.push('/speed-test'),
                  icon: const Icon(Icons.speed),
                  label: const Text('Run Professional Speed Test'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(AppSizes.p16),
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                  ),
                ).animate().fadeIn(delay: 600.ms),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildInfoRow(ThemeData theme, String label, String value, {bool copyable = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
