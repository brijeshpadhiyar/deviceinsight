import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/app_icon_provider.dart';
import 'providers/apps_provider.dart';

enum AppFilter { all, user, system }

enum AppSort { name, installDate }

class AppsScreen extends ConsumerStatefulWidget {
  const AppsScreen({super.key});

  @override
  ConsumerState<AppsScreen> createState() => _AppsScreenState();
}

class _AppsScreenState extends ConsumerState<AppsScreen>
    with WidgetsBindingObserver {
  String _searchQuery = '';
  AppFilter _filter = AppFilter.all;
  AppSort _sort = AppSort.name;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.invalidate(appsProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appsAsync = ref.watch(appsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Manager'),
        backgroundColor: Colors.transparent,
      ),
      body: appsAsync.when(
        data: (apps) {
          // Apply Search
          var filtered = apps.where((app) {
            return app.name.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ) ||
                app.packageName.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                );
          }).toList();

          // Apply Filter
          if (_filter == AppFilter.user) {
            filtered = filtered.where((a) => !a.isSystemApp).toList();
          } else if (_filter == AppFilter.system) {
            filtered = filtered.where((a) => a.isSystemApp).toList();
          }

          // Apply Sort
          filtered.sort((a, b) {
            if (_sort == AppSort.name) {
              return a.name.compareTo(b.name);
            } else {
              return b.installDate.compareTo(a.installDate);
            }
          });

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.p20),
                child: TextField(
                  onChanged: (val) {
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 300), () {
                      if (mounted) setState(() => _searchQuery = val);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search apps...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: theme.colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppSizes.radiusMedium,
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ).animate().fadeIn(),
              gapH12,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.p20),
                child: Row(
                  children: [
                    _buildFilterChip('All', AppFilter.all),
                    gapW8,
                    _buildFilterChip('User Apps', AppFilter.user),
                    gapW8,
                    _buildFilterChip('System Apps', AppFilter.system),
                    gapW16,
                    Container(width: 1, height: 24, color: theme.dividerColor),
                    gapW16,
                    _buildSortChip('Name', AppSort.name),
                    gapW8,
                    _buildSortChip('Newest', AppSort.installDate),
                  ],
                ),
              ).animate().fadeIn(delay: 100.ms),
              gapH16,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => ref.refresh(appsProvider.future),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.p20,
                      vertical: AppSizes.p8,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final app = filtered[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSizes.p12),
                        child:
                            GlassCard(
                                  onTap: () => context.goNamed(
                                    'app-details',
                                    pathParameters: {
                                      'packageName': app.packageName,
                                    },
                                  ),
                                  padding: const EdgeInsets.all(AppSizes.p16),
                                  child: Row(
                                    children: [
                                      Consumer(
                                        builder: (context, ref, _) {
                                          final iconAsync = ref.watch(
                                            appIconProvider(app.packageName),
                                          );
                                          return CircleAvatar(
                                            backgroundColor: app.isSystemApp
                                                ? Colors.green.withValues(
                                                    alpha: 0.2,
                                                  )
                                                : Colors.blue.withValues(
                                                    alpha: 0.2,
                                                  ),
                                            backgroundImage: iconAsync
                                                .whenOrNull(
                                                  data: (bytes) => bytes != null
                                                      ? MemoryImage(bytes)
                                                      : null,
                                                ),
                                            child:
                                                iconAsync.whenOrNull(
                                                  data: (bytes) => bytes == null
                                                      ? Icon(
                                                          app.isSystemApp
                                                              ? Icons.android
                                                              : Icons.person,
                                                          color: app.isSystemApp
                                                              ? Colors.green
                                                              : Colors.blue,
                                                        )
                                                      : null,
                                                ) ??
                                                Icon(
                                                  app.isSystemApp
                                                      ? Icons.android
                                                      : Icons.person,
                                                  color: app.isSystemApp
                                                      ? Colors.green
                                                      : Colors.blue,
                                                ),
                                          );
                                        },
                                      ),
                                      gapW16,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              app.name,
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              app.packageName,
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                    color: theme
                                                        .colorScheme
                                                        .onSurface
                                                        .withValues(alpha: 0.6),
                                                  ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: theme.colorScheme.onSurface
                                            .withValues(alpha: 0.4),
                                      ),
                                    ],
                                  ),
                                )
                                .animate()
                                .fadeIn(delay: (50 * (index % 10)).ms)
                                .slideX(begin: 0.1),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildFilterChip(String label, AppFilter value) {
    final isSelected = _filter == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (val) {
        if (val) setState(() => _filter = value);
      },
    );
  }

  Widget _buildSortChip(String label, AppSort value) {
    final isSelected = _sort == value;
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.sort, size: 16), gapW4, Text(label)],
      ),
      selected: isSelected,
      onSelected: (val) {
        if (val) setState(() => _sort = value);
      },
    );
  }
}
