// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CameraInfo _$CameraInfoFromJson(Map<String, dynamic> json) => _CameraInfo(
  id: json['id'] as String? ?? 'Unknown',
  facing: json['facing'] as String? ?? 'Unknown',
  hardwareLevel: (json['hardwareLevel'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CameraInfoToJson(_CameraInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'facing': instance.facing,
      'hardwareLevel': instance.hardwareLevel,
    };
