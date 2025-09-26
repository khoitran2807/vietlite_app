// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProgressDto _$UserProgressDtoFromJson(Map<String, dynamic> json) {
  return _UserProgressDto.fromJson(json);
}

/// @nodoc
mixin _$UserProgressDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timeConvert, defaultValue: null)
  DateTime? get writeAt => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<UserExerciseDto> get exercises => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: ExerciseType.other)
  ExerciseType get exerciseType => throw _privateConstructorUsedError;

  /// Serializes this UserProgressDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProgressDtoCopyWith<UserProgressDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProgressDtoCopyWith<$Res> {
  factory $UserProgressDtoCopyWith(
    UserProgressDto value,
    $Res Function(UserProgressDto) then,
  ) = _$UserProgressDtoCopyWithImpl<$Res, UserProgressDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(fromJson: timeConvert, defaultValue: null) DateTime? writeAt,
    @JsonKey(defaultValue: []) List<UserExerciseDto> exercises,
    @JsonKey(defaultValue: ExerciseType.other) ExerciseType exerciseType,
  });
}

/// @nodoc
class _$UserProgressDtoCopyWithImpl<$Res, $Val extends UserProgressDto>
    implements $UserProgressDtoCopyWith<$Res> {
  _$UserProgressDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? writeAt = freezed,
    Object? exercises = null,
    Object? exerciseType = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            writeAt:
                freezed == writeAt
                    ? _value.writeAt
                    : writeAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            exercises:
                null == exercises
                    ? _value.exercises
                    : exercises // ignore: cast_nullable_to_non_nullable
                        as List<UserExerciseDto>,
            exerciseType:
                null == exerciseType
                    ? _value.exerciseType
                    : exerciseType // ignore: cast_nullable_to_non_nullable
                        as ExerciseType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserProgressDtoImplCopyWith<$Res>
    implements $UserProgressDtoCopyWith<$Res> {
  factory _$$UserProgressDtoImplCopyWith(
    _$UserProgressDtoImpl value,
    $Res Function(_$UserProgressDtoImpl) then,
  ) = __$$UserProgressDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(fromJson: timeConvert, defaultValue: null) DateTime? writeAt,
    @JsonKey(defaultValue: []) List<UserExerciseDto> exercises,
    @JsonKey(defaultValue: ExerciseType.other) ExerciseType exerciseType,
  });
}

