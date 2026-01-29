// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Number {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get textTitle => throw _privateConstructorUsedError;
  String get audio => throw _privateConstructorUsedError;
  NumberSpell get spell => throw _privateConstructorUsedError;
  NumberCount get count => throw _privateConstructorUsedError;
  List<CharacterExample> get examples => throw _privateConstructorUsedError;

  /// Create a copy of Number
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberCopyWith<Number> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberCopyWith<$Res> {
  factory $NumberCopyWith(Number value, $Res Function(Number) then) =
      _$NumberCopyWithImpl<$Res, Number>;
  @useResult
  $Res call(
      {String id,
      String title,
      String textTitle,
      String audio,
      NumberSpell spell,
      NumberCount count,
      List<CharacterExample> examples});

  $NumberSpellCopyWith<$Res> get spell;
  $NumberCountCopyWith<$Res> get count;
}

/// @nodoc
class _$NumberCopyWithImpl<$Res, $Val extends Number>
    implements $NumberCopyWith<$Res> {
  _$NumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Number
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? textTitle = null,
    Object? audio = null,
    Object? spell = null,
    Object? count = null,
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
      textTitle: null == textTitle
          ? _value.textTitle
          : textTitle // ignore: cast_nullable_to_non_nullable
              as String,
      audio: null == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      spell: null == spell
          ? _value.spell
          : spell // ignore: cast_nullable_to_non_nullable
              as NumberSpell,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as NumberCount,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<CharacterExample>,
    ) as $Val);
  }

  /// Create a copy of Number
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NumberSpellCopyWith<$Res> get spell {
    return $NumberSpellCopyWith<$Res>(_value.spell, (value) {
      return _then(_value.copyWith(spell: value) as $Val);
    });
  }

  /// Create a copy of Number
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NumberCountCopyWith<$Res> get count {
    return $NumberCountCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NumberImplCopyWith<$Res> implements $NumberCopyWith<$Res> {
  factory _$$NumberImplCopyWith(
          _$NumberImpl value, $Res Function(_$NumberImpl) then) =
      __$$NumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String textTitle,
      String audio,
      NumberSpell spell,
      NumberCount count,
      List<CharacterExample> examples});

  @override
  $NumberSpellCopyWith<$Res> get spell;
  @override
  $NumberCountCopyWith<$Res> get count;
}

/// @nodoc
class __$$NumberImplCopyWithImpl<$Res>
    extends _$NumberCopyWithImpl<$Res, _$NumberImpl>
    implements _$$NumberImplCopyWith<$Res> {
  __$$NumberImplCopyWithImpl(
      _$NumberImpl _value, $Res Function(_$NumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of Number
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? textTitle = null,
    Object? audio = null,
    Object? spell = null,
    Object? count = null,
    Object? examples = null,
  }) {
    return _then(_$NumberImpl(
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
      spell: null == spell
          ? _value.spell
          : spell // ignore: cast_nullable_to_non_nullable
              as NumberSpell,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as NumberCount,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<CharacterExample>,
    ));
  }
}

/// @nodoc

class _$NumberImpl extends _Number {
  const _$NumberImpl(
      {required this.id,
      required this.title,
      required this.textTitle,
      required this.audio,
      required this.spell,
      required this.count,
      required final List<CharacterExample> examples})
      : _examples = examples,
        super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final String textTitle;
  @override
  final String audio;
  @override
  final NumberSpell spell;
  @override
  final NumberCount count;
  final List<CharacterExample> _examples;
  @override
  List<CharacterExample> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  @override
  String toString() {
    return 'Number(id: $id, title: $title, textTitle: $textTitle, audio: $audio, spell: $spell, count: $count, examples: $examples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.textTitle, textTitle) ||
                other.textTitle == textTitle) &&
            (identical(other.audio, audio) || other.audio == audio) &&
            (identical(other.spell, spell) || other.spell == spell) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, textTitle, audio,
      spell, count, const DeepCollectionEquality().hash(_examples));

  /// Create a copy of Number
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberImplCopyWith<_$NumberImpl> get copyWith =>
      __$$NumberImplCopyWithImpl<_$NumberImpl>(this, _$identity);
}

abstract class _Number extends Number {
  const factory _Number(
      {required final String id,
      required final String title,
      required final String textTitle,
      required final String audio,
      required final NumberSpell spell,
      required final NumberCount count,
      required final List<CharacterExample> examples}) = _$NumberImpl;
  const _Number._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  String get textTitle;
  @override
  String get audio;
  @override
  NumberSpell get spell;
  @override
  NumberCount get count;
  @override
  List<CharacterExample> get examples;

