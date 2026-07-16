import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_properties.freezed.dart';
part 'device_properties.g.dart';

@freezed
abstract class DeviceProperties with _$DeviceProperties {
  const factory DeviceProperties({
    @Default('Unknown') String board,
    @Default('Unknown') String bootloader,
    @Default('Unknown') String hardware,
    @Default('Unknown') String device,
    @Default('Unknown') String fingerprint,
    @Default('Unknown') String host,
    @Default('Unknown') String tags,
  }) = _DeviceProperties;

  factory DeviceProperties.fromJson(Map<String, dynamic> json) => _$DevicePropertiesFromJson(json);
}
