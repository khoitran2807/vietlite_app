// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LetterDto _$LetterDtoFromJson(Map<String, dynamic> json) {
  return _LetterDto.fromJson(json);
}

/// @nodoc
mixin _$LetterDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get audioTitle => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get order => throw _privateConstructorUsedError;
  @JsonKey(readValue: handleNullableMapKey)
  LetterExampleDto get mainExample => throw _privateConstructorUsedError;
  @JsonKey(readValue: handleNullableMapKey)
  LetterSpellDto get spell => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<LetterExampleDto> get examples => throw _privateConstructorUsedError;

  /// Serializes this LetterDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LetterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LetterDtoCopyWith<LetterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterDtoCopyWith<$Res> {
  factory $LetterDtoCopyWith(LetterDto value, $Res Function(LetterDto) then) =
      _$LetterDtoCopyWithImpl<$Res, LetterDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String audioTitle,
      @JsonKey(defaultValue: 0) int order,
      @JsonKey(readValue: handleNullableMapKey) LetterExampleDto mainExample,
      @JsonKey(readValue: handleNullableMapKey) LetterSpellDto spell,
      @JsonKey(defaultValue: []) List<LetterExampleDto> examples});

  $LetterExampleDtoCopyWith<$Res> get mainExample;
  $LetterSpellDtoCopyWith<$Res> get spell;
}

/// @nodoc
class _$LetterDtoCopyWithImpl<$Res, $Val extends LetterDto>
    implements $LetterDtoCopyWith<$Res> {
  _$LetterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LetterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? audioTitle = null,
    Object? order = null,
    Object? mainExample = null,
    Object? spell = null,
    Object? examples = null,
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
      audioTitle: null == audioTitle
          ? _value.audioTitle
          : audioTitle // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      mainExample: null == mainExample
          ? _value.mainExample
          : mainExample // ignore: cast_nullable_to_non_nullable
              as LetterExampleDto,
      spell: null == spell
          ? _value.spell
          : spell // ignore: cast_nullable_to_non_nullable
              as LetterSpellDto,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<LetterExampleDto>,
    ) as $Val);
  }

  /// Create a copy of LetterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LetterExampleDtoCopyWith<$Res> get mainExample {
    return $LetterExampleDtoCopyWith<$Res>(_value.mainExample, (value) {
      return _then(_value.copyWith(mainExample: value) as $Val);
    });
  }

  /// Create a copy of LetterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LetterSpellDtoCopyWith<$Res> get spell {
    return $LetterSpellDtoCopyWith<$Res>(_value.spell, (value) {
      return _then(_value.copyWith(spell: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LetterDtoImplCopyWith<$Res>
    implements $LetterDtoCopyWith<$Res> {
  factory _$$LetterDtoImplCopyWith(
          _$LetterDtoImpl value, $Res Function(_$LetterDtoImpl) then) =
      __$$LetterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String audioTitle,
      @JsonKey(defaultValue: 0) int order,
      @JsonKey(readValue: handleNullableMapKey) LetterExampleDto mainExample,
      @JsonKey(readValue: handleNullableMapKey) LetterSpellDto spell,
      @JsonKey(defaultValue: []) List<LetterExampleDto> examples});

  @override
  $LetterExampleDtoCopyWith<$Res> get mainExample;
  @override
  $LetterSpellDtoCopyWith<$Res> get spell;
}

/// @nodoc
class __$$LetterDtoImplCopyWithImpl<$Res>
    extends _$LetterDtoCopyWithImpl<$Res, _$LetterDtoImpl>
    implements _$$LetterDtoImplCopyWith<$Res> {
  __$$LetterDtoImplCopyWithImpl(
      _$LetterDtoImpl _value, $Res Function(_$LetterDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LetterDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? audioTitle = null,
    Object? order = null,
    Object? mainExample = null,
    Object? spell = null,
    Object? examples = null,
  }) {
    return _then(_$LetterDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      audioTitle: null == audioTitle
          ? _value.audioTitle
          : audioTitle // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      mainExample: null == mainExample
          ? _value.mainExample
          : mainExample // ignore: cast_nullable_to_non_nullable
              as LetterExampleDto,
      spell: null == spell
          ? _value.spell
          : spell // ignore: cast_nullable_to_non_nullable
              as LetterSpellDto,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<LetterExampleDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LetterDtoImpl extends _LetterDto {
  const _$LetterDtoImpl(
      {required this.id,
      @JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: '') required this.audioTitle,
      @JsonKey(defaultValue: 0) required this.order,
      @JsonKey(readValue: handleNullableMapKey) required this.mainExample,
      @JsonKey(readValue: handleNullableMapKey) required this.spell,
      @JsonKey(defaultValue: [])
      required final List<LetterExampleDto> examples})
      : _examples = examples,
        super._();

  factory _$LetterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LetterDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: '')
  final String audioTitle;
  @override
  @JsonKey(defaultValue: 0)
  final int order;
  @override
  @JsonKey(readValue: handleNullableMapKey)
  final LetterExampleDto mainExample;
  @override
  @JsonKey(readValue: handleNullableMapKey)
  final LetterSpellDto spell;
  final List<LetterExampleDto> _examples;
  @override
  @JsonKey(defaultValue: [])
  List<LetterExampleDto> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  @override
  String toString() {
    return 'LetterDto(id: $id, title: $title, audioTitle: $audioTitle, order: $order, mainExample: $mainExample, spell: $spell, examples: $examples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetterDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.audioTitle, audioTitle) ||
                other.audioTitle == audioTitle) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.mainExample, mainExample) ||
                other.mainExample == mainExample) &&
            (identical(other.spell, spell) || other.spell == spell) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, audioTitle, order,
      mainExample, spell, const DeepCollectionEquality().hash(_examples));

  /// Create a copy of LetterDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LetterDtoImplCopyWith<_$LetterDtoImpl> get copyWith =>
      __$$LetterDtoImplCopyWithImpl<_$LetterDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LetterDtoImplToJson(
      this,
    );
  }
}