  /// Create a copy of Number
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberImplCopyWith<_$NumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NumberSpell {
  String get audio => throw _privateConstructorUsedError;
  List<String> get details => throw _privateConstructorUsedError;

  /// Create a copy of NumberSpell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberSpellCopyWith<NumberSpell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberSpellCopyWith<$Res> {
  factory $NumberSpellCopyWith(
          NumberSpell value, $Res Function(NumberSpell) then) =
      _$NumberSpellCopyWithImpl<$Res, NumberSpell>;
  @useResult
  $Res call({String audio, List<String> details});
}

/// @nodoc
class _$NumberSpellCopyWithImpl<$Res, $Val extends NumberSpell>
    implements $NumberSpellCopyWith<$Res> {
  _$NumberSpellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberSpell
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
abstract class _$$NumberSpellImplCopyWith<$Res>
    implements $NumberSpellCopyWith<$Res> {
  factory _$$NumberSpellImplCopyWith(
          _$NumberSpellImpl value, $Res Function(_$NumberSpellImpl) then) =
      __$$NumberSpellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String audio, List<String> details});
}

/// @nodoc
class __$$NumberSpellImplCopyWithImpl<$Res>
    extends _$NumberSpellCopyWithImpl<$Res, _$NumberSpellImpl>
    implements _$$NumberSpellImplCopyWith<$Res> {
  __$$NumberSpellImplCopyWithImpl(
      _$NumberSpellImpl _value, $Res Function(_$NumberSpellImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberSpell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audio = null,
    Object? details = null,
  }) {
    return _then(_$NumberSpellImpl(
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

class _$NumberSpellImpl extends _NumberSpell {
  const _$NumberSpellImpl(
      {required this.audio, required final List<String> details})
      : _details = details,
        super._();

  @override
  final String audio;
  final List<String> _details;
  @override
  List<String> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'NumberSpell(audio: $audio, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberSpellImpl &&
            (identical(other.audio, audio) || other.audio == audio) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, audio, const DeepCollectionEquality().hash(_details));

  /// Create a copy of NumberSpell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberSpellImplCopyWith<_$NumberSpellImpl> get copyWith =>
      __$$NumberSpellImplCopyWithImpl<_$NumberSpellImpl>(this, _$identity);
}

abstract class _NumberSpell extends NumberSpell {
  const factory _NumberSpell(
      {required final String audio,
      required final List<String> details}) = _$NumberSpellImpl;
  const _NumberSpell._() : super._();

  @override
  String get audio;
  @override
  List<String> get details;

  /// Create a copy of NumberSpell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberSpellImplCopyWith<_$NumberSpellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NumberCount {
  String get noColor => throw _privateConstructorUsedError;
  String get colored => throw _privateConstructorUsedError;

  /// Create a copy of NumberCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberCountCopyWith<NumberCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberCountCopyWith<$Res> {
  factory $NumberCountCopyWith(
          NumberCount value, $Res Function(NumberCount) then) =
      _$NumberCountCopyWithImpl<$Res, NumberCount>;
  @useResult
  $Res call({String noColor, String colored});
}

/// @nodoc
class _$NumberCountCopyWithImpl<$Res, $Val extends NumberCount>
    implements $NumberCountCopyWith<$Res> {
  _$NumberCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberCount
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
abstract class _$$NumberCountImplCopyWith<$Res>
    implements $NumberCountCopyWith<$Res> {
  factory _$$NumberCountImplCopyWith(
          _$NumberCountImpl value, $Res Function(_$NumberCountImpl) then) =
      __$$NumberCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String noColor, String colored});
}

/// @nodoc
class __$$NumberCountImplCopyWithImpl<$Res>
    extends _$NumberCountCopyWithImpl<$Res, _$NumberCountImpl>
    implements _$$NumberCountImplCopyWith<$Res> {
  __$$NumberCountImplCopyWithImpl(
      _$NumberCountImpl _value, $Res Function(_$NumberCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumberCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noColor = null,
    Object? colored = null,
  }) {
    return _then(_$NumberCountImpl(
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

class _$NumberCountImpl extends _NumberCount {
  const _$NumberCountImpl({required this.noColor, required this.colored})
      : super._();

  @override
  final String noColor;
  @override
  final String colored;

  @override
  String toString() {
    return 'NumberCount(noColor: $noColor, colored: $colored)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberCountImpl &&
            (identical(other.noColor, noColor) || other.noColor == noColor) &&
            (identical(other.colored, colored) || other.colored == colored));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noColor, colored);

  /// Create a copy of NumberCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberCountImplCopyWith<_$NumberCountImpl> get copyWith =>
      __$$NumberCountImplCopyWithImpl<_$NumberCountImpl>(this, _$identity);
}

abstract class _NumberCount extends NumberCount {
  const factory _NumberCount(
      {required final String noColor,
      required final String colored}) = _$NumberCountImpl;
  const _NumberCount._() : super._();

  @override
  String get noColor;
  @override
  String get colored;

  /// Create a copy of NumberCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberCountImplCopyWith<_$NumberCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
