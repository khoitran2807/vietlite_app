// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Letter {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String get audioTitle => throw _privateConstructorUsedError;
  LetterSpell get spell => throw _privateConstructorUsedError;
  CharacterExample get mainExample => throw _privateConstructorUsedError;
  List<CharacterExample> get examples => throw _privateConstructorUsedError;

  /// Create a copy of Letter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LetterCopyWith<Letter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterCopyWith<$Res> {
  factory $LetterCopyWith(Letter value, $Res Function(Letter) then) =
      _$LetterCopyWithImpl<$Res, Letter>;
  @useResult
  $Res call(
      {String id,
      String title,
      int order,
      String audioTitle,
      LetterSpell spell,
      CharacterExample mainExample,
      List<CharacterExample> examples});

  $LetterSpellCopyWith<$Res> get spell;
  $CharacterExampleCopyWith<$Res> get mainExample;
}

/// @nodoc
class _$LetterCopyWithImpl<$Res, $Val extends Letter>
    implements $LetterCopyWith<$Res> {
  _$LetterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Letter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? order = null,
    Object? audioTitle = null,
    Object? spell = null,
    Object? mainExample = null,
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
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      audioTitle: null == audioTitle
          ? _value.audioTitle
          : audioTitle // ignore: cast_nullable_to_non_nullable
              as String,
      spell: null == spell
          ? _value.spell
          : spell // ignore: cast_nullable_to_non_nullable
              as LetterSpell,
      mainExample: null == mainExample
          ? _value.mainExample
          : mainExample // ignore: cast_nullable_to_non_nullable
              as CharacterExample,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<CharacterExample>,
    ) as $Val);
  }

  /// Create a copy of Letter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LetterSpellCopyWith<$Res> get spell {
    return $LetterSpellCopyWith<$Res>(_value.spell, (value) {
      return _then(_value.copyWith(spell: value) as $Val);
    });
  }

  /// Create a copy of Letter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterExampleCopyWith<$Res> get mainExample {
    return $CharacterExampleCopyWith<$Res>(_value.mainExample, (value) {
      return _then(_value.copyWith(mainExample: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LetterImplCopyWith<$Res> implements $LetterCopyWith<$Res> {
  factory _$$LetterImplCopyWith(
          _$LetterImpl value, $Res Function(_$LetterImpl) then) =
      __$$LetterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      int order,
      String audioTitle,
      LetterSpell spell,
      CharacterExample mainExample,
      List<CharacterExample> examples});

  @override
  $LetterSpellCopyWith<$Res> get spell;
  @override
  $CharacterExampleCopyWith<$Res> get mainExample;
}

/// @nodoc
class __$$LetterImplCopyWithImpl<$Res>
    extends _$LetterCopyWithImpl<$Res, _$LetterImpl>
    implements _$$LetterImplCopyWith<$Res> {
  __$$LetterImplCopyWithImpl(
      _$LetterImpl _value, $Res Function(_$LetterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Letter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? order = null,
    Object? audioTitle = null,
    Object? spell = null,
    Object? mainExample = null,
    Object? examples = null,
  }) {
    return _then(_$LetterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      audioTitle: null == audioTitle
          ? _value.audioTitle
          : audioTitle // ignore: cast_nullable_to_non_nullable
              as String,
      spell: null == spell
          ? _value.spell
          : spell // ignore: cast_nullable_to_non_nullable
              as LetterSpell,
      mainExample: null == mainExample
          ? _value.mainExample
          : mainExample // ignore: cast_nullable_to_non_nullable
              as CharacterExample,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<CharacterExample>,
    ));
  }
}

/// @nodoc

class _$LetterImpl extends _Letter {
  const _$LetterImpl(
      {required this.id,
      required this.title,
      required this.order,
      required this.audioTitle,
      required this.spell,
      required this.mainExample,
      required final List<CharacterExample> examples})
      : _examples = examples,
        super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final int order;
  @override
  final String audioTitle;
  @override
  final LetterSpell spell;
  @override
  final CharacterExample mainExample;
  final List<CharacterExample> _examples;
  @override
  List<CharacterExample> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

  @override
  String toString() {
    return 'Letter(id: $id, title: $title, order: $order, audioTitle: $audioTitle, spell: $spell, mainExample: $mainExample, examples: $examples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.audioTitle, audioTitle) ||
                other.audioTitle == audioTitle) &&
            (identical(other.spell, spell) || other.spell == spell) &&
            (identical(other.mainExample, mainExample) ||
                other.mainExample == mainExample) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, order, audioTitle,
      spell, mainExample, const DeepCollectionEquality().hash(_examples));

  /// Create a copy of Letter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LetterImplCopyWith<_$LetterImpl> get copyWith =>
      __$$LetterImplCopyWithImpl<_$LetterImpl>(this, _$identity);
}

abstract class _Letter extends Letter {
  const factory _Letter(
      {required final String id,
      required final String title,
      required final int order,
      required final String audioTitle,
      required final LetterSpell spell,
      required final CharacterExample mainExample,
      required final List<CharacterExample> examples}) = _$LetterImpl;
  const _Letter._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  int get order;
  @override
  String get audioTitle;
  @override
  LetterSpell get spell;
  @override
  CharacterExample get mainExample;
  @override
  List<CharacterExample> get examples;