abstract class _LetterDto extends LetterDto {
  const factory _LetterDto(
      {required final String id,
      @JsonKey(defaultValue: '') required final String title,
      @JsonKey(defaultValue: '') required final String audioTitle,
      @JsonKey(defaultValue: 0) required final int order,
      @JsonKey(readValue: handleNullableMapKey)
      required final LetterExampleDto mainExample,
      @JsonKey(readValue: handleNullableMapKey)
      required final LetterSpellDto spell,
      @JsonKey(defaultValue: [])
      required final List<LetterExampleDto> examples}) = _$LetterDtoImpl;
  const _LetterDto._() : super._();

  factory _LetterDto.fromJson(Map<String, dynamic> json) =
      _$LetterDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: '')
  String get audioTitle;
  @override
  @JsonKey(defaultValue: 0)
  int get order;
  @override
  @JsonKey(readValue: handleNullableMapKey)
  LetterExampleDto get mainExample;
  @override
  @JsonKey(readValue: handleNullableMapKey)
  LetterSpellDto get spell;
  @override
  @JsonKey(defaultValue: [])
  List<LetterExampleDto> get examples;

  /// Create a copy of LetterDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LetterDtoImplCopyWith<_$LetterDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LetterExampleDto _$LetterExampleDtoFromJson(Map<String, dynamic> json) {
  return _LetterExampleDto.fromJson(json);
}

/// @nodoc
mixin _$LetterExampleDto {
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get audio => throw _privateConstructorUsedError;

  /// Serializes this LetterExampleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LetterExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LetterExampleDtoCopyWith<LetterExampleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterExampleDtoCopyWith<$Res> {
  factory $LetterExampleDtoCopyWith(
          LetterExampleDto value, $Res Function(LetterExampleDto) then) =
      _$LetterExampleDtoCopyWithImpl<$Res, LetterExampleDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String image,
      @JsonKey(defaultValue: '') String audio});
}

