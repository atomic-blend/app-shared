import 'package:ab_shared/entities/subscribe_response/ephemeral_key/ephemeral_key.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  const factory Customer({
    required String id,
    required EphemeralKey ephemeralKey,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
