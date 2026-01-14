// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_selection_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordSelectionDto _$WordSelectionDtoFromJson(Map<String, dynamic> json) {
  return _WordSelectionDto.fromJson(json);
}

/// @nodoc
mixin _$WordSelectionDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get totalExercises => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get order => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<WordSelectionExerciseDto> get exercises =>
      throw _privateConstructorUsedError;

  /// Serializes this WordSelectionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordSelectionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSelectionDtoCopyWith<WordSelectionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSelectionDtoCopyWith<$Res> {
  factory $WordSelectionDtoCopyWith(
          WordSelectionDto value, $Res Function(WordSelectionDto) then) =
      _$WordSelectionDtoCopyWithImpl<$Res, WordSelectionDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: 0) int totalExercises,
      @JsonKey(defaultValue: 0) int order,
      @JsonKey(defaultValue: []) List<WordSelectionExerciseDto> exercises});
}

/// @nodoc
class _$WordSelectionDtoCopyWithImpl<$Res, $Val extends WordSelectionDto>
    implements $WordSelectionDtoCopyWith<$Res> {
  _$WordSelectionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSelectionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? totalExercises = null,
    Object? order = null,
    Object? exercises = null,
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
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WordSelectionExerciseDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordSelectionDtoImplCopyWith<$Res>
    implements $WordSelectionDtoCopyWith<$Res> {
  factory _$$WordSelectionDtoImplCopyWith(_$WordSelectionDtoImpl value,
          $Res Function(_$WordSelectionDtoImpl) then) =
      __$$WordSelectionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String title,
      @JsonKey(defaultValue: 0) int totalExercises,
      @JsonKey(defaultValue: 0) int order,
      @JsonKey(defaultValue: []) List<WordSelectionExerciseDto> exercises});
}

/// @nodoc
class __$$WordSelectionDtoImplCopyWithImpl<$Res>
    extends _$WordSelectionDtoCopyWithImpl<$Res, _$WordSelectionDtoImpl>
    implements _$$WordSelectionDtoImplCopyWith<$Res> {
  __$$WordSelectionDtoImplCopyWithImpl(_$WordSelectionDtoImpl _value,
      $Res Function(_$WordSelectionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordSelectionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? totalExercises = null,
    Object? order = null,
    Object? exercises = null,
  }) {
    return _then(_$WordSelectionDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<WordSelectionExerciseDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordSelectionDtoImpl extends _WordSelectionDto {
  const _$WordSelectionDtoImpl(
      {required this.id,
      @JsonKey(defaultValue: '') required this.title,
      @JsonKey(defaultValue: 0) required this.totalExercises,
      @JsonKey(defaultValue: 0) required this.order,
      @JsonKey(defaultValue: [])
      required final List<WordSelectionExerciseDto> exercises})
      : _exercises = exercises,
        super._();

  factory _$WordSelectionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordSelectionDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String title;
  @override
  @JsonKey(defaultValue: 0)
  final int totalExercises;
  @override
  @JsonKey(defaultValue: 0)
  final int order;
  final List<WordSelectionExerciseDto> _exercises;
  @override
  @JsonKey(defaultValue: [])
  List<WordSelectionExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WordSelectionDto(id: $id, title: $title, totalExercises: $totalExercises, order: $order, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSelectionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, totalExercises, order,
      const DeepCollectionEquality().hash(_exercises));

  /// Create a copy of WordSelectionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSelectionDtoImplCopyWith<_$WordSelectionDtoImpl> get copyWith =>
      __$$WordSelectionDtoImplCopyWithImpl<_$WordSelectionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordSelectionDtoImplToJson(
      this,
    );
  }
}

abstract class _WordSelectionDto extends WordSelectionDto {
  const factory _WordSelectionDto(
          {required final String id,
          @JsonKey(defaultValue: '') required final String title,
          @JsonKey(defaultValue: 0) required final int totalExercises,
          @JsonKey(defaultValue: 0) required final int order,
          @JsonKey(defaultValue: [])
          required final List<WordSelectionExerciseDto> exercises}) =
      _$WordSelectionDtoImpl;
  const _WordSelectionDto._() : super._();

  factory _WordSelectionDto.fromJson(Map<String, dynamic> json) =
      _$WordSelectionDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get title;
  @override
  @JsonKey(defaultValue: 0)
  int get totalExercises;
  @override
  @JsonKey(defaultValue: 0)
  int get order;
  @override
  @JsonKey(defaultValue: [])
  List<WordSelectionExerciseDto> get exercises;

  /// Create a copy of WordSelectionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordSelectionDtoImplCopyWith<_$WordSelectionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordSelectionExerciseDto _$WordSelectionExerciseDtoFromJson(
    Map<String, dynamic> json) {
  return _WordSelectionExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$WordSelectionExerciseDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get answer => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: <String>[])
  List<String> get choices => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get question => throw _privateConstructorUsedError;

  /// Serializes this WordSelectionExerciseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordSelectionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSelectionExerciseDtoCopyWith<WordSelectionExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSelectionExerciseDtoCopyWith<$Res> {
  factory $WordSelectionExerciseDtoCopyWith(WordSelectionExerciseDto value,
          $Res Function(WordSelectionExerciseDto) then) =
      _$WordSelectionExerciseDtoCopyWithImpl<$Res, WordSelectionExerciseDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String answer,
      @JsonKey(defaultValue: <String>[]) List<String> choices,
      @JsonKey(defaultValue: '') String question});
}

