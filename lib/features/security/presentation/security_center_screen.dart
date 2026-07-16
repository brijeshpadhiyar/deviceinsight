import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/security_provider.dart';

class SecurityCenterScreen extends ConsumerWidget {
  const SecurityCenterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securityAsync = ref.watch(securityProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Security & Privacy Center'),
        backgroundColor: Colors.transparent,
      ),
      body: securityAsync.when(
        data: (state) {
          int score = 100;
          if (state.isRooted) score -= 50;
          if (state.isDeveloperOptionsEnabled) score -= 10;
          if (state.isUnknownSourcesEnabled) score -= 20;
          if (!state.isDeviceSecure) score -= 40;
          if (!state.isEncrypted) score -= 20;

          score = score.clamp(0, 100);
          final color = score > 80 ? AppColors.success : (score > 50 ? AppColors.warning : AppColors.error);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Score Gauge
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p32),
                  child: Column(
                    children: [
                      Text('Security Score', style: theme.textTheme.titleMedium),
                      gapH16,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: CircularProgressIndicator(
                              value: score / 100,
                              strokeWidth: 12,
                              color: color,
                              backgroundColor: color.withValues(alpha: 0.2),
                            ),
                          ),
                          Text('$score', style: theme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold, color: color)),
                        ],
                      ).animate().scale(),
                      gapH16,
                      Text(score > 80 ? 'Excellent Protection' : (score > 50 ? 'Needs Attention' : 'Critical Risk'), style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: color)),
                    ],
                  ),
                ).animate().fadeIn(),
                gapH24,

                Text('System Security', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)).animate().fadeIn(delay: 200.ms),
                gapH12,
                
                _buildSecurityItem(theme, 'Screen Lock', state.isDeviceSecure, 'Device is secured', 'No screen lock detected'),
                _buildSecurityItem(theme, 'Storage Encryption', state.isEncrypted, 'Data is encrypted', 'Data is unencrypted'),
                _buildSecurityItem(theme, 'Unknown Sources', !state.isUnknownSourcesEnabled, 'Restricted', 'Allowed (High Risk)'),
                _buildSecurityItem(theme, 'Developer Options', !state.isDeveloperOptionsEnabled, 'Disabled', 'Enabled'),
                _buildSecurityItem(theme, 'Root Access', !state.isRooted, 'Not Rooted', 'Root Detected'),
                _buildSecurityItem(theme, 'Biometrics', state.biometricAvailable, 'Available', 'Unavailable'),
                _buildSecurityItem(theme, 'SELinux', state.seLinuxMode.toLowerCase().contains('enforcing'), 'Enforcing', 'Permissive / Unknown'),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildSecurityItem(ThemeData theme, String title, bool isSecure, String secureText, String insecureText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.p12),
      child: GlassCard(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: Row(
          children: [
            Icon(isSecure ? Icons.check_circle : Icons.warning, color: isSecure ? AppColors.success : AppColors.error, size: 28),
            gapW16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  Text(isSecure ? secureText : insecureText, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6))),
                ],
              ),
            ),
          ],
        ),
      ).animate().fadeIn().slideX(begin: 0.1),
    );
  }
}
