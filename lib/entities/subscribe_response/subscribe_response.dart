import 'package:ab_shared/entities/subscribe_response/customer/customer.dart';
import 'package:ab_shared/entities/subscribe_response/pending_setup_intent/pending_setup_intent.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscribe_response.freezed.dart';
part 'subscribe_response.g.dart';

@freezed
class SubscribeResponse with _$SubscribeResponse {
  const factory SubscribeResponse({
    required Customer customer,
    required PendingSetupIntent pendingSetupIntent,
  }) = _SubscribeResponse;

  factory SubscribeResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscribeResponseFromJson(json);
}
