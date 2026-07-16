import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info.freezed.dart';
part 'app_info.g.dart';

@freezed
abstract class AppInfo with _$AppInfo {
  const factory AppInfo({
    @Default('Unknown') String name,
    @Default('Unknown') String packageName,
    @Default(false) bool isSystemApp,
    @Default('Unknown') String versionName,
    @Default(0) int versionCode,
    @Default('Unknown') String developer,
    @Default(0) int installDate,
    @Default(0) int updateDate,
    @Default(true) bool enabled,
    @Default(false) bool isRunning,
    @Default(0) int targetSdk,
    @Default(0) int minSdk,
    @Default(0) int packageSize,
    @Default(0) int dataSize,
    @Default(0) int cacheSize,
    @Default(0) int codeSize,
    @Default(0) int totalSize,
    @Default('Unknown') String apkPath,
    @Default([]) List<String> nativeLibraries,
    @Default('Unknown') String architecture,
    @Default(0) int uid,
    @Default('Unknown') String installSource,
  }) = _AppInfo;

  factory AppInfo.fromJson(Map<String, dynamic> json) => _$AppInfoFromJson(json);
}
