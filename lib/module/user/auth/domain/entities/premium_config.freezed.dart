// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PremiumConfig _$PremiumConfigFromJson(Map<String, dynamic> json) {
  return _PremiumConfig.fromJson(json);
}

/// @nodoc
mixin _$PremiumConfig {
  bool get wordSelection => throw _privateConstructorUsedError;
  bool get wordMatch => throw _privateConstructorUsedError;
  bool get things => throw _privateConstructorUsedError;

  /// Serializes this PremiumConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PremiumConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PremiumConfigCopyWith<PremiumConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PremiumConfigCopyWith<$Res> {
  factory $PremiumConfigCopyWith(
          PremiumConfig value, $Res Function(PremiumConfig) then) =
      _$PremiumConfigCopyWithImpl<$Res, PremiumConfig>;
  @useResult
  $Res call({bool wordSelection, bool wordMatch, bool things});
}

/// @nodoc
class _$PremiumConfigCopyWithImpl<$Res, $Val extends PremiumConfig>
    implements $PremiumConfigCopyWith<$Res> {
  _$PremiumConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PremiumConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordSelection = null,
    Object? wordMatch = null,
    Object? things = null,
  }) {
    return _then(_value.copyWith(
      wordSelection: null == wordSelection
          ? _value.wordSelection
          : wordSelection // ignore: cast_nullable_to_non_nullable
              as bool,
      wordMatch: null == wordMatch
          ? _value.wordMatch
          : wordMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      things: null == things
          ? _value.things
          : things // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PremiumConfigImplCopyWith<$Res>
    implements $PremiumConfigCopyWith<$Res> {
  factory _$$PremiumConfigImplCopyWith(
          _$PremiumConfigImpl value, $Res Function(_$PremiumConfigImpl) then) =
      __$$PremiumConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool wordSelection, bool wordMatch, bool things});
}

/// @nodoc
class __$$PremiumConfigImplCopyWithImpl<$Res>
    extends _$PremiumConfigCopyWithImpl<$Res, _$PremiumConfigImpl>
    implements _$$PremiumConfigImplCopyWith<$Res> {
  __$$PremiumConfigImplCopyWithImpl(
      _$PremiumConfigImpl _value, $Res Function(_$PremiumConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of PremiumConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordSelection = null,
    Object? wordMatch = null,
    Object? things = null,
  }) {
    return _then(_$PremiumConfigImpl(
      wordSelection: null == wordSelection
          ? _value.wordSelection
          : wordSelection // ignore: cast_nullable_to_non_nullable
              as bool,
      wordMatch: null == wordMatch
          ? _value.wordMatch
          : wordMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      things: null == things
          ? _value.things
          : things // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PremiumConfigImpl extends _PremiumConfig {
  const _$PremiumConfigImpl(
      {this.wordSelection = false, this.wordMatch = false, this.things = false})
      : super._();

  factory _$PremiumConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$PremiumConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool wordSelection;
  @override
  @JsonKey()
  final bool wordMatch;
  @override
  @JsonKey()
  final bool things;

  @override
  String toString() {
    return 'PremiumConfig(wordSelection: $wordSelection, wordMatch: $wordMatch, things: $things)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PremiumConfigImpl &&
            (identical(other.wordSelection, wordSelection) ||
                other.wordSelection == wordSelection) &&
            (identical(other.wordMatch, wordMatch) ||
                other.wordMatch == wordMatch) &&
            (identical(other.things, things) || other.things == things));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, wordSelection, wordMatch, things);

  /// Create a copy of PremiumConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PremiumConfigImplCopyWith<_$PremiumConfigImpl> get copyWith =>
      __$$PremiumConfigImplCopyWithImpl<_$PremiumConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PremiumConfigImplToJson(
      this,
    );
  }
}

abstract class _PremiumConfig extends PremiumConfig {
  const factory _PremiumConfig(
      {final bool wordSelection,
      final bool wordMatch,
      final bool things}) = _$PremiumConfigImpl;
  const _PremiumConfig._() : super._();

  factory _PremiumConfig.fromJson(Map<String, dynamic> json) =
      _$PremiumConfigImpl.fromJson;

  @override
  bool get wordSelection;
  @override
  bool get wordMatch;
  @override
  bool get things;

  /// Create a copy of PremiumConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PremiumConfigImplCopyWith<_$PremiumConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
