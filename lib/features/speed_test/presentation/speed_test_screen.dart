import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
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
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Speed Test'),
          backgroundColor: Colors.transparent,
          bottom: const TabBar(
            tabs: [
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
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        children: [
          GlassCard(
            padding: const EdgeInsets.all(AppSizes.p32),
            child: Column(
              children: [
                Text(
                  _phase == 'idle' ? 'Ready to Test' : _phase.toUpperCase(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: _phase == 'download' ? AppColors.success : (_phase == 'upload' ? Colors.blue : theme.colorScheme.onSurface),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH16,
                Text(
                  _currentValue.toStringAsFixed(1),
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                Text(
                  _phase == 'ping' ? 'ms' : 'Mbps',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                gapH32,
                if (!_isRunning)
                  ElevatedButton(
                    onPressed: _startTest,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text('GO', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onPrimary)),
                  ).animate().scale(),
                if (_isRunning)
                  const CircularProgressIndicator(),
              ],
            ),
          ).animate().fadeIn(),
          gapH24,
          Row(
            children: [
              Expanded(child: _buildMetricCard(theme, 'Ping', '$_ping', 'ms', Icons.compare_arrows)),
              gapW16,
              Expanded(child: _buildMetricCard(theme, 'Jitter', '$_jitter', 'ms', Icons.timeline)),
            ],
          ).animate().fadeIn(delay: 100.ms),
          gapH16,
          Row(
            children: [
              Expanded(child: _buildMetricCard(theme, 'Download', _download.toStringAsFixed(1), 'Mbps', Icons.download, color: AppColors.success)),
              gapW16,
              Expanded(child: _buildMetricCard(theme, 'Upload', _upload.toStringAsFixed(1), 'Mbps', Icons.upload, color: Colors.blue)),
            ],
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildMetricCard(ThemeData theme, String title, String value, String unit, IconData icon, {Color? color}) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color ?? theme.colorScheme.onSurface.withValues(alpha: 0.6)),
              gapW8,
              Text(title, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
            ],
          ),
          gapH8,
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: color)),
              gapW4,
              Text(unit, style: theme.textTheme.bodySmall),
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
          padding: const EdgeInsets.all(AppSizes.p20),
          itemCount: history.length,
          itemBuilder: (context, index) {
            final item = history[index];
            final timeStr = '${item.timestamp.day}/${item.timestamp.month} ${item.timestamp.hour}:${item.timestamp.minute.toString().padLeft(2, '0')}';
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.p12),
              child: GlassCard(
                padding: const EdgeInsets.all(AppSizes.p16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(timeStr, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                        Text('${item.networkType} - ${item.serverName}', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.download, size: 12, color: AppColors.success),
                                gapW4,
                                Text(item.downloadMbps.toStringAsFixed(1), style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.upload, size: 12, color: Colors.blue),
                                gapW4,
                                Text(item.uploadMbps.toStringAsFixed(1), style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
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