  /// Create a copy of Letter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LetterImplCopyWith<_$LetterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LetterSpell {
  List<String> get accents => throw _privateConstructorUsedError;
  String get audioAccent => throw _privateConstructorUsedError;
  List<String> get spells => throw _privateConstructorUsedError;
  String get audioSpell => throw _privateConstructorUsedError;

  /// Create a copy of LetterSpell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LetterSpellCopyWith<LetterSpell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterSpellCopyWith<$Res> {
  factory $LetterSpellCopyWith(
          LetterSpell value, $Res Function(LetterSpell) then) =
      _$LetterSpellCopyWithImpl<$Res, LetterSpell>;
  @useResult
  $Res call(
      {List<String> accents,
      String audioAccent,
      List<String> spells,
      String audioSpell});
}

/// @nodoc
class _$LetterSpellCopyWithImpl<$Res, $Val extends LetterSpell>
    implements $LetterSpellCopyWith<$Res> {
  _$LetterSpellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LetterSpell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accents = null,
    Object? audioAccent = null,
    Object? spells = null,
    Object? audioSpell = null,
  }) {
    return _then(_value.copyWith(
      accents: null == accents
          ? _value.accents
          : accents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audioAccent: null == audioAccent
          ? _value.audioAccent
          : audioAccent // ignore: cast_nullable_to_non_nullable
              as String,
      spells: null == spells
          ? _value.spells
          : spells // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audioSpell: null == audioSpell
          ? _value.audioSpell
          : audioSpell // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LetterSpellImplCopyWith<$Res>
    implements $LetterSpellCopyWith<$Res> {
  factory _$$LetterSpellImplCopyWith(
          _$LetterSpellImpl value, $Res Function(_$LetterSpellImpl) then) =
      __$$LetterSpellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> accents,
      String audioAccent,
      List<String> spells,
      String audioSpell});
}

/// @nodoc
class __$$LetterSpellImplCopyWithImpl<$Res>
    extends _$LetterSpellCopyWithImpl<$Res, _$LetterSpellImpl>
    implements _$$LetterSpellImplCopyWith<$Res> {
  __$$LetterSpellImplCopyWithImpl(
      _$LetterSpellImpl _value, $Res Function(_$LetterSpellImpl) _then)
      : super(_value, _then);

  /// Create a copy of LetterSpell
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accents = null,
    Object? audioAccent = null,
    Object? spells = null,
    Object? audioSpell = null,
  }) {
    return _then(_$LetterSpellImpl(
      accents: null == accents
          ? _value._accents
          : accents // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audioAccent: null == audioAccent
          ? _value.audioAccent
          : audioAccent // ignore: cast_nullable_to_non_nullable
              as String,
      spells: null == spells
          ? _value._spells
          : spells // ignore: cast_nullable_to_non_nullable
              as List<String>,
      audioSpell: null == audioSpell
          ? _value.audioSpell
          : audioSpell // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LetterSpellImpl extends _LetterSpell {
  const _$LetterSpellImpl(
      {required final List<String> accents,
      required this.audioAccent,
      required final List<String> spells,
      required this.audioSpell})
      : _accents = accents,
        _spells = spells,
        super._();

  final List<String> _accents;
  @override
  List<String> get accents {
    if (_accents is EqualUnmodifiableListView) return _accents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accents);
  }

  @override
  final String audioAccent;
  final List<String> _spells;
  @override
  List<String> get spells {
    if (_spells is EqualUnmodifiableListView) return _spells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spells);
  }

  @override
  final String audioSpell;

  @override
  String toString() {
    return 'LetterSpell(accents: $accents, audioAccent: $audioAccent, spells: $spells, audioSpell: $audioSpell)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetterSpellImpl &&
            const DeepCollectionEquality().equals(other._accents, _accents) &&
            (identical(other.audioAccent, audioAccent) ||
                other.audioAccent == audioAccent) &&
            const DeepCollectionEquality().equals(other._spells, _spells) &&
            (identical(other.audioSpell, audioSpell) ||
                other.audioSpell == audioSpell));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_accents),
      audioAccent,
      const DeepCollectionEquality().hash(_spells),
      audioSpell);

  /// Create a copy of LetterSpell
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LetterSpellImplCopyWith<_$LetterSpellImpl> get copyWith =>
      __$$LetterSpellImplCopyWithImpl<_$LetterSpellImpl>(this, _$identity);
}

abstract class _LetterSpell extends LetterSpell {
  const factory _LetterSpell(
      {required final List<String> accents,
      required final String audioAccent,
      required final List<String> spells,
      required final String audioSpell}) = _$LetterSpellImpl;
  const _LetterSpell._() : super._();

  @override
  List<String> get accents;
  @override
  String get audioAccent;
  @override
  List<String> get spells;
  @override
  String get audioSpell;

  /// Create a copy of LetterSpell
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LetterSpellImplCopyWith<_$LetterSpellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
