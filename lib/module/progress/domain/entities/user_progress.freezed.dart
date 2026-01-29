// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProgress {
  String get id => throw _privateConstructorUsedError;
  ExerciseType get exerciseType => throw _privateConstructorUsedError;
  DateTime? get writeAt => throw _privateConstructorUsedError;
  List<UserExercise> get exercises => throw _privateConstructorUsedError;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProgressCopyWith<UserProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgressCopyWith<$Res> {
  factory $UserProgressCopyWith(
          UserProgress value, $Res Function(UserProgress) then) =
      _$UserProgressCopyWithImpl<$Res, UserProgress>;
  @useResult
  $Res call(
      {String id,
      ExerciseType exerciseType,
      DateTime? writeAt,
      List<UserExercise> exercises});
}

/// @nodoc
class _$UserProgressCopyWithImpl<$Res, $Val extends UserProgress>
    implements $UserProgressCopyWith<$Res> {
  _$UserProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? exerciseType = null,
    Object? writeAt = freezed,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseType: null == exerciseType
          ? _value.exerciseType
          : exerciseType // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      writeAt: freezed == writeAt
          ? _value.writeAt
          : writeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<UserExercise>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProgressImplCopyWith<$Res>
    implements $UserProgressCopyWith<$Res> {
  factory _$$UserProgressImplCopyWith(
          _$UserProgressImpl value, $Res Function(_$UserProgressImpl) then) =
      __$$UserProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ExerciseType exerciseType,
      DateTime? writeAt,
      List<UserExercise> exercises});
}

/// @nodoc
class __$$UserProgressImplCopyWithImpl<$Res>
    extends _$UserProgressCopyWithImpl<$Res, _$UserProgressImpl>
    implements _$$UserProgressImplCopyWith<$Res> {
  __$$UserProgressImplCopyWithImpl(
      _$UserProgressImpl _value, $Res Function(_$UserProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? exerciseType = null,
    Object? writeAt = freezed,
    Object? exercises = null,
  }) {
    return _then(_$UserProgressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseType: null == exerciseType
          ? _value.exerciseType
          : exerciseType // ignore: cast_nullable_to_non_nullable
              as ExerciseType,
      writeAt: freezed == writeAt
          ? _value.writeAt
          : writeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<UserExercise>,
    ));
  }
}

/// @nodoc

class _$UserProgressImpl extends _UserProgress {
  const _$UserProgressImpl(
      {required this.id,
      required this.exerciseType,
      required this.writeAt,
      required final List<UserExercise> exercises})
      : _exercises = exercises,
        super._();

  @override
  final String id;
  @override
  final ExerciseType exerciseType;
  @override
  final DateTime? writeAt;
  final List<UserExercise> _exercises;
  @override
  List<UserExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'UserProgress(id: $id, exerciseType: $exerciseType, writeAt: $writeAt, exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exerciseType, exerciseType) ||
                other.exerciseType == exerciseType) &&
            (identical(other.writeAt, writeAt) || other.writeAt == writeAt) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, exerciseType, writeAt,
      const DeepCollectionEquality().hash(_exercises));

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      __$$UserProgressImplCopyWithImpl<_$UserProgressImpl>(this, _$identity);
}

abstract class _UserProgress extends UserProgress {
  const factory _UserProgress(
      {required final String id,
      required final ExerciseType exerciseType,
      required final DateTime? writeAt,
      required final List<UserExercise> exercises}) = _$UserProgressImpl;
  const _UserProgress._() : super._();

  @override
  String get id;
  @override
  ExerciseType get exerciseType;
  @override
  DateTime? get writeAt;
  @override
  List<UserExercise> get exercises;

  /// Create a copy of UserProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProgressImplCopyWith<_$UserProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserExercise {
  String get id => throw _privateConstructorUsedError;
  String get lastAnswer => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Create a copy of UserExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserExerciseCopyWith<UserExercise> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExerciseCopyWith<$Res> {
  factory $UserExerciseCopyWith(
          UserExercise value, $Res Function(UserExercise) then) =
      _$UserExerciseCopyWithImpl<$Res, UserExercise>;
  @useResult
  $Res call({String id, String lastAnswer, bool isCorrect});
}

/// @nodoc
class _$UserExerciseCopyWithImpl<$Res, $Val extends UserExercise>
    implements $UserExerciseCopyWith<$Res> {
  _$UserExerciseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastAnswer = null,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastAnswer: null == lastAnswer
          ? _value.lastAnswer
          : lastAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserExerciseImplCopyWith<$Res>
    implements $UserExerciseCopyWith<$Res> {
  factory _$$UserExerciseImplCopyWith(
          _$UserExerciseImpl value, $Res Function(_$UserExerciseImpl) then) =
      __$$UserExerciseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String lastAnswer, bool isCorrect});
}

/// @nodoc
class __$$UserExerciseImplCopyWithImpl<$Res>
    extends _$UserExerciseCopyWithImpl<$Res, _$UserExerciseImpl>
    implements _$$UserExerciseImplCopyWith<$Res> {
  __$$UserExerciseImplCopyWithImpl(
      _$UserExerciseImpl _value, $Res Function(_$UserExerciseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserExercise
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastAnswer = null,
    Object? isCorrect = null,
  }) {
    return _then(_$UserExerciseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastAnswer: null == lastAnswer
          ? _value.lastAnswer
          : lastAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserExerciseImpl extends _UserExercise {
  const _$UserExerciseImpl(
      {required this.id, required this.lastAnswer, required this.isCorrect})
      : super._();

  @override
  final String id;
  @override
  final String lastAnswer;
  @override
  final bool isCorrect;

  @override
  String toString() {
    return 'UserExercise(id: $id, lastAnswer: $lastAnswer, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserExerciseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastAnswer, lastAnswer) ||
                other.lastAnswer == lastAnswer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, lastAnswer, isCorrect);

  /// Create a copy of UserExercise
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserExerciseImplCopyWith<_$UserExerciseImpl> get copyWith =>
      __$$UserExerciseImplCopyWithImpl<_$UserExerciseImpl>(this, _$identity);
}

abstract class _UserExercise extends UserExercise {
  const factory _UserExercise(
      {required final String id,
      required final String lastAnswer,
      required final bool isCorrect}) = _$UserExerciseImpl;
  const _UserExercise._() : super._();

  @override
  String get id;
  @override
  String get lastAnswer;
  @override
  bool get isCorrect;

  /// Create a copy of UserExercise
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserExerciseImplCopyWith<_$UserExerciseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
