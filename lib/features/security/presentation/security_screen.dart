import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/security_provider.dart';

class SecurityScreen extends ConsumerWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securityAsync = ref.watch(securityProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Security & Root'),
        backgroundColor: Colors.transparent,
      ),
      body: securityAsync.when(
        data: (security) {
          final isAtRisk = security.isRooted || security.isAdbEnabled;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMainStatus(isAtRisk, theme),
                gapH24,
                _buildDetailsGrid(security, theme),
                gapH24,
                const EducationalCard(
                  title: 'Rooting & ADB',
                  icon: Icons.security,
                  content: 'Rooting your device gives you superuser access but completely disables Android\'s built-in sandbox security. ADB (Android Debug Bridge) allows a connected PC to execute commands on your phone.',
                  optimizationTips: [
                    'Never leave ADB enabled in public spaces or while connected to public charging ports.',
                    'Banking and Enterprise apps will refuse to run on Rooted devices due to memory injection risks.',
                  ],
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
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
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Column(
        children: [
          Icon(
            isAtRisk ? Icons.gpp_bad : Icons.gpp_good,
            size: 80,
            color: isAtRisk ? AppColors.error : AppColors.healthExcellent,
          ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
          gapH16,
          Text(
            isAtRisk ? 'Security Risk Detected' : 'Device is Secure',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isAtRisk ? AppColors.error : AppColors.healthExcellent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsGrid(dynamic security, ThemeData theme) {
    final details = [
      {'title': 'Root Access', 'value': security.isRooted ? 'Rooted' : 'Not Rooted', 'icon': Icons.adb, 'isSafe': !security.isRooted},
      {'title': 'USB Debugging', 'value': security.isAdbEnabled ? 'Enabled' : 'Disabled', 'icon': Icons.usb, 'isSafe': !security.isAdbEnabled},
      {'title': 'Dev Options', 'value': security.isDeveloperOptionsEnabled ? 'Enabled' : 'Disabled', 'icon': Icons.developer_mode, 'isSafe': !security.isDeveloperOptionsEnabled},
      {'title': 'Encryption', 'value': security.isEncrypted ? 'Encrypted' : 'Not Encrypted', 'icon': Icons.lock, 'isSafe': security.isEncrypted},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.p16,
        mainAxisSpacing: AppSizes.p16,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final item = details[index];
        final bool isSafe = item['isSafe'] as bool;
        final color = isSafe ? AppColors.healthExcellent : AppColors.warning;

        return GlassCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item['icon'] as IconData, color: color),
              gapH8,
              Text(
                item['title'] as String,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              gapH4,
              Text(
                item['value'] as String,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
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