/// @nodoc
class __$$UserProgressDtoImplCopyWithImpl<$Res>
    extends _$UserProgressDtoCopyWithImpl<$Res, _$UserProgressDtoImpl>
    implements _$$UserProgressDtoImplCopyWith<$Res> {
  __$$UserProgressDtoImplCopyWithImpl(
    _$UserProgressDtoImpl _value,
    $Res Function(_$UserProgressDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? writeAt = freezed,
    Object? exercises = null,
    Object? exerciseType = null,
  }) {
    return _then(
      _$UserProgressDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        writeAt:
            freezed == writeAt
                ? _value.writeAt
                : writeAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        exercises:
            null == exercises
                ? _value._exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                    as List<UserExerciseDto>,
        exerciseType:
            null == exerciseType
                ? _value.exerciseType
                : exerciseType // ignore: cast_nullable_to_non_nullable
                    as ExerciseType,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProgressDtoImpl extends _UserProgressDto {
  const _$UserProgressDtoImpl({
    required this.id,
    @JsonKey(fromJson: timeConvert, defaultValue: null) required this.writeAt,
    @JsonKey(defaultValue: []) required final List<UserExerciseDto> exercises,
    @JsonKey(defaultValue: ExerciseType.other) required this.exerciseType,
  }) : _exercises = exercises,
       super._();

  factory _$UserProgressDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProgressDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(fromJson: timeConvert, defaultValue: null)
  final DateTime? writeAt;
  final List<UserExerciseDto> _exercises;
  @override
  @JsonKey(defaultValue: [])
  List<UserExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  @JsonKey(defaultValue: ExerciseType.other)
  final ExerciseType exerciseType;

  @override
  String toString() {
    return 'UserProgressDto(id: $id, writeAt: $writeAt, exercises: $exercises, exerciseType: $exerciseType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProgressDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.writeAt, writeAt) || other.writeAt == writeAt) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.exerciseType, exerciseType) ||
                other.exerciseType == exerciseType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    writeAt,
    const DeepCollectionEquality().hash(_exercises),
    exerciseType,
  );

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProgressDtoImplCopyWith<_$UserProgressDtoImpl> get copyWith =>
      __$$UserProgressDtoImplCopyWithImpl<_$UserProgressDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProgressDtoImplToJson(this);
  }
}

abstract class _UserProgressDto extends UserProgressDto {
  const factory _UserProgressDto({
    required final String id,
    @JsonKey(fromJson: timeConvert, defaultValue: null)
    required final DateTime? writeAt,
    @JsonKey(defaultValue: []) required final List<UserExerciseDto> exercises,
    @JsonKey(defaultValue: ExerciseType.other)
    required final ExerciseType exerciseType,
  }) = _$UserProgressDtoImpl;
  const _UserProgressDto._() : super._();

  factory _UserProgressDto.fromJson(Map<String, dynamic> json) =
      _$UserProgressDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(fromJson: timeConvert, defaultValue: null)
  DateTime? get writeAt;
  @override
  @JsonKey(defaultValue: [])
  List<UserExerciseDto> get exercises;
  @override
  @JsonKey(defaultValue: ExerciseType.other)
  ExerciseType get exerciseType;

  /// Create a copy of UserProgressDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProgressDtoImplCopyWith<_$UserProgressDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserExerciseDto _$UserExerciseDtoFromJson(Map<String, dynamic> json) {
  return _UserExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$UserExerciseDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get lastAnswer => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this UserExerciseDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserExerciseDtoCopyWith<UserExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExerciseDtoCopyWith<$Res> {
  factory $UserExerciseDtoCopyWith(
    UserExerciseDto value,
    $Res Function(UserExerciseDto) then,
  ) = _$UserExerciseDtoCopyWithImpl<$Res, UserExerciseDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(defaultValue: '') String lastAnswer,
    @JsonKey(defaultValue: false) bool isCorrect,
  });
}

/// @nodoc
class _$UserExerciseDtoCopyWithImpl<$Res, $Val extends UserExerciseDto>
    implements $UserExerciseDtoCopyWith<$Res> {
  _$UserExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastAnswer = null,
    Object? isCorrect = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            lastAnswer:
                null == lastAnswer
                    ? _value.lastAnswer
                    : lastAnswer // ignore: cast_nullable_to_non_nullable
                        as String,
            isCorrect:
                null == isCorrect
                    ? _value.isCorrect
                    : isCorrect // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserExerciseDtoImplCopyWith<$Res>
    implements $UserExerciseDtoCopyWith<$Res> {
  factory _$$UserExerciseDtoImplCopyWith(
    _$UserExerciseDtoImpl value,
    $Res Function(_$UserExerciseDtoImpl) then,
  ) = __$$UserExerciseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(defaultValue: '') String lastAnswer,
    @JsonKey(defaultValue: false) bool isCorrect,
  });
}

/// @nodoc
class __$$UserExerciseDtoImplCopyWithImpl<$Res>
    extends _$UserExerciseDtoCopyWithImpl<$Res, _$UserExerciseDtoImpl>
    implements _$$UserExerciseDtoImplCopyWith<$Res> {
  __$$UserExerciseDtoImplCopyWithImpl(
    _$UserExerciseDtoImpl _value,
    $Res Function(_$UserExerciseDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastAnswer = null,
    Object? isCorrect = null,
  }) {
    return _then(
      _$UserExerciseDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        lastAnswer:
            null == lastAnswer
                ? _value.lastAnswer
                : lastAnswer // ignore: cast_nullable_to_non_nullable
                    as String,
        isCorrect:
            null == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserExerciseDtoImpl extends _UserExerciseDto {
  const _$UserExerciseDtoImpl({
    required this.id,
    @JsonKey(defaultValue: '') required this.lastAnswer,
    @JsonKey(defaultValue: false) required this.isCorrect,
  }) : super._();

  factory _$UserExerciseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserExerciseDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String lastAnswer;
  @override
  @JsonKey(defaultValue: false)
  final bool isCorrect;

  @override
  String toString() {
    return 'UserExerciseDto(id: $id, lastAnswer: $lastAnswer, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserExerciseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastAnswer, lastAnswer) ||
                other.lastAnswer == lastAnswer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, lastAnswer, isCorrect);

  /// Create a copy of UserExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserExerciseDtoImplCopyWith<_$UserExerciseDtoImpl> get copyWith =>
      __$$UserExerciseDtoImplCopyWithImpl<_$UserExerciseDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserExerciseDtoImplToJson(this);
  }
}

abstract class _UserExerciseDto extends UserExerciseDto {
  const factory _UserExerciseDto({
    required final String id,
    @JsonKey(defaultValue: '') required final String lastAnswer,
    @JsonKey(defaultValue: false) required final bool isCorrect,
  }) = _$UserExerciseDtoImpl;
  const _UserExerciseDto._() : super._();

  factory _UserExerciseDto.fromJson(Map<String, dynamic> json) =
      _$UserExerciseDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get lastAnswer;
  @override
  @JsonKey(defaultValue: false)
  bool get isCorrect;

  /// Create a copy of UserExerciseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserExerciseDtoImplCopyWith<_$UserExerciseDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
