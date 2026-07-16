import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_info.freezed.dart';
part 'camera_info.g.dart';

@freezed
abstract class CameraInfo with _$CameraInfo {
  const factory CameraInfo({
    @Default('Unknown') String id,
    @Default('Unknown') String facing,
    @Default(0) int hardwareLevel,
  }) = _CameraInfo;

  factory CameraInfo.fromJson(Map<String, dynamic> json) => _$CameraInfoFromJson(json);
}
