// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NumberDto _$NumberDtoFromJson(Map<String, dynamic> json) {
  return _NumberDto.fromJson(json);
}

/// @nodoc
mixin _$NumberDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get textTitle => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get audio => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<NumberExampleDto> get examples => throw _privateConstructorUsedError;
  @JsonKey(readValue: handleNullableMapKey)
  NumberSpellDto get spell => throw _privateConstructorUsedError;
  @JsonKey(readValue: handleNullableMapKey)
  NumberCountDto get count => throw _privateConstructorUsedError;

  /// Serializes this NumberDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberDtoCopyWith<NumberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberDtoCopyWith<$Res> {
  factory $NumberDtoCopyWith(NumberDto value, $Res Function(NumberDto) then) =
      _$NumberDtoCopyWithImpl<$Res, NumberDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String textTitle,
      @JsonKey(defaultValue: '') String audio,
      @JsonKey(defaultValue: []) List<NumberExampleDto> examples,
      @JsonKey(readValue: handleNullableMapKey) NumberSpellDto spell,
      @JsonKey(readValue: handleNullableMapKey) NumberCountDto count});

  $NumberSpellDtoCopyWith<$Res> get spell;
  $NumberCountDtoCopyWith<$Res> get count;
}

/// @nodoc
class _$NumberDtoCopyWithImpl<$Res, $Val extends NumberDto>
    implements $NumberDtoCopyWith<$Res> {
  _$NumberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? textTitle = null,
    Object? audio = null,
    Object? examples = null,
    Object? spell = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textTitle: null == textTitle
          ? _value.textTitle
          : textTitle // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<NumberExampleDto>,
      spell: null == spell
          ? _value.spell
          : spell // ignore: cast_nullable_to_non_nullable
              as NumberSpellDto,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as NumberCountDto,
    ) as $Val);
  }

  /// Create a copy of NumberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NumberSpellDtoCopyWith<$Res> get spell {
    return $NumberSpellDtoCopyWith<$Res>(_value.spell, (value) {
      return _then(_value.copyWith(spell: value) as $Val);
    });
  }

  /// Create a copy of NumberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NumberCountDtoCopyWith<$Res> get count {
    return $NumberCountDtoCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NumberDtoImplCopyWith<$Res>
    implements $NumberDtoCopyWith<$Res> {
  factory _$$NumberDtoImplCopyWith(
          _$NumberDtoImpl value, $Res Function(_$NumberDtoImpl) then) =
      __$$NumberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String textTitle,
      @JsonKey(defaultValue: '') String audio,
      @JsonKey(defaultValue: []) List<NumberExampleDto> examples,
      @JsonKey(readValue: handleNullableMapKey) NumberSpellDto spell,
      @JsonKey(readValue: handleNullableMapKey) NumberCountDto count});

  @override
  $NumberSpellDtoCopyWith<$Res> get spell;
  @override
  $NumberCountDtoCopyWith<$Res> get count;
}

/// @nodoc
class __$$NumberDtoImplCopyWithImpl<$Res>
    extends _$NumberDtoCopyWithImpl<$Res, _$NumberDtoImpl>
    implements _$$NumberDtoImplCopyWith<$Res> {
  __$$NumberDtoImplCopyWithImpl(
      _$NumberDtoImpl _value, $Res Function(_$NumberDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? textTitle = null,
    Object? audio = null,
    Object? examples = null,
    Object? spell = null,
    Object? count = null,
  }) {
    return _then(_$NumberDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textTitle: null == textTitle
          ? _value.textTitle
          : textTitle // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<NumberExampleDto>,
      spell: null == spell
          ? _value.spell
          : spell // ignore: cast_nullable_to_non_nullable
              as NumberSpellDto,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as NumberCountDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberDtoImpl extends _NumberDto {
  const _$NumberDtoImpl(
      {required this.id,
      @JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: '') required this.textTitle,
      @JsonKey(defaultValue: '') required this.audio,
      @JsonKey(defaultValue: []) required final List<NumberExampleDto> examples,
      @JsonKey(readValue: handleNullableMapKey) required this.spell,
      @JsonKey(readValue: handleNullableMapKey) required this.count})
      : _examples = examples,
        super._();

  factory _$NumberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumberDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: '')
  final String textTitle;
  @override
  @JsonKey(defaultValue: '')
  final String audio;
  final List<NumberExampleDto> _examples;
  @override
  @JsonKey(defaultValue: [])
  List<NumberExampleDto> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  @override
  @JsonKey(readValue: handleNullableMapKey)
  final NumberSpellDto spell;
  @override
  @JsonKey(readValue: handleNullableMapKey)
  final NumberCountDto count;

  @override
  String toString() {
    return 'NumberDto(id: $id, title: $title, textTitle: $textTitle, audio: $audio, examples: $examples, spell: $spell, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.textTitle, textTitle) ||
                other.textTitle == textTitle) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            const DeepCollectionEquality().equals(other._examples, _examples) &&
            (identical(other.spell, spell) || other.spell == spell) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, textTitle, audio,
      const DeepCollectionEquality().hash(_examples), spell, count);

  /// Create a copy of NumberDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberDtoImplCopyWith<_$NumberDtoImpl> get copyWith =>
      __$$NumberDtoImplCopyWithImpl<_$NumberDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberDtoImplToJson(
      this,
    );
  }
}

