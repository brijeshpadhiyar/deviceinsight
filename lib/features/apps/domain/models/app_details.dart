import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_details.freezed.dart';
part 'app_details.g.dart';

@freezed
abstract class AppDetails with _$AppDetails {
  const factory AppDetails({
    @Default('Unknown') String name,
    @Default('Unknown') String packageName,
    @Default('Unknown') String versionName,
    @Default(0) int versionCode,
    @Default(false) bool isSystemApp,
    @Default(0) int installDate,
    @Default(0) int updateDate,
    @Default('Unknown') String developer,
    @Default('') String apkPath,
    @Default('') String dataDir,
    @Default(0) int targetSdk,
    @Default(0) int minSdk,
    @Default(0) int uid,
    @Default('Unknown') String installSource,
    @Default([]) List<String> permissions,
    @Default([]) List<String> requestedPermissions,
    @Default([]) List<String> grantedPermissions,
    @Default([]) List<String> activities,
    @Default([]) List<String> services,
    @Default([]) List<String> receivers,
    @Default([]) List<String> providers,
    @Default(0) int cacheSize,
    @Default(0) int dataSize,
    @Default(0) int codeSize,
    @Default(0) int totalSize,
    @Default('Unknown') String sharedUserId,
    @Default(false) bool batteryOptimizationEnabled,
    String? error,
  }) = _AppDetails;

  factory AppDetails.fromJson(Map<String, dynamic> json) => _$AppDetailsFromJson(json);
}
