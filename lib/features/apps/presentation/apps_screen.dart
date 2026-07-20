import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import 'providers/app_icon_provider.dart';
import 'providers/apps_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

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

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('App Manager'),
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
              SizedBox(height: 90), // Offset for transparent GlassAppBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.p20),
                child: TextField(
                  onChanged: (val) {
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 300), () {
                      if (mounted) setState(() => _searchQuery = val);
                    });
                  },
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    hintText: 'Search apps...',
                    hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                    prefixIcon: Icon(Icons.search, color: theme.colorScheme.primary),
                    filled: true,
                    fillColor: theme.colorScheme.surface.withValues(alpha: 0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
                      borderSide: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
                      borderSide: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
                      borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                    ),
                  ),
                ),
              ).animate().fadeIn(),
              gapH16,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.p20),
                child: Row(
                  children: [
                    _buildFilterChip(theme, 'All', AppFilter.all),
                    gapW8,
                    _buildFilterChip(theme, 'User Apps', AppFilter.user),
                    gapW8,
                    _buildFilterChip(theme, 'System Apps', AppFilter.system),
                    gapW16,
                    Container(width: 1, height: 24, color: theme.dividerColor.withValues(alpha: 0.3)),
                    gapW16,
                    _buildSortChip(theme, 'Name', AppSort.name),
                    gapW8,
                    _buildSortChip(theme, 'Newest', AppSort.installDate),
                  ],
                ),
              ).animate().fadeIn(delay: 100.ms),
              gapH16,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => ref.refresh(appsProvider.future),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      left: AppSizes.p20,
                      right: AppSizes.p20,
                      bottom: 120, // Accommodate floating nav bar
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final app = filtered[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSizes.p12),
                        child: GlassCard(
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
                                  final iconAsync = ref.watch(appIconProvider(app.packageName));
                                  return Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: app.isSystemApp ? Colors.green.withValues(alpha: 0.15) : theme.colorScheme.primary.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: iconAsync.when(
                                      data: (bytes) => bytes != null 
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.circular(16),
                                              child: Image.memory(bytes, fit: BoxFit.cover),
                                            )
                                          : Icon(app.isSystemApp ? Icons.android : Icons.person, color: app.isSystemApp ? Colors.green : theme.colorScheme.primary),
                                      loading: () => const Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator(strokeWidth: 2)),
                                      error: (_, __) => Icon(app.isSystemApp ? Icons.android : Icons.person, color: app.isSystemApp ? Colors.green : theme.colorScheme.primary),
                                    ),
                                  );
                                },
                              ),
                              gapW20,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      app.name,
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    gapH4,
                                    Text(
                                      app.packageName,
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(delay: (30 * (index % 10)).ms).slideX(begin: 0.1),
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

  Widget _buildFilterChip(ThemeData theme, String label, AppFilter value) {
    final isSelected = _filter == value;
    return ChoiceChip(
      label: Text(label, style: TextStyle(fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600)),
      selected: isSelected,
      onSelected: (val) {
        if (val) setState(() => _filter = value);
      },
      selectedColor: theme.colorScheme.primary.withValues(alpha: 0.2),
      backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          width: 1.5,
        )
      ),
    );
  }

  Widget _buildSortChip(ThemeData theme, String label, AppSort value) {
    final isSelected = _sort == value;
    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.sort, size: 16, color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface), 
          gapW6, 
          Text(label, style: TextStyle(fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600))
        ],
      ),
      selected: isSelected,
      onSelected: (val) {
        if (val) setState(() => _sort = value);
      },
      selectedColor: theme.colorScheme.primary.withValues(alpha: 0.2),
      backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          width: 1.5,
        )
      ),
    );
  }
}
