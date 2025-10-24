// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ephemeral_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EphemeralKeyImpl _$$EphemeralKeyImplFromJson(Map<String, dynamic> json) =>
    _$EphemeralKeyImpl(
      expires: (json['expires'] as num).toInt(),
      id: json['id'] as String,
      secret: json['secret'] as String,
    );

Map<String, dynamic> _$$EphemeralKeyImplToJson(_$EphemeralKeyImpl instance) =>
    <String, dynamic>{
      'expires': instance.expires,
      'id': instance.id,
      'secret': instance.secret,
    };
