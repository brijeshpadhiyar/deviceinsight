import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_info.freezed.dart';
part 'sensor_info.g.dart';

@freezed
abstract class SensorInfo with _$SensorInfo {
  const factory SensorInfo({
    @Default('Unknown') String name,
    @Default('Unknown') String vendor,
    @Default(0) int version,
    @Default(0.0) double power,
    @Default(0.0) double resolution,
    @Default(0.0) double maximumRange,
  }) = _SensorInfo;

  factory SensorInfo.fromJson(Map<String, dynamic> json) => _$SensorInfoFromJson(json);
}
