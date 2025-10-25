import 'package:ab_shared/entities/encryption/encryption_key.dart';
import 'package:ab_shared/entities/purchase/purchase.dart';
import 'package:ab_shared/entities/user_device/user_device.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.entity.freezed.dart';
part 'user.entity.g.dart';
// ignore_for_file: non_constant_identifier_names

@unfreezed
class UserEntity with _$UserEntity {
  const UserEntity._();
  factory UserEntity({
    String? id,
    String? firebase_id,
    required String? email,
    required List<dynamic> roles,
    String? firstName,
    String? lastName,
    String? stripeCustomerId,
    String? stripeSubscriptionId,
    String? subscriptionStatus,
    required EncryptionKeyEntity keySet,
    List<UserDeviceEntity>? devices,
    List<Purchase>? purchases,
    String? accessToken,
    String? refreshToken,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserEntity;

  @override
  String toString() {
    return 'UserEntity { id: $id, roles: $roles, firebase_id: $firebase_id, email: $email, stripeCustomerId: $stripeCustomerId, stripeSubscriptionId: $stripeSubscriptionId, subscriptionStatus: $subscriptionStatus, firstName: $firstName, lastName: $lastName, purchases: $purchases, devices: $devices, createdAt: $createdAt, updatedAt: $updatedAt }';
  }

  String? displayName() {
    if (firstName == null && lastName == null) {
      return email;
    }
    return '${firstName ?? ''} ${lastName ?? ''}';
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
