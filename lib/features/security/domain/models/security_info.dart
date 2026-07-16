import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_info.freezed.dart';
part 'security_info.g.dart';

@freezed
abstract class SecurityInfo with _$SecurityInfo {
  const factory SecurityInfo({
    @Default(false) bool isRooted,
    @Default(false) bool isAdbEnabled,
    @Default(false) bool isDeveloperOptionsEnabled,
    @Default(false) bool isEncrypted,
    @Default(false) bool isUnknownSourcesEnabled,
    @Default(false) bool isDeviceSecure,
    @Default(false) bool biometricAvailable,
    @Default('Unknown') String seLinuxMode,
  }) = _SecurityInfo;

  factory SecurityInfo.fromJson(Map<String, dynamic> json) => _$SecurityInfoFromJson(json);
}
