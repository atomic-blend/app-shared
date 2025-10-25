// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String?,
      firebase_id: json['firebase_id'] as String?,
      email: json['email'] as String?,
      roles: json['roles'] as List<dynamic>,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      stripeCustomerId: json['stripeCustomerId'] as String?,
      stripeSubscriptionId: json['stripeSubscriptionId'] as String?,
      subscriptionStatus: json['subscriptionStatus'] as String?,
      keySet: EncryptionKeyEntity.fromJson(
        json['keySet'] as Map<String, dynamic>,
      ),
      devices:
          (json['devices'] as List<dynamic>?)
              ?.map((e) => UserDeviceEntity.fromJson(e as Map<String, dynamic>))
              .toList(),
      purchases:
          (json['purchases'] as List<dynamic>?)
              ?.map((e) => Purchase.fromJson(e as Map<String, dynamic>))
              .toList(),
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firebase_id': instance.firebase_id,
      'email': instance.email,
      'roles': instance.roles,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'stripeCustomerId': instance.stripeCustomerId,
      'stripeSubscriptionId': instance.stripeSubscriptionId,
      'subscriptionStatus': instance.subscriptionStatus,
      'keySet': instance.keySet,
      'devices': instance.devices,
      'purchases': instance.purchases,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