abstract class _NumberDto extends NumberDto {
  const factory _NumberDto(
      {required final String id,
      @JsonKey(defaultValue: '') required final String title,
      @JsonKey(defaultValue: '') required final String textTitle,
      @JsonKey(defaultValue: '') required final String audio,
      @JsonKey(defaultValue: []) required final List<NumberExampleDto> examples,
      @JsonKey(readValue: handleNullableMapKey)
      required final NumberSpellDto spell,
      @JsonKey(readValue: handleNullableMapKey)
      required final NumberCountDto count}) = _$NumberDtoImpl;
  const _NumberDto._() : super._();

  factory _NumberDto.fromJson(Map<String, dynamic> json) =
      _$NumberDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: '')
  String get textTitle;
  @override
  @JsonKey(defaultValue: '')
  String get audio;
  @override
  @JsonKey(defaultValue: [])
  List<NumberExampleDto> get examples;
  @override
  @JsonKey(readValue: handleNullableMapKey)
  NumberSpellDto get spell;
  @override
  @JsonKey(readValue: handleNullableMapKey)
  NumberCountDto get count;

  /// Create a copy of NumberDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberDtoImplCopyWith<_$NumberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NumberSpellDto _$NumberSpellDtoFromJson(Map<String, dynamic> json) {
  return _NumberSpellDto.fromJson(json);
}

/// @nodoc
mixin _$NumberSpellDto {
  @JsonKey(defaultValue: '')
  String get audio => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get details => throw _privateConstructorUsedError;

  /// Serializes this NumberSpellDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumberSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberSpellDtoCopyWith<NumberSpellDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberSpellDtoCopyWith<$Res> {
  factory $NumberSpellDtoCopyWith(
          NumberSpellDto value, $Res Function(NumberSpellDto) then) =
      _$NumberSpellDtoCopyWithImpl<$Res, NumberSpellDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String audio,
      @JsonKey(defaultValue: <String>[]) List<String> details});
}

/// @nodoc
class _$NumberSpellDtoCopyWithImpl<$Res, $Val extends NumberSpellDto>
    implements $NumberSpellDtoCopyWith<$Res> {
  _$NumberSpellDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumberSpellDtoImplCopyWith<$Res>
    implements $NumberSpellDtoCopyWith<$Res> {
  factory _$$NumberSpellDtoImplCopyWith(_$NumberSpellDtoImpl value,
          $Res Function(_$NumberSpellDtoImpl) then) =
      __$$NumberSpellDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String audio,
      @JsonKey(defaultValue: <String>[]) List<String> details});
}

