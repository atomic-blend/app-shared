import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_setup_intent.freezed.dart';
part 'pending_setup_intent.g.dart';

@freezed
class PendingSetupIntent with _$PendingSetupIntent {
  const factory PendingSetupIntent({
    required String intentId,
    required String secret,
  }) = _PendingSetupIntent;

  factory PendingSetupIntent.fromJson(Map<String, dynamic> json) =>
      _$PendingSetupIntentFromJson(json);
}
