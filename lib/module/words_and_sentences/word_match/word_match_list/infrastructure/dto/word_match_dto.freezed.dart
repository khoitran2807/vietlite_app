// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_match_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordMatchDto _$WordMatchDtoFromJson(Map<String, dynamic> json) {
  return _WordMatchDto.fromJson(json);
}

/// @nodoc
mixin _$WordMatchDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get order => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get totalExercises => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<WordMatchExerciseDto> get exercises =>
      throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isPremium => throw _privateConstructorUsedError;

  /// Serializes this WordMatchDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordMatchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordMatchDtoCopyWith<WordMatchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordMatchDtoCopyWith<$Res> {
  factory $WordMatchDtoCopyWith(
          WordMatchDto value, $Res Function(WordMatchDto) then) =
      _$WordMatchDtoCopyWithImpl<$Res, WordMatchDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: 0) int order,
      @JsonKey(defaultValue: 0) int totalExercises,
      @JsonKey(defaultValue: []) List<WordMatchExerciseDto> exercises,
      @JsonKey(defaultValue: false) bool isPremium});
}

/// @nodoc
class _$WordMatchDtoCopyWithImpl<$Res, $Val extends WordMatchDto>
    implements $WordMatchDtoCopyWith<$Res> {
  _$WordMatchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordMatchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? order = null,
    Object? totalExercises = null,
    Object? exercises = null,
    Object? isPremium = null,
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
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WordMatchExerciseDto>,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordMatchDtoImplCopyWith<$Res>
    implements $WordMatchDtoCopyWith<$Res> {
  factory _$$WordMatchDtoImplCopyWith(
          _$WordMatchDtoImpl value, $Res Function(_$WordMatchDtoImpl) then) =
      __$$WordMatchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: 0) int order,
      @JsonKey(defaultValue: 0) int totalExercises,
      @JsonKey(defaultValue: []) List<WordMatchExerciseDto> exercises,
      @JsonKey(defaultValue: false) bool isPremium});
}

/// @nodoc
class __$$WordMatchDtoImplCopyWithImpl<$Res>
    extends _$WordMatchDtoCopyWithImpl<$Res, _$WordMatchDtoImpl>
    implements _$$WordMatchDtoImplCopyWith<$Res> {
  __$$WordMatchDtoImplCopyWithImpl(
      _$WordMatchDtoImpl _value, $Res Function(_$WordMatchDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordMatchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? order = null,
    Object? totalExercises = null,
    Object? exercises = null,
    Object? isPremium = null,
  }) {
    return _then(_$WordMatchDtoImpl(
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
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WordMatchExerciseDto>,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordMatchDtoImpl extends _WordMatchDto {
  const _$WordMatchDtoImpl(
      {required this.id,
      @JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: 0) required this.order,
      @JsonKey(defaultValue: 0) required this.totalExercises,
      @JsonKey(defaultValue: [])
      required final List<WordMatchExerciseDto> exercises,
      @JsonKey(defaultValue: false) required this.isPremium})
      : _exercises = exercises,
        super._();

  factory _$WordMatchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordMatchDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: 0)
  final int order;
  @override
  @JsonKey(defaultValue: 0)
  final int totalExercises;
  final List<WordMatchExerciseDto> _exercises;
  @override
  @JsonKey(defaultValue: [])
  List<WordMatchExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  @JsonKey(defaultValue: false)
  final bool isPremium;

  @override
  String toString() {
    return 'WordMatchDto(id: $id, title: $title, order: $order, totalExercises: $totalExercises, exercises: $exercises, isPremium: $isPremium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordMatchDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, order, totalExercises,
      const DeepCollectionEquality().hash(_exercises), isPremium);

  /// Create a copy of WordMatchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordMatchDtoImplCopyWith<_$WordMatchDtoImpl> get copyWith =>
      __$$WordMatchDtoImplCopyWithImpl<_$WordMatchDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordMatchDtoImplToJson(
      this,
    );
  }
}

abstract class _WordMatchDto extends WordMatchDto {
  const factory _WordMatchDto(
          {required final String id,
          @JsonKey(defaultValue: '') required final String title,
          @JsonKey(defaultValue: 0) required final int order,
          @JsonKey(defaultValue: 0) required final int totalExercises,
          @JsonKey(defaultValue: [])
          required final List<WordMatchExerciseDto> exercises,
          @JsonKey(defaultValue: false) required final bool isPremium}) =
      _$WordMatchDtoImpl;
  const _WordMatchDto._() : super._();

  factory _WordMatchDto.fromJson(Map<String, dynamic> json) =
      _$WordMatchDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: 0)
  int get order;
  @override
  @JsonKey(defaultValue: 0)
  int get totalExercises;
  @override
  @JsonKey(defaultValue: [])
  List<WordMatchExerciseDto> get exercises;
  @override
  @JsonKey(defaultValue: false)
  bool get isPremium;

  /// Create a copy of WordMatchDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordMatchDtoImplCopyWith<_$WordMatchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordMatchExerciseDto _$WordMatchExerciseDtoFromJson(Map<String, dynamic> json) {
  return _WordMatchExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$WordMatchExerciseDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get answer => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get choices => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get image => throw _privateConstructorUsedError;

  /// Serializes this WordMatchExerciseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordMatchExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordMatchExerciseDtoCopyWith<WordMatchExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordMatchExerciseDtoCopyWith<$Res> {
  factory $WordMatchExerciseDtoCopyWith(WordMatchExerciseDto value,
          $Res Function(WordMatchExerciseDto) then) =
      _$WordMatchExerciseDtoCopyWithImpl<$Res, WordMatchExerciseDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String answer,
      @JsonKey(defaultValue: <String>[]) List<String> choices,
      @JsonKey(defaultValue: '') String image});
}

