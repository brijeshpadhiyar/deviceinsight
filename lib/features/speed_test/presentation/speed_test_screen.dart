import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';
import '../data/speed_test_repository_impl.dart';
import '../domain/models/speed_test_history.dart';

final speedTestHistoryProvider = FutureProvider.autoDispose<List<SpeedTestHistory>>((ref) async {
  final repo = ref.read(speedTestRepositoryProvider);
  return await repo.getHistory();
});

class SpeedTestScreen extends ConsumerStatefulWidget {
  const SpeedTestScreen({super.key});

  @override
  ConsumerState<SpeedTestScreen> createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends ConsumerState<SpeedTestScreen> {
  bool _isRunning = false;
  String _phase = 'idle';
  double _currentValue = 0.0;
  double _ping = 0.0;
  double _jitter = 0.0;
  double _download = 0.0;
  double _upload = 0.0;

  void _startTest() {
    setState(() {
      _isRunning = true;
      _phase = 'ping';
      _currentValue = 0.0;
      _ping = 0.0;
      _jitter = 0.0;
      _download = 0.0;
      _upload = 0.0;
    });

    final repo = ref.read(speedTestRepositoryProvider);
    repo.runSpeedTest().listen((event) {
      if (!mounted) return;
      setState(() {
        _phase = event['phase'];
        if (_phase == 'ping') {
           _currentValue = (event['value'] as num).toDouble();
           _ping = _currentValue;
           if (event.containsKey('jitter')) _jitter = (event['jitter'] as num).toDouble();
        } else if (_phase == 'download') {
           _currentValue = (event['value'] as num).toDouble();
           _download = _currentValue;
        } else if (_phase == 'upload') {
           _currentValue = (event['value'] as num).toDouble();
           _upload = _currentValue;
        } else if (_phase == 'complete') {
           _isRunning = false;
           // Save result
           final result = SpeedTestHistory(
             timestamp: DateTime.now(),
             downloadMbps: _download,
             uploadMbps: _upload,
             pingMs: _ping.toInt(),
             jitterMs: _jitter.toInt(),
             serverName: 'Cloudflare',
             networkType: 'WiFi',
             connectionInfo: 'Optimal',
           );
           repo.saveResult(result).then((_) {
             ref.invalidate(speedTestHistoryProvider);
           });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return DefaultTabController(
      length: 2,
      child: GlassScaffold(
        appBar: GlassAppBar(
          title: const Text('Speed Test'),
          bottom: TabBar(
            indicatorColor: theme.colorScheme.primary,
            labelStyle: const TextStyle(fontWeight: FontWeight.w900),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            tabs: const [
              Tab(text: 'SPEED'),
              Tab(text: 'HISTORY'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTestTab(theme),
            _buildHistoryTab(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildTestTab(ThemeData theme) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        top: 130, // Account for appbar + tabs
        left: AppSizes.p20, 
        right: AppSizes.p20,
        bottom: 120, // Account for floating nav bar
      ),
      child: Column(
        children: [
          GlassCard(
            animateOnEntry: true,
            padding: const EdgeInsets.all(AppSizes.p48),
            child: Column(
              children: [
                Text(
                  _phase == 'idle' ? 'Ready to Test' : _phase.toUpperCase(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: _phase == 'download' ? AppColors.success : (_phase == 'upload' ? Colors.blue : theme.colorScheme.onSurface),
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ).animate(target: _isRunning ? 1 : 0).fade(),
                gapH24,
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: _currentValue),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCirc,
                  builder: (context, val, _) {
                    return Text(
                      val.toStringAsFixed(1),
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.primary,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    );
                  }
                ),
                Text(
                  _phase == 'ping' ? 'ms' : 'Mbps',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                gapH48,
                if (!_isRunning)
                  GestureDetector(
                    onTap: _startTest,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 20),
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
                      child: Text(
                        'GO',
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ).animate().fadeIn().scale(duration: 400.ms, curve: Curves.easeOutBack),
                if (_isRunning)
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      color: theme.colorScheme.primary,
                    ),
                  ).animate().fadeIn(),
              ],
            ),
          ),
          gapH32,
          Row(
            children: [
              Expanded(child: _buildMetricCard(theme, 'Ping', '$_ping', 'ms', Icons.compare_arrows_outlined)),
              gapW16,
              Expanded(child: _buildMetricCard(theme, 'Jitter', '$_jitter', 'ms', Icons.timeline_outlined)),
            ],
          ).animate().fadeIn(delay: 100.ms),
          gapH16,
          Row(
            children: [
              Expanded(child: _buildMetricCard(theme, 'Download', _download.toStringAsFixed(1), 'Mbps', Icons.download_outlined, color: AppColors.success)),
              gapW16,
              Expanded(child: _buildMetricCard(theme, 'Upload', _upload.toStringAsFixed(1), 'Mbps', Icons.upload_outlined, color: Colors.blueAccent)),
            ],
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildMetricCard(ThemeData theme, String title, String value, String unit, IconData icon, {Color? color}) {
    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color ?? theme.colorScheme.onSurface.withValues(alpha: 0.6)),
              gapW8,
              Text(title, style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w600)),
            ],
          ),
          gapH12,
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value, 
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900, 
                  color: color ?? theme.colorScheme.onSurface,
                  fontFeatures: const [FontFeature.tabularFigures()],
                )
              ),
              gapW4,
              Text(unit, style: theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600, color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryTab(ThemeData theme) {
    final historyAsync = ref.watch(speedTestHistoryProvider);
    return historyAsync.when(
      data: (history) {
        if (history.isEmpty) return const Center(child: Text('No previous tests found.'));
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: 130, // Account for appbar + tabs
            left: AppSizes.p20, 
            right: AppSizes.p20,
            bottom: 120, // Account for floating nav bar
          ),
          itemCount: history.length,
          itemBuilder: (context, index) {
            final item = history[index];
            final timeStr = '${item.timestamp.day}/${item.timestamp.month} ${item.timestamp.hour}:${item.timestamp.minute.toString().padLeft(2, '0')}';
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.p16),
              child: GlassCard(
                animateOnEntry: true,
                padding: const EdgeInsets.all(AppSizes.p20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(timeStr, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                        gapH4,
                        Text('${item.networkType} - ${item.serverName}', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.download, size: 14, color: AppColors.success),
                                gapW6,
                                Text(item.downloadMbps.toStringAsFixed(1), style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, fontFeatures: const [FontFeature.tabularFigures()])),
                              ],
                            ),
                            gapH4,
                            Row(
                              children: [
                                const Icon(Icons.upload, size: 14, color: Colors.blueAccent),
                                gapW6,
                                Text(item.uploadMbps.toStringAsFixed(1), style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, fontFeatures: const [FontFeature.tabularFigures()])),
                              ],
                            ),
                          ],
                        ),
                        gapW16,
                        IconButton(
                          icon: const Icon(Icons.delete_outline, color: AppColors.error),
                          onPressed: () async {
                            await ref.read(speedTestRepositoryProvider).deleteResult(item.id!);
                            ref.invalidate(speedTestHistoryProvider);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: (index * 50).ms).slideX(begin: 0.1),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }
}
