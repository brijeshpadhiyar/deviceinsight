import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';

/// Speed test phases
enum _Phase { idle, ping, download, upload, complete }

class SpeedTestScreen extends ConsumerStatefulWidget {
  const SpeedTestScreen({super.key});

  @override
  ConsumerState<SpeedTestScreen> createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends ConsumerState<SpeedTestScreen>
    with TickerProviderStateMixin {
  _Phase _phase = _Phase.idle;
  double _currentSpeedMbps = 0.0;
  double _finalDownloadMbps = 0.0;
  double _finalUploadMbps = 0.0;
  int _pingMs = 0;
  int _jitterMs = 0;
  double _packetLoss = 0.0;

  late AnimationController _gaugeController;
  late Animation<double> _gaugeAnim;

  // Test history stored locally in state
  final List<_TestResult> _history = [];

  @override
  void initState() {
    super.initState();
    _gaugeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _gaugeAnim = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _gaugeController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _gaugeController.dispose();
    super.dispose();
  }

  void _animateTo(double target, {double maxVal = 200}) {
    final normalized = (target / maxVal).clamp(0.0, 1.0);
    _gaugeAnim = Tween<double>(
      begin: _gaugeAnim.value,
      end: normalized,
    ).animate(CurvedAnimation(parent: _gaugeController, curve: Curves.easeOut));
    _gaugeController.forward(from: 0);
  }

  Future<void> _startTest() async {
    final rng = Random();
    setState(() {
      _phase = _Phase.ping;
      _currentSpeedMbps = 0.0;
      _finalDownloadMbps = 0.0;
      _finalUploadMbps = 0.0;
      _pingMs = 0;
      _jitterMs = 0;
      _packetLoss = 0.0;
    });

    // --- PING phase ---
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() {
      _pingMs = 18 + rng.nextInt(25);
      _jitterMs = 1 + rng.nextInt(6);
      _packetLoss = rng.nextDouble() * 0.5;
    });

    // --- DOWNLOAD phase ---
    if (!mounted) return;
    setState(() => _phase = _Phase.download);

    double speed = 10.0;
    for (int i = 0; i < 25; i++) {
      await Future.delayed(const Duration(milliseconds: 140));
      if (!mounted) return;
      // Simulate ramp up then plateau with noise
      speed = (i < 10)
          ? 10.0 + i * 8.0 + rng.nextDouble() * 5
          : 90.0 + rng.nextDouble() * 60;
      speed = speed.clamp(0, 200);
      setState(() => _currentSpeedMbps = speed);
      _animateTo(speed);
    }
    _finalDownloadMbps = speed;

    // --- UPLOAD phase ---
    if (!mounted) return;
    setState(() {
      _phase = _Phase.upload;
      _currentSpeedMbps = 0.0;
    });
    _animateTo(0);

    double upSpeed = 5.0;
    for (int i = 0; i < 20; i++) {
      await Future.delayed(const Duration(milliseconds: 140));
      if (!mounted) return;
      upSpeed = (i < 8)
          ? 5.0 + i * 4.0 + rng.nextDouble() * 3
          : 40.0 + rng.nextDouble() * 30;
      upSpeed = upSpeed.clamp(0, 100);
      setState(() => _currentSpeedMbps = upSpeed);
      _animateTo(upSpeed, maxVal: 100);
    }
    _finalUploadMbps = upSpeed;

    // --- COMPLETE ---
    if (!mounted) return;
    setState(() {
      _phase = _Phase.complete;
      _currentSpeedMbps = 0.0;
    });
    _animateTo(1.0, maxVal: 1.0);

    // Save to history
    _history.insert(
      0,
      _TestResult(
        timestamp: DateTime.now(),
        downloadMbps: _finalDownloadMbps,
        uploadMbps: _finalUploadMbps,
        pingMs: _pingMs,
        jitterMs: _jitterMs,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRunning = _phase == _Phase.download || _phase == _Phase.upload || _phase == _Phase.ping;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Speed Test'),
          backgroundColor: Colors.transparent,
          bottom: const TabBar(
            tabs: [Tab(text: 'TEST'), Tab(text: 'HISTORY')],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTestTab(theme, isRunning),
            _buildHistoryTab(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildTestTab(ThemeData theme, bool isRunning) {
    final phaseLabel = switch (_phase) {
      _Phase.idle => 'Ready to Test',
      _Phase.ping => 'Testing Ping...',
      _Phase.download => 'Testing Download...',
      _Phase.upload => 'Testing Upload...',
      _Phase.complete => 'Test Complete ✓',
    };
    final phaseColor = switch (_phase) {
      _Phase.download => AppColors.success,
      _Phase.upload => Colors.blue,
      _Phase.complete => AppColors.success,
      _ => theme.colorScheme.primary,
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Gauge Card ---
          GlassCard(
            padding: const EdgeInsets.all(AppSizes.p32),
            child: Column(
              children: [
                Text(
                  phaseLabel,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: phaseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                gapH24,
                // Circular gauge
                AnimatedBuilder(
                  animation: _gaugeAnim,
                  builder: (context, _) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: CircularProgressIndicator(
                            value: _phase == _Phase.complete ? 1.0 : _gaugeAnim.value,
                            strokeWidth: 14,
                            color: phaseColor,
                            backgroundColor: phaseColor.withValues(alpha: 0.15),
                            strokeCap: StrokeCap.round,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_phase == _Phase.idle)
                              Icon(Icons.network_check, size: 48, color: theme.colorScheme.primary),
                            if (_phase == _Phase.ping)
                              Text(
                                '$_pingMs',
                                style: theme.textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: phaseColor,
                                ),
                              ),
                            if (_phase == _Phase.download || _phase == _Phase.upload)
                              Text(
                                _currentSpeedMbps.toStringAsFixed(1),
                                style: theme.textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: phaseColor,
                                ),
                              ),
                            if (_phase == _Phase.complete)
                              const Icon(Icons.check_circle, size: 56, color: AppColors.success),
                            if (_phase == _Phase.ping)
                              Text('ms', style: theme.textTheme.titleMedium),
                            if (_phase == _Phase.download || _phase == _Phase.upload)
                              Text('Mbps', style: theme.textTheme.titleMedium),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                gapH24,
                if (!isRunning)
                  ElevatedButton(
                    onPressed: _startTest,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      _phase == _Phase.complete ? 'Run Again' : 'Start Test',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ).animate().scale(),
                if (isRunning)
                  Text(
                    'Please wait...',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
              ],
            ),
          ).animate().fadeIn(),
          gapH24,

          // --- Results Row ---
          Row(
            children: [
              Expanded(
                child: _buildResultCard(
                  theme,
                  label: 'Download',
                  value: _phase == _Phase.complete
                      ? _finalDownloadMbps.toStringAsFixed(1)
                      : (_phase == _Phase.download ? _currentSpeedMbps.toStringAsFixed(1) : '--'),
                  unit: 'Mbps',
                  icon: Icons.download,
                  color: AppColors.success,
                ),
              ),
              gapW16,
              Expanded(
                child: _buildResultCard(
                  theme,
                  label: 'Upload',
                  value: _phase == _Phase.complete
                      ? _finalUploadMbps.toStringAsFixed(1)
                      : (_phase == _Phase.upload ? _currentSpeedMbps.toStringAsFixed(1) : '--'),
                  unit: 'Mbps',
                  icon: Icons.upload,
                  color: Colors.blue,
                ),
              ),
            ],
          ).animate().fadeIn(delay: 100.ms),
          gapH16,

          // --- Ping row ---
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p20, vertical: AppSizes.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn(theme, 'Ping',
                    _pingMs > 0 ? '$_pingMs ms' : '--'),
                Container(width: 1, height: 36, color: theme.dividerColor),
                _buildStatColumn(theme, 'Jitter',
                    _jitterMs > 0 ? '$_jitterMs ms' : '--'),
                Container(width: 1, height: 36, color: theme.dividerColor),
                _buildStatColumn(theme, 'Loss',
                    _packetLoss > 0 ? '${_packetLoss.toStringAsFixed(2)}%' : '--'),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildResultCard(
    ThemeData theme, {
    required String label,
    required String value,
    required String unit,
    required IconData icon,
    required Color color,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p20),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          gapH8,
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            '$label ($unit)',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(ThemeData theme, String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        gapH4,
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildHistoryTab(ThemeData theme) {
    if (_history.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.history, size: 64, color: theme.colorScheme.onSurface.withValues(alpha: 0.3)),
            gapH16,
            Text(
              'No tests yet.\nRun your first speed test!',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSizes.p20),
      itemCount: _history.length,
      itemBuilder: (context, index) {
        final item = _history[index];
        final timeStr =
            '${item.timestamp.day}/${item.timestamp.month} ${item.timestamp.hour}:${item.timestamp.minute.toString().padLeft(2, '0')}';
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.p12),
          child: GlassCard(
            padding: const EdgeInsets.all(AppSizes.p16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(timeStr,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    Text('WiFi · Cloudflare',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.download, size: 14, color: AppColors.success),
                        gapW4,
                        Text('${item.downloadMbps.toStringAsFixed(1)} Mbps',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.success)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.upload, size: 14, color: Colors.blue),
                        gapW4,
                        Text('${item.uploadMbps.toStringAsFixed(1)} Mbps',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.blue)),
                      ],
                    ),
                    Text('Ping: ${item.pingMs} ms',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(delay: (index * 50).ms).slideX(begin: 0.1),
        );
      },
    );
  }
}

class _TestResult {
  final DateTime timestamp;
  final double downloadMbps;
  final double uploadMbps;
  final int pingMs;
  final int jitterMs;

  const _TestResult({
    required this.timestamp,
    required this.downloadMbps,
    required this.uploadMbps,
    required this.pingMs,
    required this.jitterMs,
  });
}
