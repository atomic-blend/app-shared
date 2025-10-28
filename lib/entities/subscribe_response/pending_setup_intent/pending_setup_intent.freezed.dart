// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_setup_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PendingSetupIntent _$PendingSetupIntentFromJson(Map<String, dynamic> json) {
  return _PendingSetupIntent.fromJson(json);
}

/// @nodoc
mixin _$PendingSetupIntent {
  String get intentId => throw _privateConstructorUsedError;
  String get secret => throw _privateConstructorUsedError;

  /// Serializes this PendingSetupIntent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PendingSetupIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PendingSetupIntentCopyWith<PendingSetupIntent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingSetupIntentCopyWith<$Res> {
  factory $PendingSetupIntentCopyWith(
    PendingSetupIntent value,
    $Res Function(PendingSetupIntent) then,
  ) = _$PendingSetupIntentCopyWithImpl<$Res, PendingSetupIntent>;
  @useResult
  $Res call({String intentId, String secret});
}

/// @nodoc
class _$PendingSetupIntentCopyWithImpl<$Res, $Val extends PendingSetupIntent>
    implements $PendingSetupIntentCopyWith<$Res> {
  _$PendingSetupIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PendingSetupIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? intentId = null, Object? secret = null}) {
    return _then(
      _value.copyWith(
            intentId:
                null == intentId
                    ? _value.intentId
                    : intentId // ignore: cast_nullable_to_non_nullable
                        as String,
            secret:
                null == secret
                    ? _value.secret
                    : secret // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PendingSetupIntentImplCopyWith<$Res>
    implements $PendingSetupIntentCopyWith<$Res> {
  factory _$$PendingSetupIntentImplCopyWith(
    _$PendingSetupIntentImpl value,
    $Res Function(_$PendingSetupIntentImpl) then,
  ) = __$$PendingSetupIntentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String intentId, String secret});
}

/// @nodoc
class __$$PendingSetupIntentImplCopyWithImpl<$Res>
    extends _$PendingSetupIntentCopyWithImpl<$Res, _$PendingSetupIntentImpl>
    implements _$$PendingSetupIntentImplCopyWith<$Res> {
  __$$PendingSetupIntentImplCopyWithImpl(
    _$PendingSetupIntentImpl _value,
    $Res Function(_$PendingSetupIntentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PendingSetupIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? intentId = null, Object? secret = null}) {
    return _then(
      _$PendingSetupIntentImpl(
        intentId:
            null == intentId
                ? _value.intentId
                : intentId // ignore: cast_nullable_to_non_nullable
                    as String,
        secret:
            null == secret
                ? _value.secret
                : secret // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingSetupIntentImpl implements _PendingSetupIntent {
  const _$PendingSetupIntentImpl({
    required this.intentId,
    required this.secret,
  });

  factory _$PendingSetupIntentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingSetupIntentImplFromJson(json);

  @override
  final String intentId;
  @override
  final String secret;

  @override
  String toString() {
    return 'PendingSetupIntent(intentId: $intentId, secret: $secret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingSetupIntentImpl &&
            (identical(other.intentId, intentId) ||
                other.intentId == intentId) &&
            (identical(other.secret, secret) || other.secret == secret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, intentId, secret);

  /// Create a copy of PendingSetupIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingSetupIntentImplCopyWith<_$PendingSetupIntentImpl> get copyWith =>
      __$$PendingSetupIntentImplCopyWithImpl<_$PendingSetupIntentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingSetupIntentImplToJson(this);
  }
}

abstract class _PendingSetupIntent implements PendingSetupIntent {
  const factory _PendingSetupIntent({
    required final String intentId,
    required final String secret,
  }) = _$PendingSetupIntentImpl;

  factory _PendingSetupIntent.fromJson(Map<String, dynamic> json) =
      _$PendingSetupIntentImpl.fromJson;

  @override
  String get intentId;
  @override
  String get secret;

  /// Create a copy of PendingSetupIntent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingSetupIntentImplCopyWith<_$PendingSetupIntentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
