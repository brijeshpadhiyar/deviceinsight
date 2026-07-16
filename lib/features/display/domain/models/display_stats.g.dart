// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DisplayStats _$DisplayStatsFromJson(Map<String, dynamic> json) =>
    _DisplayStats(
      widthPixels: (json['widthPixels'] as num?)?.toInt() ?? 1080,
      heightPixels: (json['heightPixels'] as num?)?.toInt() ?? 1920,
      refreshRate: (json['refreshRate'] as num?)?.toDouble() ?? 60.0,
      densityDpi: (json['densityDpi'] as num?)?.toInt() ?? 420,
      isHdr: json['isHdr'] as bool? ?? false,
    );

Map<String, dynamic> _$DisplayStatsToJson(_DisplayStats instance) =>
    <String, dynamic>{
      'widthPixels': instance.widthPixels,
      'heightPixels': instance.heightPixels,
      'refreshRate': instance.refreshRate,
      'densityDpi': instance.densityDpi,
      'isHdr': instance.isHdr,
    };