/// @nodoc
class _$LetterExampleDtoCopyWithImpl<$Res, $Val extends LetterExampleDto>
    implements $LetterExampleDtoCopyWith<$Res> {
  _$LetterExampleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LetterExampleDto
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
abstract class _$$LetterExampleDtoImplCopyWith<$Res>
    implements $LetterExampleDtoCopyWith<$Res> {
  factory _$$LetterExampleDtoImplCopyWith(_$LetterExampleDtoImpl value,
          $Res Function(_$LetterExampleDtoImpl) then) =
      __$$LetterExampleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: '') String image,
      @JsonKey(defaultValue: '') String audio});
}

/// @nodoc
class __$$LetterExampleDtoImplCopyWithImpl<$Res>
    extends _$LetterExampleDtoCopyWithImpl<$Res, _$LetterExampleDtoImpl>
    implements _$$LetterExampleDtoImplCopyWith<$Res> {
  __$$LetterExampleDtoImplCopyWithImpl(_$LetterExampleDtoImpl _value,
      $Res Function(_$LetterExampleDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LetterExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
    Object? audio = null,
  }) {
    return _then(_$LetterExampleDtoImpl(
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
class _$LetterExampleDtoImpl extends _LetterExampleDto {
  const _$LetterExampleDtoImpl(
      {@JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: '') required this.image,
      @JsonKey(defaultValue: '') required this.audio})
      : super._();

  factory _$LetterExampleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LetterExampleDtoImplFromJson(json);

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
    return 'LetterExampleDto(title: $title, image: $image, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetterExampleDtoImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image, audio);

  /// Create a copy of LetterExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LetterExampleDtoImplCopyWith<_$LetterExampleDtoImpl> get copyWith =>
      __$$LetterExampleDtoImplCopyWithImpl<_$LetterExampleDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LetterExampleDtoImplToJson(
      this,
    );
  }
}

abstract class _LetterExampleDto extends LetterExampleDto {
  const factory _LetterExampleDto(
          {@JsonKey(defaultValue: '') required final String title,
          @JsonKey(defaultValue: '') required final String image,
          @JsonKey(defaultValue: '') required final String audio}) =
      _$LetterExampleDtoImpl;
  const _LetterExampleDto._() : super._();

  factory _LetterExampleDto.fromJson(Map<String, dynamic> json) =
      _$LetterExampleDtoImpl.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: '')
  String get image;
  @override
  @JsonKey(defaultValue: '')
  String get audio;

  /// Create a copy of LetterExampleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LetterExampleDtoImplCopyWith<_$LetterExampleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LetterSpellDto _$LetterSpellDtoFromJson(Map<String, dynamic> json) {
  return _LetterSpellDto.fromJson(json);
}

/// @nodoc
mixin _$LetterSpellDto {
  @JsonKey(defaultValue: <String>[])
  List<String> get spells => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get accents => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get audioSpell => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get audioAccent => throw _privateConstructorUsedError;

  /// Serializes this LetterSpellDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LetterSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LetterSpellDtoCopyWith<LetterSpellDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterSpellDtoCopyWith<$Res> {
  factory $LetterSpellDtoCopyWith(
          LetterSpellDto value, $Res Function(LetterSpellDto) then) =
      _$LetterSpellDtoCopyWithImpl<$Res, LetterSpellDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: <String>[]) List<String> spells,
      @JsonKey(defaultValue: <String>[]) List<String> accents,
      @JsonKey(defaultValue: '') String audioSpell,
      @JsonKey(defaultValue: '') String audioAccent});
}

/// @nodoc
class _$LetterSpellDtoCopyWithImpl<$Res, $Val extends LetterSpellDto>
    implements $LetterSpellDtoCopyWith<$Res> {
  _$LetterSpellDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LetterSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spells = null,
    Object? accents = null,
    Object? audioSpell = null,
    Object? audioAccent = null,
  }) {
    return _then(_value.copyWith(
      spells: null == spells
          ? _value.spells
          : spells // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accents: null == accents
          ? _value.accents
          : accents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audioSpell: null == audioSpell
          ? _value.audioSpell
          : audioSpell // ignore: cast_nullable_to_non_nullable
              as String,
      audioAccent: null == audioAccent
          ? _value.audioAccent
          : audioAccent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LetterSpellDtoImplCopyWith<$Res>
    implements $LetterSpellDtoCopyWith<$Res> {
  factory _$$LetterSpellDtoImplCopyWith(_$LetterSpellDtoImpl value,
          $Res Function(_$LetterSpellDtoImpl) then) =
      __$$LetterSpellDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: <String>[]) List<String> spells,
      @JsonKey(defaultValue: <String>[]) List<String> accents,
      @JsonKey(defaultValue: '') String audioSpell,
      @JsonKey(defaultValue: '') String audioAccent});
}

