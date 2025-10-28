// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  String get id => throw _privateConstructorUsedError;
  EphemeralKey get ephemeralKey => throw _privateConstructorUsedError;

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call({String id, EphemeralKey ephemeralKey});

  $EphemeralKeyCopyWith<$Res> get ephemeralKey;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? ephemeralKey = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            ephemeralKey:
                null == ephemeralKey
                    ? _value.ephemeralKey
                    : ephemeralKey // ignore: cast_nullable_to_non_nullable
                        as EphemeralKey,
          )
          as $Val,
    );
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EphemeralKeyCopyWith<$Res> get ephemeralKey {
    return $EphemeralKeyCopyWith<$Res>(_value.ephemeralKey, (value) {
      return _then(_value.copyWith(ephemeralKey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
    _$CustomerImpl value,
    $Res Function(_$CustomerImpl) then,
  ) = __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, EphemeralKey ephemeralKey});

  @override
  $EphemeralKeyCopyWith<$Res> get ephemeralKey;
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
    _$CustomerImpl _value,
    $Res Function(_$CustomerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? ephemeralKey = null}) {
    return _then(
      _$CustomerImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        ephemeralKey:
            null == ephemeralKey
                ? _value.ephemeralKey
                : ephemeralKey // ignore: cast_nullable_to_non_nullable
                    as EphemeralKey,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl implements _Customer {
  const _$CustomerImpl({required this.id, required this.ephemeralKey});

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  final String id;
  @override
  final EphemeralKey ephemeralKey;

  @override
  String toString() {
    return 'Customer(id: $id, ephemeralKey: $ephemeralKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ephemeralKey, ephemeralKey) ||
                other.ephemeralKey == ephemeralKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, ephemeralKey);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(this);
  }
}

abstract class _Customer implements Customer {
  const factory _Customer({
    required final String id,
    required final EphemeralKey ephemeralKey,
  }) = _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  String get id;
  @override
  EphemeralKey get ephemeralKey;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
