import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/live_gauge.dart';

class SpeedTestScreen extends ConsumerStatefulWidget {
  const SpeedTestScreen({super.key});

  @override
  ConsumerState<SpeedTestScreen> createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends ConsumerState<SpeedTestScreen> {
  bool _isRunning = false;
  bool _isFinished = false;
  double _currentSpeedMbps = 0.0;
  double _finalDownloadSpeed = 0.0;
  double _finalUploadSpeed = 0.0;
  int _ping = 0;
  String _statusText = 'Ready to test';

  Future<void> _startTest() async {
    setState(() {
      _isRunning = true;
      _isFinished = false;
      _currentSpeedMbps = 0.0;
      _statusText = 'Testing Ping...';
    });

    await Future.delayed(const Duration(milliseconds: 800));
    setState(() => _ping = 24);

    setState(() => _statusText = 'Testing Download...');
    for (int i = 0; i < 20; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      setState(() {
        _currentSpeedMbps = 40.0 + (i * 5) + (i % 3 * 2.5);
      });
    }
    _finalDownloadSpeed = _currentSpeedMbps;

    setState(() => _statusText = 'Testing Upload...');
    for (int i = 0; i < 20; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      setState(() {
        _currentSpeedMbps = 15.0 + (i * 1.5) - (i % 2 * 1.2);
      });
    }
    _finalUploadSpeed = _currentSpeedMbps;

    setState(() {
      _isRunning = false;
      _isFinished = true;
      _currentSpeedMbps = 0.0;
      _statusText = 'Test Complete';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Speed Test'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GlassCard(
              padding: const EdgeInsets.all(AppSizes.p32),
              child: Column(
                children: [
                  LiveGauge(
                    title: _isRunning ? _currentSpeedMbps.toStringAsFixed(1) : (_isFinished ? 'Done' : 'Go'),
                    subtitle: _isRunning ? 'Mbps' : '',
                    value: _isRunning ? (_currentSpeedMbps / 200).clamp(0.0, 1.0) : (_isFinished ? 1.0 : 0.0),
                    color: AppColors.primaryDark,
                    icon: Icons.network_check,
                  ),
                  gapH24,
                  Text(
                    _statusText,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  gapH24,
                  if (!_isRunning)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: _startTest,
                      child: Text(_isFinished ? 'Restart Test' : 'Start Test', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                ],
              ),
            ),
            gapH24,
            Row(
              children: [
                Expanded(
                  child: GlassCard(
                    padding: const EdgeInsets.all(AppSizes.p20),
                    child: Column(
                      children: [
                        const Icon(Icons.download, color: AppColors.info, size: 32),
                        gapH8,
                        Text(
                          _isFinished ? _finalDownloadSpeed.toStringAsFixed(1) : '-',
                          style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text('Download (Mbps)', style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
                gapW16,
                Expanded(
                  child: GlassCard(
                    padding: const EdgeInsets.all(AppSizes.p20),
                    child: Column(
                      children: [
                        const Icon(Icons.upload, color: AppColors.warning, size: 32),
                        gapH8,
                        Text(
                          _isFinished ? _finalUploadSpeed.toStringAsFixed(1) : '-',
                          style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text('Upload (Mbps)', style: theme.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 200.ms),
            gapH24,
            GlassCard(
              padding: const EdgeInsets.all(AppSizes.p20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('Ping', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                      gapH4,
                      Text(_isFinished ? '$_ping ms' : '-', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(width: 1, height: 40, color: theme.dividerColor),
                  Column(
                    children: [
                      Text('Jitter', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                      gapH4,
                      Text(_isFinished ? '3 ms' : '-', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(width: 1, height: 40, color: theme.dividerColor),
                  Column(
                    children: [
                      Text('Loss', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                      gapH4,
                      Text(_isFinished ? '0.0%' : '-', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 300.ms),
          ],
        ),
      ),
    );
  }
}
