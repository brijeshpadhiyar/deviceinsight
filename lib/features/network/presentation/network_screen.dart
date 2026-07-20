import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/network_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class NetworkScreen extends ConsumerWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkAsync = ref.watch(networkStreamProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Network Monitor'),
      ),
      body: networkAsync.when(
        data: (state) {
          final isWifi = state.connectionType == 'WiFi';
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 100,
              left: AppSizes.p20,
              right: AppSizes.p20,
              bottom: 120, // accommodate floating nav bar
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Live Speed Cards
                Row(
                  children: [
                    Expanded(
                      child: GlassCard(
                        animateOnEntry: true,
                        padding: const EdgeInsets.all(AppSizes.p20),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.success.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.arrow_downward, color: AppColors.success, size: 28),
                            ).animate(onPlay: (c) => c.repeat(reverse: true)).moveY(begin: -2, end: 2, duration: 1.seconds),
                            gapH12,
                            Text('Rx (Download)', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w600)),
                            gapH4,
                            Text('${(state.downloadSpeed / (1024 * 1024)).toStringAsFixed(2)} MB/s', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900, color: AppColors.success)),
                          ],
                        ),
                      ),
                    ),
                    gapW16,
                    Expanded(
                      child: GlassCard(
                        animateOnEntry: true,
                        padding: const EdgeInsets.all(AppSizes.p20),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.arrow_upward, color: Colors.blueAccent, size: 28),
                            ).animate(onPlay: (c) => c.repeat(reverse: true)).moveY(begin: 2, end: -2, duration: 1.seconds),
                            gapH12,
                            Text('Tx (Upload)', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w600)),
                            gapH4,
                            Text('${(state.uploadSpeed / (1024 * 1024)).toStringAsFixed(2)} MB/s', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900, color: Colors.blueAccent)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                gapH32,
                
                // Connection Stats
                Text('Active Connection', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 200.ms),
                gapH16,
                GlassCard(
                  animateOnEntry: true,
                  padding: const EdgeInsets.all(AppSizes.p24),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(isWifi ? Icons.wifi : Icons.cell_tower, size: 36, color: theme.colorScheme.primary),
                          ),
                          gapW20,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.connectionType, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                                gapH4,
                                if (isWifi) Text('BSSID: ${state.bssid}', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                              ],
                            ),
                          ),
                          if (isWifi)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('${state.wifiSignalStrength} dBm', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900)),
                                Text('Signal', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w600)),
                              ],
                            ),
                        ],
                      ),
                      if (isWifi) ...[
                        const Divider(height: 48),
                        _buildInfoRow(theme, 'Frequency', '${state.frequency} MHz'),
                        gapH12,
                        _buildInfoRow(theme, 'MAC Address', state.macAddress),
                      ]
                    ],
                  ),
                ),
                gapH32,

                // IP Config
                Text('IP Configuration', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 400.ms),
                gapH16,
                GlassCard(
                  animateOnEntry: true,
                  padding: const EdgeInsets.all(AppSizes.p24),
                  child: Column(
                    children: [
                      _buildInfoRow(theme, 'IPv4 Address', state.ipAddress),
                      gapH12,
                      _buildInfoRow(theme, 'IPv6 Address', state.ipv6Address, copyable: true),
                      gapH12,
                      _buildInfoRow(theme, 'DNS Server(s)', state.dnsServers.isEmpty ? 'Unknown' : state.dnsServers.join(', ')),
                    ],
                  ),
                ),
                gapH32,

                GestureDetector(
                  onTap: () => context.push('/network/speed-test'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          AppColors.secondaryDark, // cyan
                        ],
                      ),
                      borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.speed, color: Colors.white, size: 28),
                        gapW12,
                        Text(
                          'Run Professional Speed Test',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(begin: const Offset(1,1), end: const Offset(1.02, 1.02), duration: 2.seconds),
                ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),
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
      crossAxisAlignment: CrossAxisAlignment.start, // in case of long text
      children: [
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w600)),
        gapW16,
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
