// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubscribeResponse _$SubscribeResponseFromJson(Map<String, dynamic> json) {
  return _SubscribeResponse.fromJson(json);
}

/// @nodoc
mixin _$SubscribeResponse {
  Customer get customer => throw _privateConstructorUsedError;
  PendingSetupIntent get pendingSetupIntent =>
      throw _privateConstructorUsedError;

  /// Serializes this SubscribeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscribeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscribeResponseCopyWith<SubscribeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeResponseCopyWith<$Res> {
  factory $SubscribeResponseCopyWith(
    SubscribeResponse value,
    $Res Function(SubscribeResponse) then,
  ) = _$SubscribeResponseCopyWithImpl<$Res, SubscribeResponse>;
  @useResult
  $Res call({Customer customer, PendingSetupIntent pendingSetupIntent});

  $CustomerCopyWith<$Res> get customer;
  $PendingSetupIntentCopyWith<$Res> get pendingSetupIntent;
}

/// @nodoc
class _$SubscribeResponseCopyWithImpl<$Res, $Val extends SubscribeResponse>
    implements $SubscribeResponseCopyWith<$Res> {
  _$SubscribeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscribeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? customer = null, Object? pendingSetupIntent = null}) {
    return _then(
      _value.copyWith(
            customer:
                null == customer
                    ? _value.customer
                    : customer // ignore: cast_nullable_to_non_nullable
                        as Customer,
            pendingSetupIntent:
                null == pendingSetupIntent
                    ? _value.pendingSetupIntent
                    : pendingSetupIntent // ignore: cast_nullable_to_non_nullable
                        as PendingSetupIntent,
          )
          as $Val,
    );
  }

  /// Create a copy of SubscribeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of SubscribeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PendingSetupIntentCopyWith<$Res> get pendingSetupIntent {
    return $PendingSetupIntentCopyWith<$Res>(_value.pendingSetupIntent, (
      value,
    ) {
      return _then(_value.copyWith(pendingSetupIntent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscribeResponseImplCopyWith<$Res>
    implements $SubscribeResponseCopyWith<$Res> {
  factory _$$SubscribeResponseImplCopyWith(
    _$SubscribeResponseImpl value,
    $Res Function(_$SubscribeResponseImpl) then,
  ) = __$$SubscribeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Customer customer, PendingSetupIntent pendingSetupIntent});

  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $PendingSetupIntentCopyWith<$Res> get pendingSetupIntent;
}

/// @nodoc
class __$$SubscribeResponseImplCopyWithImpl<$Res>
    extends _$SubscribeResponseCopyWithImpl<$Res, _$SubscribeResponseImpl>
    implements _$$SubscribeResponseImplCopyWith<$Res> {
  __$$SubscribeResponseImplCopyWithImpl(
    _$SubscribeResponseImpl _value,
    $Res Function(_$SubscribeResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscribeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? customer = null, Object? pendingSetupIntent = null}) {
    return _then(
      _$SubscribeResponseImpl(
        customer:
            null == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                    as Customer,
        pendingSetupIntent:
            null == pendingSetupIntent
                ? _value.pendingSetupIntent
                : pendingSetupIntent // ignore: cast_nullable_to_non_nullable
                    as PendingSetupIntent,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribeResponseImpl implements _SubscribeResponse {
  const _$SubscribeResponseImpl({
    required this.customer,
    required this.pendingSetupIntent,
  });

  factory _$SubscribeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscribeResponseImplFromJson(json);

  @override
  final Customer customer;
  @override
  final PendingSetupIntent pendingSetupIntent;

  @override
  String toString() {
    return 'SubscribeResponse(customer: $customer, pendingSetupIntent: $pendingSetupIntent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeResponseImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.pendingSetupIntent, pendingSetupIntent) ||
                other.pendingSetupIntent == pendingSetupIntent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customer, pendingSetupIntent);

  /// Create a copy of SubscribeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeResponseImplCopyWith<_$SubscribeResponseImpl> get copyWith =>
      __$$SubscribeResponseImplCopyWithImpl<_$SubscribeResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribeResponseImplToJson(this);
  }
}

abstract class _SubscribeResponse implements SubscribeResponse {
  const factory _SubscribeResponse({
    required final Customer customer,
    required final PendingSetupIntent pendingSetupIntent,
  }) = _$SubscribeResponseImpl;

  factory _SubscribeResponse.fromJson(Map<String, dynamic> json) =
      _$SubscribeResponseImpl.fromJson;

  @override
  Customer get customer;
  @override
  PendingSetupIntent get pendingSetupIntent;

  /// Create a copy of SubscribeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscribeResponseImplCopyWith<_$SubscribeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