/// @nodoc
class _$WordMatchExerciseDtoCopyWithImpl<$Res,
        $Val extends WordMatchExerciseDto>
    implements $WordMatchExerciseDtoCopyWith<$Res> {
  _$WordMatchExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordMatchExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? choices = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordMatchExerciseDtoImplCopyWith<$Res>
    implements $WordMatchExerciseDtoCopyWith<$Res> {
  factory _$$WordMatchExerciseDtoImplCopyWith(_$WordMatchExerciseDtoImpl value,
          $Res Function(_$WordMatchExerciseDtoImpl) then) =
      __$$WordMatchExerciseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String answer,
      @JsonKey(defaultValue: <String>[]) List<String> choices,
      @JsonKey(defaultValue: '') String image});
}

/// @nodoc
class __$$WordMatchExerciseDtoImplCopyWithImpl<$Res>
    extends _$WordMatchExerciseDtoCopyWithImpl<$Res, _$WordMatchExerciseDtoImpl>
    implements _$$WordMatchExerciseDtoImplCopyWith<$Res> {
  __$$WordMatchExerciseDtoImplCopyWithImpl(_$WordMatchExerciseDtoImpl _value,
      $Res Function(_$WordMatchExerciseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordMatchExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? choices = null,
    Object? image = null,
  }) {
    return _then(_$WordMatchExerciseDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordMatchExerciseDtoImpl extends _WordMatchExerciseDto {
  const _$WordMatchExerciseDtoImpl(
      {required this.id,
      @JsonKey(defaultValue: '') required this.answer,
      @JsonKey(defaultValue: <String>[]) required final List<String> choices,
      @JsonKey(defaultValue: '') required this.image})
      : _choices = choices,
        super._();

  factory _$WordMatchExerciseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordMatchExerciseDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String answer;
  final List<String> _choices;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  @JsonKey(defaultValue: '')
  final String image;

  @override
  String toString() {
    return 'WordMatchExerciseDto(id: $id, answer: $answer, choices: $choices, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordMatchExerciseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, answer,
      const DeepCollectionEquality().hash(_choices), image);

  /// Create a copy of WordMatchExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordMatchExerciseDtoImplCopyWith<_$WordMatchExerciseDtoImpl>
      get copyWith =>
          __$$WordMatchExerciseDtoImplCopyWithImpl<_$WordMatchExerciseDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordMatchExerciseDtoImplToJson(
      this,
    );
  }
}

abstract class _WordMatchExerciseDto extends WordMatchExerciseDto {
  const factory _WordMatchExerciseDto(
      {required final String id,
      @JsonKey(defaultValue: '') required final String answer,
      @JsonKey(defaultValue: <String>[]) required final List<String> choices,
      @JsonKey(defaultValue: '')
      required final String image}) = _$WordMatchExerciseDtoImpl;
  const _WordMatchExerciseDto._() : super._();

  factory _WordMatchExerciseDto.fromJson(Map<String, dynamic> json) =
      _$WordMatchExerciseDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get answer;
  @override
  @JsonKey(defaultValue: <String>[])
  List<String> get choices;
  @override
  @JsonKey(defaultValue: '')
  String get image;

  /// Create a copy of WordMatchExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordMatchExerciseDtoImplCopyWith<_$WordMatchExerciseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
