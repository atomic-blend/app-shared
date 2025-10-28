// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['id'] as String,
      ephemeralKey: EphemeralKey.fromJson(
        json['ephemeralKey'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{'id': instance.id, 'ephemeralKey': instance.ephemeralKey};
