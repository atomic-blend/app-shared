// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ABConfigImpl _$$ABConfigImplFromJson(Map<String, dynamic> json) =>
    _$ABConfigImpl(
      domains:
          (json['domains'] as List<dynamic>).map((e) => e as String).toList(),
      remainingSpots: (json['remainingSpots'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ABConfigImplToJson(_$ABConfigImpl instance) =>
    <String, dynamic>{
      'domains': instance.domains,
      'remainingSpots': instance.remainingSpots,
    };
