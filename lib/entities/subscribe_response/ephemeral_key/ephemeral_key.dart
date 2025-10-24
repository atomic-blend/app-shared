import 'package:freezed_annotation/freezed_annotation.dart';

part 'ephemeral_key.freezed.dart';
part 'ephemeral_key.g.dart';

@freezed
class EphemeralKey with _$EphemeralKey {
  const factory EphemeralKey({
    required int expires,
    required String id,
    required String secret,
  }) = _EphemeralKey;

  factory EphemeralKey.fromJson(Map<String, dynamic> json) =>
      _$EphemeralKeyFromJson(json);
}