/// @nodoc
class _$WordSelectionExerciseDtoCopyWithImpl<$Res,
        $Val extends WordSelectionExerciseDto>
    implements $WordSelectionExerciseDtoCopyWith<$Res> {
  _$WordSelectionExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSelectionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? choices = null,
    Object? question = null,
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
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordSelectionExerciseDtoImplCopyWith<$Res>
    implements $WordSelectionExerciseDtoCopyWith<$Res> {
  factory _$$WordSelectionExerciseDtoImplCopyWith(
          _$WordSelectionExerciseDtoImpl value,
          $Res Function(_$WordSelectionExerciseDtoImpl) then) =
      __$$WordSelectionExerciseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String answer,
      @JsonKey(defaultValue: <String>[]) List<String> choices,
      @JsonKey(defaultValue: '') String question});
}

/// @nodoc
class __$$WordSelectionExerciseDtoImplCopyWithImpl<$Res>
    extends _$WordSelectionExerciseDtoCopyWithImpl<$Res,
        _$WordSelectionExerciseDtoImpl>
    implements _$$WordSelectionExerciseDtoImplCopyWith<$Res> {
  __$$WordSelectionExerciseDtoImplCopyWithImpl(
      _$WordSelectionExerciseDtoImpl _value,
      $Res Function(_$WordSelectionExerciseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordSelectionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? choices = null,
    Object? question = null,
  }) {
    return _then(_$WordSelectionExerciseDtoImpl(
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
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordSelectionExerciseDtoImpl extends _WordSelectionExerciseDto {
  const _$WordSelectionExerciseDtoImpl(
      {required this.id,
      @JsonKey(defaultValue: '') required this.answer,
      @JsonKey(defaultValue: <String>[]) required final List<String> choices,
      @JsonKey(defaultValue: '') required this.question})
      : _choices = choices,
        super._();

  factory _$WordSelectionExerciseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordSelectionExerciseDtoImplFromJson(json);

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
  final String question;

  @override
  String toString() {
    return 'WordSelectionExerciseDto(id: $id, answer: $answer, choices: $choices, question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSelectionExerciseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, answer,
      const DeepCollectionEquality().hash(_choices), question);

  /// Create a copy of WordSelectionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSelectionExerciseDtoImplCopyWith<_$WordSelectionExerciseDtoImpl>
      get copyWith => __$$WordSelectionExerciseDtoImplCopyWithImpl<
          _$WordSelectionExerciseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordSelectionExerciseDtoImplToJson(
      this,
    );
  }
}

abstract class _WordSelectionExerciseDto extends WordSelectionExerciseDto {
  const factory _WordSelectionExerciseDto(
      {required final String id,
      @JsonKey(defaultValue: '') required final String answer,
      @JsonKey(defaultValue: <String>[]) required final List<String> choices,
      @JsonKey(defaultValue: '')
      required final String question}) = _$WordSelectionExerciseDtoImpl;
  const _WordSelectionExerciseDto._() : super._();

  factory _WordSelectionExerciseDto.fromJson(Map<String, dynamic> json) =
      _$WordSelectionExerciseDtoImpl.fromJson;

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
  String get question;

  /// Create a copy of WordSelectionExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordSelectionExerciseDtoImplCopyWith<_$WordSelectionExerciseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
