// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscribeResponseImpl _$$SubscribeResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SubscribeResponseImpl(
  customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
  pendingSetupIntent: PendingSetupIntent.fromJson(
    json['pendingSetupIntent'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$SubscribeResponseImplToJson(
  _$SubscribeResponseImpl instance,
) => <String, dynamic>{
  'customer': instance.customer,
  'pendingSetupIntent': instance.pendingSetupIntent,
};
