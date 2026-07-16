import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/battery/presentation/battery_screen.dart';
import '../../features/cpu/presentation/cpu_screen.dart';
import '../../features/network/presentation/network_screen.dart';
import '../../features/speed_test/presentation/speed_test_screen.dart';
import '../../features/storage/presentation/storage_screen.dart';
import '../../features/display/presentation/display_screen.dart';
import '../../features/memory/presentation/memory_screen.dart';
import '../../features/device_care/presentation/device_care_screen.dart';
import '../../features/optimization/presentation/storage_cleaner_screen.dart';
import '../../features/security/presentation/security_center_screen.dart';
import '../../features/diagnostics/presentation/diagnostics_hub_screen.dart';
import '../../features/security/presentation/security_screen.dart';
import '../../features/sensors/presentation/sensors_screen.dart';
import '../../features/camera/presentation/camera_screen.dart';
import '../../features/apps/presentation/apps_screen.dart';
import '../../features/apps/presentation/app_details_screen.dart';
import '../../features/device/presentation/device_screen.dart';
import '../../features/permissions/presentation/permissions_dashboard_screen.dart';
import 'scaffold_with_nav_bar.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDashboardKey = GlobalKey<NavigatorState>(debugLabel: 'dashboardShell');
final _shellNavigatorBatteryKey = GlobalKey<NavigatorState>(debugLabel: 'batteryShell');
final _shellNavigatorCpuKey = GlobalKey<NavigatorState>(debugLabel: 'cpuShell');
final _shellNavigatorSecurityKey = GlobalKey<NavigatorState>(debugLabel: 'securityShell');
final _shellNavigatorMemoryKey = GlobalKey<NavigatorState>(debugLabel: 'memoryShell');
final _shellNavigatorNetworkKey = GlobalKey<NavigatorState>(debugLabel: 'networkShell');
final _shellNavigatorStorageKey = GlobalKey<NavigatorState>(debugLabel: 'storageShell');
final _shellNavigatorDisplayKey = GlobalKey<NavigatorState>(debugLabel: 'displayShell');

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDashboardKey,
            routes: [
              GoRoute(
                path: '/',
                name: 'dashboard',
                builder: (context, state) => const DashboardScreen(),
                routes: [
                  GoRoute(
                    path: 'sensors',
                    name: 'sensors',
                    builder: (context, state) => const SensorsScreen(),
                  ),
                  GoRoute(
                    path: 'camera',
                    name: 'camera',
                    builder: (context, state) => const CameraScreen(),
                  ),
                  GoRoute(
                    path: 'device-care',
                    name: 'device-care',
                    builder: (context, state) => const DeviceCareScreen(),
                  ),
                  GoRoute(
                    path: 'storage-cleaner',
                    name: 'storage-cleaner',
                    builder: (context, state) => const StorageCleanerScreen(),
                  ),
                  GoRoute(
                    path: 'security-center',
                    name: 'security-center',
                    builder: (context, state) => const SecurityCenterScreen(),
                  ),
                  GoRoute(
                    path: 'diagnostics',
                    name: 'diagnostics',
                    builder: (context, state) => const DiagnosticsHubScreen(),
                  ),
                  GoRoute(
                    path: 'apps',
                    name: 'apps',
                    builder: (context, state) => const AppsScreen(),
                    routes: [
                      GoRoute(
                        path: 'details/:packageName',
                        name: 'app-details',
                        builder: (context, state) {
                          final packageName = state.pathParameters['packageName']!;
                          return AppDetailsScreen(packageName: packageName);
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'device',
                    name: 'device',
                    builder: (context, state) => const DeviceScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBatteryKey,
            routes: [
              GoRoute(
                path: '/battery',
                name: 'battery',
                builder: (context, state) => const BatteryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCpuKey,
            routes: [
              GoRoute(
                path: '/cpu',
                name: 'cpu',
                builder: (context, state) => const CpuScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSecurityKey,
            routes: [
              GoRoute(
                path: '/security',
                name: 'security',
                pageBuilder: (context, state) => const NoTransitionPage(child: SecurityScreen()),
                routes: [
                  GoRoute(
                    path: 'permissions',
                    name: 'permissions-dashboard',
                    builder: (context, state) => const PermissionsDashboardScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMemoryKey,
            routes: [
              GoRoute(
                path: '/memory',
                name: 'memory',
                builder: (context, state) => const MemoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorNetworkKey,
            routes: [
              GoRoute(
                path: '/network',
                name: 'network',
                builder: (context, state) => const NetworkScreen(),
                routes: [
                  GoRoute(
                    path: 'speed-test',
                    name: 'speed-test',
                    builder: (context, state) => const SpeedTestScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorStorageKey,
            routes: [
              GoRoute(
                path: '/storage',
                name: 'storage',
                builder: (context, state) => const StorageScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDisplayKey,
            routes: [
              GoRoute(
                path: '/display',
                name: 'display',
                builder: (context, state) => const DisplayScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