/// @nodoc
class __$$NumberSpellDtoImplCopyWithImpl<$Res>
    extends _$NumberSpellDtoCopyWithImpl<$Res, _$NumberSpellDtoImpl>
    implements _$$NumberSpellDtoImplCopyWith<$Res> {
  __$$NumberSpellDtoImplCopyWithImpl(
      _$NumberSpellDtoImpl _value, $Res Function(_$NumberSpellDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = null,
    Object? details = null,
  }) {
    return _then(_$NumberSpellDtoImpl(
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberSpellDtoImpl extends _NumberSpellDto {
  const _$NumberSpellDtoImpl(
      {@JsonKey(defaultValue: '') required this.audio,
      @JsonKey(defaultValue: <String>[]) required final List<String> details})
      : _details = details,
        super._();

  factory _$NumberSpellDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumberSpellDtoImplFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String audio;
  final List<String> _details;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'NumberSpellDto(audio: $audio, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberSpellDtoImpl &&
            (identical(other.audio, audio) || other.audio == audio) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, audio, const DeepCollectionEquality().hash(_details));

  /// Create a copy of NumberSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberSpellDtoImplCopyWith<_$NumberSpellDtoImpl> get copyWith =>
      __$$NumberSpellDtoImplCopyWithImpl<_$NumberSpellDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberSpellDtoImplToJson(
      this,
    );
  }
}

abstract class _NumberSpellDto extends NumberSpellDto {
  const factory _NumberSpellDto(
      {@JsonKey(defaultValue: '') required final String audio,
      @JsonKey(defaultValue: <String>[])
      required final List<String> details}) = _$NumberSpellDtoImpl;
  const _NumberSpellDto._() : super._();

  factory _NumberSpellDto.fromJson(Map<String, dynamic> json) =
      _$NumberSpellDtoImpl.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get audio;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get details;

  /// Create a copy of NumberSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberSpellDtoImplCopyWith<_$NumberSpellDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NumberCountDto _$NumberCountDtoFromJson(Map<String, dynamic> json) {
  return _NumberCountDto.fromJson(json);
}

/// @nodoc
mixin _$NumberCountDto {
  @JsonKey(defaultValue: '')
  String get noColor => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get colored => throw _privateConstructorUsedError;

  /// Serializes this NumberCountDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumberCountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberCountDtoCopyWith<NumberCountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberCountDtoCopyWith<$Res> {
  factory $NumberCountDtoCopyWith(
          NumberCountDto value, $Res Function(NumberCountDto) then) =
      _$NumberCountDtoCopyWithImpl<$Res, NumberCountDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String noColor,
      @JsonKey(defaultValue: '') String colored});
}

/// @nodoc
class _$NumberCountDtoCopyWithImpl<$Res, $Val extends NumberCountDto>
    implements $NumberCountDtoCopyWith<$Res> {
  _$NumberCountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberCountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noColor = null,
    Object? colored = null,
  }) {
    return _then(_value.copyWith(
      noColor: null == noColor
          ? _value.noColor
          : noColor // ignore: cast_nullable_to_non_nullable
              as String,
      colored: null == colored
          ? _value.colored
          : colored // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumberCountDtoImplCopyWith<$Res>
    implements $NumberCountDtoCopyWith<$Res> {
  factory _$$NumberCountDtoImplCopyWith(_$NumberCountDtoImpl value,
          $Res Function(_$NumberCountDtoImpl) then) =
      __$$NumberCountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String noColor,
      @JsonKey(defaultValue: '') String colored});
}

/// @nodoc
class __$$NumberCountDtoImplCopyWithImpl<$Res>
    extends _$NumberCountDtoCopyWithImpl<$Res, _$NumberCountDtoImpl>
    implements _$$NumberCountDtoImplCopyWith<$Res> {
  __$$NumberCountDtoImplCopyWithImpl(
      _$NumberCountDtoImpl _value, $Res Function(_$NumberCountDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberCountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noColor = null,
    Object? colored = null,
  }) {
    return _then(_$NumberCountDtoImpl(
      noColor: null == noColor
          ? _value.noColor
          : noColor // ignore: cast_nullable_to_non_nullable
              as String,
      colored: null == colored
          ? _value.colored
          : colored // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberCountDtoImpl extends _NumberCountDto {
  const _$NumberCountDtoImpl(
      {@JsonKey(defaultValue: '') required this.noColor,
      @JsonKey(defaultValue: '') required this.colored})
      : super._();

  factory _$NumberCountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumberCountDtoImplFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String noColor;
  @override
  @JsonKey(defaultValue: '')
  final String colored;

  @override
  String toString() {
    return 'NumberCountDto(noColor: $noColor, colored: $colored)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberCountDtoImpl &&
            (identical(other.noColor, noColor) || other.noColor == noColor) &&
            (identical(other.colored, colored) || other.colored == colored));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, noColor, colored);

  /// Create a copy of NumberCountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberCountDtoImplCopyWith<_$NumberCountDtoImpl> get copyWith =>
      __$$NumberCountDtoImplCopyWithImpl<_$NumberCountDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberCountDtoImplToJson(
      this,
    );
  }
}

abstract class _NumberCountDto extends NumberCountDto {
  const factory _NumberCountDto(
          {@JsonKey(defaultValue: '') required final String noColor,
          @JsonKey(defaultValue: '') required final String colored}) =
      _$NumberCountDtoImpl;
  const _NumberCountDto._() : super._();

  factory _NumberCountDto.fromJson(Map<String, dynamic> json) =
      _$NumberCountDtoImpl.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get noColor;
  @override
  @JsonKey(defaultValue: '')
  String get colored;

  /// Create a copy of NumberCountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberCountDtoImplCopyWith<_$NumberCountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NumberExampleDto _$NumberExampleDtoFromJson(Map<String, dynamic> json) {
  return _NumberExampleDto.fromJson(json);
}

/// @nodoc
mixin _$NumberExampleDto {
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get audio => throw _privateConstructorUsedError;

  /// Serializes this NumberExampleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NumberExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberExampleDtoCopyWith<NumberExampleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberExampleDtoCopyWith<$Res> {
  factory $NumberExampleDtoCopyWith(
          NumberExampleDto value, $Res Function(NumberExampleDto) then) =
      _$NumberExampleDtoCopyWithImpl<$Res, NumberExampleDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String image,
      @JsonKey(defaultValue: '') String audio});
}

