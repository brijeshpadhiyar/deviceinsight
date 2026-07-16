import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/device_care_provider.dart';

class DeviceCareScreen extends ConsumerStatefulWidget {
  const DeviceCareScreen({super.key});

  @override
  ConsumerState<DeviceCareScreen> createState() => _DeviceCareScreenState();
}

class _DeviceCareScreenState extends ConsumerState<DeviceCareScreen> {
  bool _isScanning = false;

  void _runScan() async {
    setState(() => _isScanning = true);
    // Vibrate to indicate scan start — wrapped in try/catch to prevent PlatformException crash
    try {
      await const MethodChannel('com.example.deviceinsight/native')
          .invokeMethod('vibrate', {'duration': 100});
    } catch (_) {
      // Haptic feedback unavailable on this device/emulator — continue scan normally
    }
    await Future.delayed(const Duration(seconds: 2)); // Simulate deep scan
    try {
      await const MethodChannel('com.example.deviceinsight/native')
          .invokeMethod('vibrate', {'duration': 200});
    } catch (_) {
      // Haptic feedback unavailable — ignore
    }
    if (mounted) setState(() => _isScanning = false);
  }

  @override
  Widget build(BuildContext context) {
    final careAsync = ref.watch(deviceCareProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Care & Optimization'),
        backgroundColor: Colors.transparent,
      ),
      body: careAsync.when(
        data: (report) {
          final color = report.overallScore > 80 ? AppColors.success : (report.overallScore > 50 ? AppColors.warning : AppColors.error);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p32),
                  child: Column(
                    children: [
                      Text('Overall Health', style: theme.textTheme.titleMedium),
                      gapH16,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 180,
                            height: 180,
                            child: CircularProgressIndicator(
                              value: _isScanning ? null : report.overallScore / 100,
                              strokeWidth: 16,
                              color: color,
                              backgroundColor: color.withValues(alpha: 0.2),
                            ),
                          ),
                          if (!_isScanning)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${report.overallScore}', style: theme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold, color: color)),
                                Text('/ 100', style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                              ],
                            ),
                          if (_isScanning)
                            Icon(Icons.search, size: 64, color: theme.colorScheme.primary).animate().fade().scale(),
                        ],
                      ),
                      gapH24,
                      if (!_isScanning)
                        ElevatedButton.icon(
                          onPressed: _runScan,
                          icon: const Icon(Icons.security),
                          label: const Text('Scan Device Now'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                          ),
                        ).animate().fadeIn(),
                    ],
                  ),
                ).animate().fadeIn(),
                gapH24,
                Row(
                  children: [
                    Expanded(child: _buildSubScore(theme, 'Security', report.securityScore)),
                    gapW12,
                    Expanded(child: _buildSubScore(theme, 'Performance', report.performanceScore)),
                    gapW12,
                    Expanded(child: _buildSubScore(theme, 'Privacy', report.privacyScore)),
                  ],
                ).animate().fadeIn(delay: 200.ms),
                gapH24,
                Text('AI Recommendations', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)).animate().fadeIn(delay: 300.ms),
                gapH12,
                if (report.recommendations.isEmpty)
                   const Center(child: Text('Your device is in perfect condition!'))
                else
                  ...report.recommendations.map((rec) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.p12),
                    child: GlassCard(
                      padding: const EdgeInsets.all(AppSizes.p16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(rec.riskLevel == 'Critical' || rec.riskLevel == 'High' ? Icons.error : Icons.warning, 
                                   color: rec.riskLevel == 'Critical' || rec.riskLevel == 'High' ? AppColors.error : AppColors.warning),
                              gapW8,
                              Expanded(child: Text(rec.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold))),
                              Chip(
                                label: Text(rec.category, style: const TextStyle(fontSize: 10)),
                                padding: EdgeInsets.zero,
                              )
                            ],
                          ),
                          gapH8,
                          Text(rec.problem, style: theme.textTheme.bodyMedium),
                          gapH4,
                          Text('Solution: ${rec.solution}', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                          if (rec.actionIntent != null) ...[
                            gapH12,
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  const MethodChannel('com.example.deviceinsight/native')
                                    .invokeMethod('openSettings', {'action': rec.actionIntent});
                                },
                                child: const Text('Fix Now ->'),
                              ),
                            )
                          ]
                        ],
                      ),
                    ).animate().fadeIn().slideX(begin: 0.1),
                  )),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildSubScore(ThemeData theme, String title, int score) {
    final color = score > 80 ? AppColors.success : (score > 50 ? AppColors.warning : AppColors.error);
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p12),
      child: Column(
        children: [
          Text(title, style: theme.textTheme.bodySmall, overflow: TextOverflow.ellipsis),
          gapH4,
          Text('$score', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
