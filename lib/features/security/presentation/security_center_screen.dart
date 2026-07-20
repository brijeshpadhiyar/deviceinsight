import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/security_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class SecurityCenterScreen extends ConsumerWidget {
  const SecurityCenterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securityAsync = ref.watch(securityProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Security & Privacy Center'),
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
                // Score Gauge
                GlassCard(
                  animateOnEntry: true,
                  padding: const EdgeInsets.all(AppSizes.p48),
                  child: Column(
                    children: [
                      Text('Security Score', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                      gapH32,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: CircularProgressIndicator(
                              value: score / 100,
                              strokeWidth: 20,
                              strokeCap: StrokeCap.round,
                              color: color,
                              backgroundColor: color.withValues(alpha: 0.15),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('$score', style: theme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w900, color: color, letterSpacing: -2)),
                              Text('Out of 100', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.5))),
                            ],
                          ),
                        ],
                      ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
                      gapH32,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          score > 80 ? 'Excellent Protection' : (score > 50 ? 'Needs Attention' : 'Critical Risk'), 
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900, color: color)
                        ),
                      ),
                    ],
                  ),
                ),
                gapH32,

                Text('System Security', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 200.ms),
                gapH16,
                
                _buildSecurityItem(theme, 'Screen Lock', state.isDeviceSecure, 'Device is secured', 'No screen lock detected', 300),
                _buildSecurityItem(theme, 'Storage Encryption', state.isEncrypted, 'Data is encrypted', 'Data is unencrypted', 400),
                _buildSecurityItem(theme, 'Unknown Sources', !state.isUnknownSourcesEnabled, 'Restricted', 'Allowed (High Risk)', 500),
                _buildSecurityItem(theme, 'Developer Options', !state.isDeveloperOptionsEnabled, 'Disabled', 'Enabled', 600),
                _buildSecurityItem(theme, 'Root Access', !state.isRooted, 'Not Rooted', 'Root Detected', 700),
                _buildSecurityItem(theme, 'Biometrics', state.biometricAvailable, 'Available', 'Unavailable', 800),
                _buildSecurityItem(theme, 'SELinux', state.seLinuxMode.toLowerCase().contains('enforcing'), 'Enforcing', 'Permissive / Unknown', 900),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildSecurityItem(ThemeData theme, String title, bool isSecure, String secureText, String insecureText, int delay) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.p16),
      child: GlassCard(
        animateOnEntry: true,
        padding: const EdgeInsets.all(AppSizes.p20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (isSecure ? AppColors.success : AppColors.error).withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(isSecure ? Icons.shield_outlined : Icons.gpp_bad_outlined, color: isSecure ? AppColors.success : AppColors.error, size: 28),
            ),
            gapW20,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                  gapH4,
                  Text(isSecure ? secureText : insecureText, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7))),
                ],
              ),
            ),
          ],
        ),
      ).animate().fadeIn(delay: delay.ms).slideX(begin: 0.1),
    );
  }
}