/// @nodoc
class _$NumberExampleDtoCopyWithImpl<$Res, $Val extends NumberExampleDto>
    implements $NumberExampleDtoCopyWith<$Res> {
  _$NumberExampleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? audio = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumberExampleDtoImplCopyWith<$Res>
    implements $NumberExampleDtoCopyWith<$Res> {
  factory _$$NumberExampleDtoImplCopyWith(_$NumberExampleDtoImpl value,
          $Res Function(_$NumberExampleDtoImpl) then) =
      __$$NumberExampleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String image,
      @JsonKey(defaultValue: '') String audio});
}

/// @nodoc
class __$$NumberExampleDtoImplCopyWithImpl<$Res>
    extends _$NumberExampleDtoCopyWithImpl<$Res, _$NumberExampleDtoImpl>
    implements _$$NumberExampleDtoImplCopyWith<$Res> {
  __$$NumberExampleDtoImplCopyWithImpl(_$NumberExampleDtoImpl _value,
      $Res Function(_$NumberExampleDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? audio = null,
  }) {
    return _then(_$NumberExampleDtoImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NumberExampleDtoImpl extends _NumberExampleDto {
  const _$NumberExampleDtoImpl(
      {@JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: '') required this.image,
      @JsonKey(defaultValue: '') required this.audio})
      : super._();

  factory _$NumberExampleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$NumberExampleDtoImplFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: '')
  final String image;
  @override
  @JsonKey(defaultValue: '')
  final String audio;

  @override
  String toString() {
    return 'NumberExampleDto(title: $title, image: $image, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberExampleDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image, audio);

  /// Create a copy of NumberExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberExampleDtoImplCopyWith<_$NumberExampleDtoImpl> get copyWith =>
      __$$NumberExampleDtoImplCopyWithImpl<_$NumberExampleDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NumberExampleDtoImplToJson(
      this,
    );
  }
}

abstract class _NumberExampleDto extends NumberExampleDto {
  const factory _NumberExampleDto(
          {@JsonKey(defaultValue: '') required final String title,
          @JsonKey(defaultValue: '') required final String image,
          @JsonKey(defaultValue: '') required final String audio}) =
      _$NumberExampleDtoImpl;
  const _NumberExampleDto._() : super._();

  factory _NumberExampleDto.fromJson(Map<String, dynamic> json) =
      _$NumberExampleDtoImpl.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: '')
  String get image;
  @override
  @JsonKey(defaultValue: '')
  String get audio;

  /// Create a copy of NumberExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberExampleDtoImplCopyWith<_$NumberExampleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
