import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/security_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class SecurityScreen extends ConsumerWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securityAsync = ref.watch(securityProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Security & Root'),
      ),
      body: securityAsync.when(
        data: (security) {
          final isAtRisk = security.isRooted || security.isAdbEnabled;

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
                _buildMainStatus(isAtRisk, theme),
                gapH32,
                Text('Security Parameters', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 100.ms),
                gapH16,
                _buildDetailsGrid(security, theme),
                gapH32,
                const EducationalCard(
                  title: 'Rooting & ADB',
                  icon: Icons.shield_outlined,
                  content: 'Rooting your device gives you superuser access but completely disables Android\'s built-in sandbox security. ADB (Android Debug Bridge) allows a connected PC to execute commands on your phone.',
                  optimizationTips: [
                    'Never leave ADB enabled in public spaces or while connected to public charging ports.',
                    'Banking and Enterprise apps will refuse to run on Rooted devices due to memory injection risks.',
                  ],
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildMainStatus(bool isAtRisk, ThemeData theme) {
    final color = isAtRisk ? AppColors.error : AppColors.healthExcellent;

    return GlassCard(
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p48),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 32,
                )
              ]
            ),
            child: Icon(
              isAtRisk ? Icons.gpp_bad_outlined : Icons.gpp_good_outlined,
              size: 80,
              color: color,
            ).animate(onPlay: (c) => isAtRisk ? c.repeat(reverse: true) : null)
             .scale(begin: const Offset(1,1), end: const Offset(1.1,1.1), duration: 1.seconds),
          ),
          gapH24,
          Text(
            isAtRisk ? 'Security Risk Detected' : 'Device is Secure',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: color,
              letterSpacing: -0.5,
            ),
          ),
          if (isAtRisk) ...[
            gapH8,
            Text(
              'Your device is vulnerable. Please review the parameters below.',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7)),
              textAlign: TextAlign.center,
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildDetailsGrid(dynamic security, ThemeData theme) {
    final details = [
      {'title': 'Root Access', 'value': security.isRooted ? 'Rooted' : 'Not Rooted', 'icon': Icons.admin_panel_settings_outlined, 'isSafe': !security.isRooted},
      {'title': 'USB Debugging', 'value': security.isAdbEnabled ? 'Enabled' : 'Disabled', 'icon': Icons.usb_outlined, 'isSafe': !security.isAdbEnabled},
      {'title': 'Dev Options', 'value': security.isDeveloperOptionsEnabled ? 'Enabled' : 'Disabled', 'icon': Icons.developer_mode, 'isSafe': !security.isDeveloperOptionsEnabled},
      {'title': 'Encryption', 'value': security.isEncrypted ? 'Encrypted' : 'Not Encrypted', 'icon': Icons.lock_outline, 'isSafe': security.isEncrypted},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.p16,
        mainAxisSpacing: AppSizes.p16,
        childAspectRatio: 1.2, // Taller cards
      ),
      itemBuilder: (context, index) {
        final item = details[index];
        final bool isSafe = item['isSafe'] as bool;
        final color = isSafe ? AppColors.healthExcellent : AppColors.error;

        return GlassCard(
          animateOnEntry: true,
          padding: const EdgeInsets.all(AppSizes.p20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(item['icon'] as IconData, color: color, size: 28),
              ),
              const Spacer(),
              Text(
                item['title'] as String,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w600,
                ),
              ),
              gapH4,
              Text(
                item['value'] as String,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: color,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (200 + index * 100).ms).slideY(begin: 0.1);
      },
    );
  }
}
