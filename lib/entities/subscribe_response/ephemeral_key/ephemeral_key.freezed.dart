// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ephemeral_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EphemeralKey _$EphemeralKeyFromJson(Map<String, dynamic> json) {
  return _EphemeralKey.fromJson(json);
}

/// @nodoc
mixin _$EphemeralKey {
  int get expires => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get secret => throw _privateConstructorUsedError;

  /// Serializes this EphemeralKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EphemeralKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EphemeralKeyCopyWith<EphemeralKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EphemeralKeyCopyWith<$Res> {
  factory $EphemeralKeyCopyWith(
    EphemeralKey value,
    $Res Function(EphemeralKey) then,
  ) = _$EphemeralKeyCopyWithImpl<$Res, EphemeralKey>;
  @useResult
  $Res call({int expires, String id, String secret});
}

/// @nodoc
class _$EphemeralKeyCopyWithImpl<$Res, $Val extends EphemeralKey>
    implements $EphemeralKeyCopyWith<$Res> {
  _$EphemeralKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EphemeralKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expires = null,
    Object? id = null,
    Object? secret = null,
  }) {
    return _then(
      _value.copyWith(
            expires:
                null == expires
                    ? _value.expires
                    : expires // ignore: cast_nullable_to_non_nullable
                        as int,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EphemeralKeyImplCopyWith<$Res>
    implements $EphemeralKeyCopyWith<$Res> {
  factory _$$EphemeralKeyImplCopyWith(
    _$EphemeralKeyImpl value,
    $Res Function(_$EphemeralKeyImpl) then,
  ) = __$$EphemeralKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int expires, String id, String secret});
}

/// @nodoc
class __$$EphemeralKeyImplCopyWithImpl<$Res>
    extends _$EphemeralKeyCopyWithImpl<$Res, _$EphemeralKeyImpl>
    implements _$$EphemeralKeyImplCopyWith<$Res> {
  __$$EphemeralKeyImplCopyWithImpl(
    _$EphemeralKeyImpl _value,
    $Res Function(_$EphemeralKeyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EphemeralKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expires = null,
    Object? id = null,
    Object? secret = null,
  }) {
    return _then(
      _$EphemeralKeyImpl(
        expires:
            null == expires
                ? _value.expires
                : expires // ignore: cast_nullable_to_non_nullable
                    as int,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
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
class _$EphemeralKeyImpl implements _EphemeralKey {
  const _$EphemeralKeyImpl({
    required this.expires,
    required this.id,
    required this.secret,
  });

  factory _$EphemeralKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EphemeralKeyImplFromJson(json);

  @override
  final int expires;
  @override
  final String id;
  @override
  final String secret;

  @override
  String toString() {
    return 'EphemeralKey(expires: $expires, id: $id, secret: $secret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EphemeralKeyImpl &&
            (identical(other.expires, expires) || other.expires == expires) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.secret, secret) || other.secret == secret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, expires, id, secret);

  /// Create a copy of EphemeralKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EphemeralKeyImplCopyWith<_$EphemeralKeyImpl> get copyWith =>
      __$$EphemeralKeyImplCopyWithImpl<_$EphemeralKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EphemeralKeyImplToJson(this);
  }
}

abstract class _EphemeralKey implements EphemeralKey {
  const factory _EphemeralKey({
    required final int expires,
    required final String id,
    required final String secret,
  }) = _$EphemeralKeyImpl;

  factory _EphemeralKey.fromJson(Map<String, dynamic> json) =
      _$EphemeralKeyImpl.fromJson;

  @override
  int get expires;
  @override
  String get id;
  @override
  String get secret;

  /// Create a copy of EphemeralKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EphemeralKeyImplCopyWith<_$EphemeralKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
