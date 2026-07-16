import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/native/package_service.dart';
import '../../domain/models/app_details.dart';
import '../../domain/models/app_info.dart';

part 'apps_provider.g.dart';

@riverpod
Future<List<AppInfo>> apps(Ref ref) async {
  final packageService = ref.watch(packageServiceProvider);
  final result = await packageService.getInstalledApps();
  return result.map((e) => AppInfo.fromJson(e)).toList();
}

@riverpod
Future<AppDetails> appDetails(Ref ref, String packageName) async {
  final packageService = ref.watch(packageServiceProvider);
  final result = await packageService.getAppDetails(packageName);
  if (result.isNotEmpty) {
    return AppDetails.fromJson(result);
  }
  return const AppDetails();
}

Future<void> uninstallApp(Ref ref, String packageName) async {
  final packageService = ref.read(packageServiceProvider);
  await packageService.uninstallApp(packageName);
}

Future<void> openAndroidAppInfo(Ref ref, String packageName) async {
  final packageService = ref.read(packageServiceProvider);
  await packageService.openAppInfo(packageName);
}
