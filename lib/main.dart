import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: DeviceInsightApp()));
}

class DeviceInsightApp extends ConsumerWidget {
  const DeviceInsightApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ThemeData lightTheme = AppTheme.lightTheme;
        ThemeData darkTheme = AppTheme.darkTheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightTheme = lightTheme.copyWith(
            colorScheme: lightDynamic.harmonized(),
          );
          darkTheme = darkTheme.copyWith(colorScheme: darkDynamic.harmonized());
        }

        return MaterialApp.router(
          title: 'DeviceInsight',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
