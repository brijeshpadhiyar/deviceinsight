import 'package:freezed_annotation/freezed_annotation.dart';

part 'display_stats.freezed.dart';
part 'display_stats.g.dart';

@freezed
abstract class DisplayStats with _$DisplayStats {
  const factory DisplayStats({
    @Default(1080) int widthPixels,
    @Default(1920) int heightPixels,
    @Default(60.0) double refreshRate,
    @Default(420) int densityDpi,
    @Default(false) bool isHdr,
  }) = _DisplayStats;

  factory DisplayStats.fromJson(Map<String, dynamic> json) => _$DisplayStatsFromJson(json);
}
