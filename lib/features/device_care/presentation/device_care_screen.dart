import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/device_care_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class DeviceCareScreen extends ConsumerStatefulWidget {
  const DeviceCareScreen({super.key});

  @override
  ConsumerState<DeviceCareScreen> createState() => _DeviceCareScreenState();
}

class _DeviceCareScreenState extends ConsumerState<DeviceCareScreen> {
  bool _isScanning = false;

  void _runScan() async {
    setState(() => _isScanning = true);
    // Vibrate to indicate scan start
    try {
      await const MethodChannel('com.example.deviceinsight/native')
          .invokeMethod('vibrate', {'duration': 100});
    } catch (_) {}
    
    await Future.delayed(const Duration(seconds: 2)); // Simulate deep scan
    
    try {
      await const MethodChannel('com.example.deviceinsight/native')
          .invokeMethod('vibrate', {'duration': 200});
    } catch (_) {}
    
    if (mounted) setState(() => _isScanning = false);
  }

  @override
  Widget build(BuildContext context) {
    final careAsync = ref.watch(deviceCareProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('AI Device Care'),
      ),
      body: careAsync.when(
        data: (report) {
          final color = report.overallScore > 80 ? AppColors.success : (report.overallScore > 50 ? AppColors.warning : AppColors.error);

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
                GlassCard(
                  animateOnEntry: true,
                  padding: const EdgeInsets.all(AppSizes.p48),
                  child: Column(
                    children: [
                      Text('Optimization Score', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, letterSpacing: 0.5)),
                      gapH32,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 220,
                            height: 220,
                            child: CircularProgressIndicator(
                              value: _isScanning ? null : report.overallScore / 100,
                              strokeWidth: 20,
                              color: color,
                              backgroundColor: color.withValues(alpha: 0.15),
                              strokeCap: StrokeCap.round,
                            ),
                          ),
                          if (!_isScanning)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${report.overallScore}', style: theme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w900, color: color, letterSpacing: -2)),
                                Text('Excellent', style: theme.textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.bold)), // This could be dynamic based on score
                              ],
                            ),
                          if (_isScanning)
                            Icon(Icons.auto_awesome, size: 64, color: theme.colorScheme.primary)
                              .animate(onPlay: (c) => c.repeat(reverse: true))
                              .fade(duration: 500.ms).scale(begin: const Offset(0.8,0.8), end: const Offset(1.2,1.2)),
                        ],
                      ),
                      gapH48,
                      if (!_isScanning)
                        GestureDetector(
                          onTap: _runScan,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  theme.colorScheme.primary,
                                  AppColors.secondaryDark, // cyan
                                ],
                              ),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.auto_fix_high, color: Colors.white, size: 24),
                                gapW12,
                                Text(
                                  'Optimize Now',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animate().fadeIn().scale(duration: 400.ms, curve: Curves.easeOutBack),
                    ],
                  ),
                ),
                gapH32,
                Row(
                  children: [
                    Expanded(child: _buildSubScore(theme, 'Security', report.securityScore)),
                    gapW12,
                    Expanded(child: _buildSubScore(theme, 'Performance', report.performanceScore)),
                    gapW12,
                    Expanded(child: _buildSubScore(theme, 'Privacy', report.privacyScore)),
                  ],
                ).animate().fadeIn(delay: 200.ms),
                gapH32,
                Text('AI Recommendations', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 300.ms),
                gapH16,
                if (report.recommendations.isEmpty)
                   GlassCard(
                     padding: const EdgeInsets.all(AppSizes.p32),
                     child: Center(
                       child: Column(
                         children: [
                           const Icon(Icons.check_circle_outline, color: AppColors.healthExcellent, size: 48),
                           gapH16,
                           Text('Your device is fully optimized!', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                         ],
                       ),
                     ),
                   )
                else
                  ...report.recommendations.map((rec) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.p16),
                    child: GlassCard(
                      animateOnEntry: true,
                      padding: const EdgeInsets.all(AppSizes.p24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: (rec.riskLevel == 'Critical' || rec.riskLevel == 'High' ? AppColors.error : AppColors.warning).withValues(alpha: 0.15),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(rec.riskLevel == 'Critical' || rec.riskLevel == 'High' ? Icons.error_outline : Icons.warning_amber, 
                                     color: rec.riskLevel == 'Critical' || rec.riskLevel == 'High' ? AppColors.error : AppColors.warning),
                              ),
                              gapW12,
                              Expanded(child: Text(rec.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800))),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(rec.category, style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700)),
                              )
                            ],
                          ),
                          gapH16,
                          Text(rec.problem, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.8))),
                          gapH12,
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.lightbulb_outline, color: theme.colorScheme.primary, size: 16),
                                gapW8,
                                Expanded(child: Text(rec.solution, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w700))),
                              ],
                            ),
                          ),
                          if (rec.actionIntent != null) ...[
                            gapH16,
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton.icon(
                                onPressed: () {
                                  const MethodChannel('com.example.deviceinsight/native')
                                    .invokeMethod('openSettings', {'action': rec.actionIntent});
                                },
                                icon: const Icon(Icons.build_circle),
                                label: const Text('Fix Now', style: TextStyle(fontWeight: FontWeight.bold)),
                                style: TextButton.styleFrom(
                                  foregroundColor: theme.colorScheme.primary,
                                ),
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
      animateOnEntry: true,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.p20, horizontal: AppSizes.p12),
      child: Column(
        children: [
          Text(title, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600, color: theme.colorScheme.onSurface.withValues(alpha: 0.6)), overflow: TextOverflow.ellipsis),
          gapH8,
          Text('$score', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }
}
