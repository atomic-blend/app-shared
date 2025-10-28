// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ab_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ABConfig _$ABConfigFromJson(Map<String, dynamic> json) {
  return _ABConfig.fromJson(json);
}

/// @nodoc
mixin _$ABConfig {
  List<String> get domains => throw _privateConstructorUsedError;
  int? get remainingSpots => throw _privateConstructorUsedError;
  bool? get paymentEnabled => throw _privateConstructorUsedError;

  /// Serializes this ABConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ABConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ABConfigCopyWith<ABConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ABConfigCopyWith<$Res> {
  factory $ABConfigCopyWith(ABConfig value, $Res Function(ABConfig) then) =
      _$ABConfigCopyWithImpl<$Res, ABConfig>;
  @useResult
  $Res call({List<String> domains, int? remainingSpots, bool? paymentEnabled});
}

/// @nodoc
class _$ABConfigCopyWithImpl<$Res, $Val extends ABConfig>
    implements $ABConfigCopyWith<$Res> {
  _$ABConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ABConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? remainingSpots = freezed,
    Object? paymentEnabled = freezed,
  }) {
    return _then(
      _value.copyWith(
            domains:
                null == domains
                    ? _value.domains
                    : domains // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            remainingSpots:
                freezed == remainingSpots
                    ? _value.remainingSpots
                    : remainingSpots // ignore: cast_nullable_to_non_nullable
                        as int?,
            paymentEnabled:
                freezed == paymentEnabled
                    ? _value.paymentEnabled
                    : paymentEnabled // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ABConfigImplCopyWith<$Res>
    implements $ABConfigCopyWith<$Res> {
  factory _$$ABConfigImplCopyWith(
    _$ABConfigImpl value,
    $Res Function(_$ABConfigImpl) then,
  ) = __$$ABConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> domains, int? remainingSpots, bool? paymentEnabled});
}

/// @nodoc
class __$$ABConfigImplCopyWithImpl<$Res>
    extends _$ABConfigCopyWithImpl<$Res, _$ABConfigImpl>
    implements _$$ABConfigImplCopyWith<$Res> {
  __$$ABConfigImplCopyWithImpl(
    _$ABConfigImpl _value,
    $Res Function(_$ABConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ABConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? domains = null,
    Object? remainingSpots = freezed,
    Object? paymentEnabled = freezed,
  }) {
    return _then(
      _$ABConfigImpl(
        domains:
            null == domains
                ? _value._domains
                : domains // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        remainingSpots:
            freezed == remainingSpots
                ? _value.remainingSpots
                : remainingSpots // ignore: cast_nullable_to_non_nullable
                    as int?,
        paymentEnabled:
            freezed == paymentEnabled
                ? _value.paymentEnabled
                : paymentEnabled // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ABConfigImpl implements _ABConfig {
  _$ABConfigImpl({
    required final List<String> domains,
    this.remainingSpots,
    this.paymentEnabled,
  }) : _domains = domains;

  factory _$ABConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ABConfigImplFromJson(json);

  final List<String> _domains;
  @override
  List<String> get domains {
    if (_domains is EqualUnmodifiableListView) return _domains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_domains);
  }

  @override
  final int? remainingSpots;
  @override
  final bool? paymentEnabled;

  @override
  String toString() {
    return 'ABConfig(domains: $domains, remainingSpots: $remainingSpots, paymentEnabled: $paymentEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ABConfigImpl &&
            const DeepCollectionEquality().equals(other._domains, _domains) &&
            (identical(other.remainingSpots, remainingSpots) ||
                other.remainingSpots == remainingSpots) &&
            (identical(other.paymentEnabled, paymentEnabled) ||
                other.paymentEnabled == paymentEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_domains),
    remainingSpots,
    paymentEnabled,
  );

  /// Create a copy of ABConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ABConfigImplCopyWith<_$ABConfigImpl> get copyWith =>
      __$$ABConfigImplCopyWithImpl<_$ABConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ABConfigImplToJson(this);
  }
}

abstract class _ABConfig implements ABConfig {
  factory _ABConfig({
    required final List<String> domains,
    final int? remainingSpots,
    final bool? paymentEnabled,
  }) = _$ABConfigImpl;

  factory _ABConfig.fromJson(Map<String, dynamic> json) =
      _$ABConfigImpl.fromJson;

  @override
  List<String> get domains;
  @override
  int? get remainingSpots;
  @override
  bool? get paymentEnabled;

  /// Create a copy of ABConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ABConfigImplCopyWith<_$ABConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
