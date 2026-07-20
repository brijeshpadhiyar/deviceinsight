import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/native/package_service.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../permissions/presentation/providers/permissions_provider.dart';
import '../../shared/widgets/educational_card.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/app_icon_provider.dart';
import 'providers/apps_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';


class AppDetailsScreen extends ConsumerWidget {
  final String packageName;
  const AppDetailsScreen({super.key, required this.packageName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(appDetailsProvider(packageName));
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: GlassAppBar(
        title: const Text('App Details'),
        
      ),
      body: detailsAsync.when(
        data: (details) {
          if (details.error != null) {
            return Center(child: Text('Error analyzing app: ${details.error}'));
          }

          final sizeMb =
              (details.codeSize + details.dataSize + details.cacheSize) /
              (1024 * 1024);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p24),
                  child: Column(
                    children: [
                      Consumer(
                        builder: (context, ref, _) {
                          final iconAsync = ref.watch(
                            appIconProvider(packageName),
                          );
                          return CircleAvatar(
                            radius: 40,
                            backgroundColor: details.isSystemApp
                                ? Colors.green.withValues(alpha: 0.2)
                                : Colors.blue.withValues(alpha: 0.2),
                            backgroundImage: iconAsync.whenOrNull(
                              data: (bytes) =>
                                  bytes != null ? MemoryImage(bytes) : null,
                            ),
                            child:
                                iconAsync.whenOrNull(
                                  data: (bytes) => bytes == null
                                      ? Icon(
                                          details.isSystemApp
                                              ? Icons.android
                                              : Icons.person,
                                          color: details.isSystemApp
                                              ? Colors.green
                                              : Colors.blue,
                                          size: 40,
                                        )
                                      : null,
                                ) ??
                                Icon(
                                  details.isSystemApp
                                      ? Icons.android
                                      : Icons.person,
                                  color: details.isSystemApp
                                      ? Colors.green
                                      : Colors.blue,
                                  size: 40,
                                ),
                          ).animate().scale(
                            duration: 400.ms,
                            curve: Curves.easeOutBack,
                          );
                        },
                      ),
                      gapH16,
                      Text(
                        details.name,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        details.packageName,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                      ),
                      gapH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Chip(label: Text('v${details.versionName}')),
                          gapW8,
                          Chip(label: Text('${sizeMb.toStringAsFixed(1)} MB')),
                        ],
                      ),
                    ],
                  ),
                ).animate().fadeIn(),
                gapH24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      context,
                      'Launch',
                      Icons.launch,
                      Colors.blue,
                      () async {
                        try {
                          await ref
                              .read(packageServiceProvider)
                              .launchApp(packageName);
                        } catch (e) {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'No launcher activity found for this application.',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    _buildActionButton(
                      context,
                      'App Info',
                      Icons.info_outline,
                      Colors.orange,
                      () {
                        ref
                            .read(packageServiceProvider)
                            .openAppInfo(packageName);
                      },
                    ),
                    _buildActionButton(
                      context,
                      'Uninstall',
                      Icons.delete_outline,
                      AppColors.error,
                      () {
                        ref
                            .read(packageServiceProvider)
                            .uninstallApp(packageName);
                      },
                    ),
                  ],
                ).animate().fadeIn(delay: 100.ms),
                gapH24,
                Text(
                  'Storage Usage',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(delay: 200.ms),
                gapH12,
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p16),
                  child: Consumer(
                    builder: (context, ref, _) {
                      final permState = ref.watch(permissionsStateProvider);
                      final hasUsageStats =
                          permState.value?.hasUsageStats ?? false;

                      if (!hasUsageStats) {
                        return Column(
                          children: [
                            const Icon(
                              Icons.lock_outline,
                              size: 48,
                              color: AppColors.warning,
                            ),
                            gapH16,
                            Text(
                              'Storage Analytics Unavailable',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            gapH8,
                            Text(
                              'Android restricts access to application storage information without Usage Access permission.\n\nGrant Usage Access to view cache size, application storage, and storage analytics.',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                            ),
                            gapH16,
                            FilledButton.icon(
                              onPressed: () => ref
                                  .read(permissionsStateProvider.notifier)
                                  .requestUsageStats(),
                              icon: const Icon(Icons.settings),
                              label: const Text('Grant Permission'),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          _buildStorageRow(
                            theme,
                            'App Code',
                            details.codeSize,
                            Colors.blue,
                          ),
                          const Divider(),
                          _buildStorageRow(
                            theme,
                            'User Data',
                            details.dataSize,
                            Colors.purple,
                          ),
                          const Divider(),
                          _buildStorageRow(
                            theme,
                            'Cache Size',
                            details.cacheSize,
                            Colors.orange,
                          ),
                        ],
                      );
                    },
                  ),
                ).animate().fadeIn(delay: 300.ms),
                gapH24,
                Text(
                  'Permissions Analyzed (${details.permissions.length})',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(delay: 400.ms),
                gapH12,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: details.permissions.take(10).length,
                  itemBuilder: (context, index) {
                    final perm = details.permissions[index].split('.').last;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shield,
                            size: 16,
                            color:
                                perm.contains('INTERNET') ||
                                    perm.contains('LOCATION') ||
                                    perm.contains('CAMERA')
                                ? AppColors.warning
                                : AppColors.success,
                          ),
                          gapW12,
                          Expanded(
                            child: Text(
                              perm,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).animate().fadeIn(delay: 500.ms),
                if (details.permissions.length > 10)
                  Text(
                    '+ ${details.permissions.length - 10} more permissions',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                gapH24,
                const EducationalCard(
                  title: 'Cache Management',
                  icon: Icons.cleaning_services,
                  content:
                      'Android 11+ restricts third-party applications from clearing another application\'s cache automatically. To free up space, use the "App Info" button above and clear the cache manually.',
                  optimizationTips: [],
                ).animate().fadeIn(delay: 600.ms),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          gapH8,
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStorageRow(
    ThemeData theme,
    String label,
    int bytes,
    Color color,
  ) {
    final mb = bytes / (1024 * 1024);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            gapW12,
            Text(label, style: theme.textTheme.bodyMedium),
          ],
        ),
        Text(
          '${mb.toStringAsFixed(2)} MB',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