/// @nodoc
class __$$LetterSpellDtoImplCopyWithImpl<$Res>
    extends _$LetterSpellDtoCopyWithImpl<$Res, _$LetterSpellDtoImpl>
    implements _$$LetterSpellDtoImplCopyWith<$Res> {
  __$$LetterSpellDtoImplCopyWithImpl(
      _$LetterSpellDtoImpl _value, $Res Function(_$LetterSpellDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LetterSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spells = null,
    Object? accents = null,
    Object? audioSpell = null,
    Object? audioAccent = null,
  }) {
    return _then(_$LetterSpellDtoImpl(
      spells: null == spells
          ? _value._spells
          : spells // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accents: null == accents
          ? _value._accents
          : accents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audioSpell: null == audioSpell
          ? _value.audioSpell
          : audioSpell // ignore: cast_nullable_to_non_nullable
              as String,
      audioAccent: null == audioAccent
          ? _value.audioAccent
          : audioAccent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LetterSpellDtoImpl extends _LetterSpellDto {
  const _$LetterSpellDtoImpl(
      {@JsonKey(defaultValue: <String>[]) required final List<String> spells,
      @JsonKey(defaultValue: <String>[]) required final List<String> accents,
      @JsonKey(defaultValue: '') required this.audioSpell,
      @JsonKey(defaultValue: '') required this.audioAccent})
      : _spells = spells,
        _accents = accents,
        super._();

  factory _$LetterSpellDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LetterSpellDtoImplFromJson(json);

  final List<String> _spells;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get spells {
    if (_spells is EqualUnmodifiableListView) return _spells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spells);
  }

  final List<String> _accents;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get accents {
    if (_accents is EqualUnmodifiableListView) return _accents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accents);
  }

  @override
  @JsonKey(defaultValue: '')
  final String audioSpell;
  @override
  @JsonKey(defaultValue: '')
  final String audioAccent;

  @override
  String toString() {
    return 'LetterSpellDto(spells: $spells, accents: $accents, audioSpell: $audioSpell, audioAccent: $audioAccent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetterSpellDtoImpl &&
            const DeepCollectionEquality().equals(other._spells, _spells) &&
            const DeepCollectionEquality().equals(other._accents, _accents) &&
            (identical(other.audioSpell, audioSpell) ||
                other.audioSpell == audioSpell) &&
            (identical(other.audioAccent, audioAccent) ||
                other.audioAccent == audioAccent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_spells),
      const DeepCollectionEquality().hash(_accents),
      audioSpell,
      audioAccent);

  /// Create a copy of LetterSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LetterSpellDtoImplCopyWith<_$LetterSpellDtoImpl> get copyWith =>
      __$$LetterSpellDtoImplCopyWithImpl<_$LetterSpellDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LetterSpellDtoImplToJson(
      this,
    );
  }
}

abstract class _LetterSpellDto extends LetterSpellDto {
  const factory _LetterSpellDto(
      {@JsonKey(defaultValue: <String>[]) required final List<String> spells,
      @JsonKey(defaultValue: <String>[]) required final List<String> accents,
      @JsonKey(defaultValue: '') required final String audioSpell,
      @JsonKey(defaultValue: '')
      required final String audioAccent}) = _$LetterSpellDtoImpl;
  const _LetterSpellDto._() : super._();

  factory _LetterSpellDto.fromJson(Map<String, dynamic> json) =
      _$LetterSpellDtoImpl.fromJson;

  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get spells;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get accents;
  @override
  @JsonKey(defaultValue: '')
  String get audioSpell;
  @override
  @JsonKey(defaultValue: '')
  String get audioAccent;

  /// Create a copy of LetterSpellDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LetterSpellDtoImplCopyWith<_$LetterSpellDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
