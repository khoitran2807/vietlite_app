// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thing_exercise_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThingExerciseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThingExercise exercise, String? lastAnswer)
        initialize,
    required TResult Function(String selectedAnswer) selectAnswer,
    required TResult Function(
            String userId, String progressId, int totalExercises)
        updateAnswerProgress,
    required TResult Function() checkAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult? Function(String selectedAnswer)? selectAnswer,
    TResult? Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult? Function()? checkAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult Function(String selectedAnswer)? selectAnswer,
    TResult Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult Function()? checkAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectAnswer value) selectAnswer,
    required TResult Function(_ThingAnswerProgress value) updateAnswerProgress,
    required TResult Function(_CheckAnswer value) checkAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectAnswer value)? selectAnswer,
    TResult? Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult? Function(_CheckAnswer value)? checkAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectAnswer value)? selectAnswer,
    TResult Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult Function(_CheckAnswer value)? checkAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingExerciseEventCopyWith<$Res> {
  factory $ThingExerciseEventCopyWith(
          ThingExerciseEvent value, $Res Function(ThingExerciseEvent) then) =
      _$ThingExerciseEventCopyWithImpl<$Res, ThingExerciseEvent>;
}

/// @nodoc
class _$ThingExerciseEventCopyWithImpl<$Res, $Val extends ThingExerciseEvent>
    implements $ThingExerciseEventCopyWith<$Res> {
  _$ThingExerciseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ThingExercise exercise, String? lastAnswer});

  $ThingExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ThingExerciseEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercise = null,
    Object? lastAnswer = freezed,
  }) {
    return _then(_$InitializeImpl(
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ThingExercise,
      lastAnswer: freezed == lastAnswer
          ? _value.lastAnswer
          : lastAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThingExerciseCopyWith<$Res> get exercise {
    return $ThingExerciseCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.exercise, required this.lastAnswer});

  @override
  final ThingExercise exercise;
  @override
  final String? lastAnswer;

  @override
  String toString() {
    return 'ThingExerciseEvent.initialize(exercise: $exercise, lastAnswer: $lastAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.lastAnswer, lastAnswer) ||
                other.lastAnswer == lastAnswer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exercise, lastAnswer);

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThingExercise exercise, String? lastAnswer)
        initialize,
    required TResult Function(String selectedAnswer) selectAnswer,
    required TResult Function(
            String userId, String progressId, int totalExercises)
        updateAnswerProgress,
    required TResult Function() checkAnswer,
  }) {
    return initialize(exercise, lastAnswer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult? Function(String selectedAnswer)? selectAnswer,
    TResult? Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult? Function()? checkAnswer,
  }) {
    return initialize?.call(exercise, lastAnswer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult Function(String selectedAnswer)? selectAnswer,
    TResult Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult Function()? checkAnswer,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(exercise, lastAnswer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectAnswer value) selectAnswer,
    required TResult Function(_ThingAnswerProgress value) updateAnswerProgress,
    required TResult Function(_CheckAnswer value) checkAnswer,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectAnswer value)? selectAnswer,
    TResult? Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult? Function(_CheckAnswer value)? checkAnswer,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectAnswer value)? selectAnswer,
    TResult Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult Function(_CheckAnswer value)? checkAnswer,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ThingExerciseEvent {
  const factory _Initialize(
      {required final ThingExercise exercise,
      required final String? lastAnswer}) = _$InitializeImpl;

  ThingExercise get exercise;
  String? get lastAnswer;

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectAnswerImplCopyWith<$Res> {
  factory _$$SelectAnswerImplCopyWith(
          _$SelectAnswerImpl value, $Res Function(_$SelectAnswerImpl) then) =
      __$$SelectAnswerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedAnswer});
}

/// @nodoc
class __$$SelectAnswerImplCopyWithImpl<$Res>
    extends _$ThingExerciseEventCopyWithImpl<$Res, _$SelectAnswerImpl>
    implements _$$SelectAnswerImplCopyWith<$Res> {
  __$$SelectAnswerImplCopyWithImpl(
      _$SelectAnswerImpl _value, $Res Function(_$SelectAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAnswer = null,
  }) {
    return _then(_$SelectAnswerImpl(
      selectedAnswer: null == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectAnswerImpl implements _SelectAnswer {
  const _$SelectAnswerImpl({required this.selectedAnswer});

  @override
  final String selectedAnswer;

  @override
  String toString() {
    return 'ThingExerciseEvent.selectAnswer(selectedAnswer: $selectedAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAnswerImpl &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedAnswer);

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAnswerImplCopyWith<_$SelectAnswerImpl> get copyWith =>
      __$$SelectAnswerImplCopyWithImpl<_$SelectAnswerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThingExercise exercise, String? lastAnswer)
        initialize,
    required TResult Function(String selectedAnswer) selectAnswer,
    required TResult Function(
            String userId, String progressId, int totalExercises)
        updateAnswerProgress,
    required TResult Function() checkAnswer,
  }) {
    return selectAnswer(selectedAnswer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult? Function(String selectedAnswer)? selectAnswer,
    TResult? Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult? Function()? checkAnswer,
  }) {
    return selectAnswer?.call(selectedAnswer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult Function(String selectedAnswer)? selectAnswer,
    TResult Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult Function()? checkAnswer,
    required TResult orElse(),
  }) {
    if (selectAnswer != null) {
      return selectAnswer(selectedAnswer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectAnswer value) selectAnswer,
    required TResult Function(_ThingAnswerProgress value) updateAnswerProgress,
    required TResult Function(_CheckAnswer value) checkAnswer,
  }) {
    return selectAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectAnswer value)? selectAnswer,
    TResult? Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult? Function(_CheckAnswer value)? checkAnswer,
  }) {
    return selectAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectAnswer value)? selectAnswer,
    TResult Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult Function(_CheckAnswer value)? checkAnswer,
    required TResult orElse(),
  }) {
    if (selectAnswer != null) {
      return selectAnswer(this);
    }
    return orElse();
  }
}

abstract class _SelectAnswer implements ThingExerciseEvent {
  const factory _SelectAnswer({required final String selectedAnswer}) =
      _$SelectAnswerImpl;

  String get selectedAnswer;

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectAnswerImplCopyWith<_$SelectAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThingAnswerProgressImplCopyWith<$Res> {
  factory _$$ThingAnswerProgressImplCopyWith(_$ThingAnswerProgressImpl value,
          $Res Function(_$ThingAnswerProgressImpl) then) =
      __$$ThingAnswerProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String progressId, int totalExercises});
}

/// @nodoc
class __$$ThingAnswerProgressImplCopyWithImpl<$Res>
    extends _$ThingExerciseEventCopyWithImpl<$Res, _$ThingAnswerProgressImpl>
    implements _$$ThingAnswerProgressImplCopyWith<$Res> {
  __$$ThingAnswerProgressImplCopyWithImpl(_$ThingAnswerProgressImpl _value,
      $Res Function(_$ThingAnswerProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? progressId = null,
    Object? totalExercises = null,
  }) {
    return _then(_$ThingAnswerProgressImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      progressId: null == progressId
          ? _value.progressId
          : progressId // ignore: cast_nullable_to_non_nullable
              as String,
      totalExercises: null == totalExercises
          ? _value.totalExercises
          : totalExercises // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ThingAnswerProgressImpl implements _ThingAnswerProgress {
  const _$ThingAnswerProgressImpl(
      {required this.userId,
      required this.progressId,
      required this.totalExercises});

  @override
  final String userId;
  @override
  final String progressId;
  @override
  final int totalExercises;

  @override
  String toString() {
    return 'ThingExerciseEvent.updateAnswerProgress(userId: $userId, progressId: $progressId, totalExercises: $totalExercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingAnswerProgressImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.progressId, progressId) ||
                other.progressId == progressId) &&
            (identical(other.totalExercises, totalExercises) ||
                other.totalExercises == totalExercises));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, progressId, totalExercises);

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingAnswerProgressImplCopyWith<_$ThingAnswerProgressImpl> get copyWith =>
      __$$ThingAnswerProgressImplCopyWithImpl<_$ThingAnswerProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThingExercise exercise, String? lastAnswer)
        initialize,
    required TResult Function(String selectedAnswer) selectAnswer,
    required TResult Function(
            String userId, String progressId, int totalExercises)
        updateAnswerProgress,
    required TResult Function() checkAnswer,
  }) {
    return updateAnswerProgress(userId, progressId, totalExercises);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult? Function(String selectedAnswer)? selectAnswer,
    TResult? Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult? Function()? checkAnswer,
  }) {
    return updateAnswerProgress?.call(userId, progressId, totalExercises);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult Function(String selectedAnswer)? selectAnswer,
    TResult Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult Function()? checkAnswer,
    required TResult orElse(),
  }) {
    if (updateAnswerProgress != null) {
      return updateAnswerProgress(userId, progressId, totalExercises);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectAnswer value) selectAnswer,
    required TResult Function(_ThingAnswerProgress value) updateAnswerProgress,
    required TResult Function(_CheckAnswer value) checkAnswer,
  }) {
    return updateAnswerProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectAnswer value)? selectAnswer,
    TResult? Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult? Function(_CheckAnswer value)? checkAnswer,
  }) {
    return updateAnswerProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectAnswer value)? selectAnswer,
    TResult Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult Function(_CheckAnswer value)? checkAnswer,
    required TResult orElse(),
  }) {
    if (updateAnswerProgress != null) {
      return updateAnswerProgress(this);
    }
    return orElse();
  }
}

abstract class _ThingAnswerProgress implements ThingExerciseEvent {
  const factory _ThingAnswerProgress(
      {required final String userId,
      required final String progressId,
      required final int totalExercises}) = _$ThingAnswerProgressImpl;

  String get userId;
  String get progressId;
  int get totalExercises;

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingAnswerProgressImplCopyWith<_$ThingAnswerProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckAnswerImplCopyWith<$Res> {
  factory _$$CheckAnswerImplCopyWith(
          _$CheckAnswerImpl value, $Res Function(_$CheckAnswerImpl) then) =
      __$$CheckAnswerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAnswerImplCopyWithImpl<$Res>
    extends _$ThingExerciseEventCopyWithImpl<$Res, _$CheckAnswerImpl>
    implements _$$CheckAnswerImplCopyWith<$Res> {
  __$$CheckAnswerImplCopyWithImpl(
      _$CheckAnswerImpl _value, $Res Function(_$CheckAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThingExerciseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAnswerImpl implements _CheckAnswer {
  const _$CheckAnswerImpl();

  @override
  String toString() {
    return 'ThingExerciseEvent.checkAnswer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAnswerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThingExercise exercise, String? lastAnswer)
        initialize,
    required TResult Function(String selectedAnswer) selectAnswer,
    required TResult Function(
            String userId, String progressId, int totalExercises)
        updateAnswerProgress,
    required TResult Function() checkAnswer,
  }) {
    return checkAnswer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult? Function(String selectedAnswer)? selectAnswer,
    TResult? Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult? Function()? checkAnswer,
  }) {
    return checkAnswer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThingExercise exercise, String? lastAnswer)? initialize,
    TResult Function(String selectedAnswer)? selectAnswer,
    TResult Function(String userId, String progressId, int totalExercises)?
        updateAnswerProgress,
    TResult Function()? checkAnswer,
    required TResult orElse(),
  }) {
    if (checkAnswer != null) {
      return checkAnswer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SelectAnswer value) selectAnswer,
    required TResult Function(_ThingAnswerProgress value) updateAnswerProgress,
    required TResult Function(_CheckAnswer value) checkAnswer,
  }) {
    return checkAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SelectAnswer value)? selectAnswer,
    TResult? Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult? Function(_CheckAnswer value)? checkAnswer,
  }) {
    return checkAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SelectAnswer value)? selectAnswer,
    TResult Function(_ThingAnswerProgress value)? updateAnswerProgress,
    TResult Function(_CheckAnswer value)? checkAnswer,
    required TResult orElse(),
  }) {
    if (checkAnswer != null) {
      return checkAnswer(this);
    }
    return orElse();
  }
}

abstract class _CheckAnswer implements ThingExerciseEvent {
  const factory _CheckAnswer() = _$CheckAnswerImpl;
}

/// @nodoc
mixin _$ThingExerciseState {
  String? get selectedAnswer => throw _privateConstructorUsedError;
  bool get isAnswered => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ThingExercise get exercise => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of ThingExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThingExerciseStateCopyWith<ThingExerciseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingExerciseStateCopyWith<$Res> {
  factory $ThingExerciseStateCopyWith(
          ThingExerciseState value, $Res Function(ThingExerciseState) then) =
      _$ThingExerciseStateCopyWithImpl<$Res, ThingExerciseState>;
  @useResult
  $Res call(
      {String? selectedAnswer,
      bool isAnswered,
      bool isLoading,
      ThingExercise exercise,
      Option<Either<AppFailure, dynamic>> failureOrSuccessOption});

  $ThingExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class _$ThingExerciseStateCopyWithImpl<$Res, $Val extends ThingExerciseState>
    implements $ThingExerciseStateCopyWith<$Res> {
  _$ThingExerciseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAnswer = freezed,
    Object? isAnswered = null,
    Object? isLoading = null,
    Object? exercise = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      selectedAnswer: freezed == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ThingExercise,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ) as $Val);
  }

  /// Create a copy of ThingExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThingExerciseCopyWith<$Res> get exercise {
    return $ThingExerciseCopyWith<$Res>(_value.exercise, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThingExerciseStateImplCopyWith<$Res>
    implements $ThingExerciseStateCopyWith<$Res> {
  factory _$$ThingExerciseStateImplCopyWith(_$ThingExerciseStateImpl value,
          $Res Function(_$ThingExerciseStateImpl) then) =
      __$$ThingExerciseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedAnswer,
      bool isAnswered,
      bool isLoading,
      ThingExercise exercise,
      Option<Either<AppFailure, dynamic>> failureOrSuccessOption});

  @override
  $ThingExerciseCopyWith<$Res> get exercise;
}

/// @nodoc
class __$$ThingExerciseStateImplCopyWithImpl<$Res>
    extends _$ThingExerciseStateCopyWithImpl<$Res, _$ThingExerciseStateImpl>
    implements _$$ThingExerciseStateImplCopyWith<$Res> {
  __$$ThingExerciseStateImplCopyWithImpl(_$ThingExerciseStateImpl _value,
      $Res Function(_$ThingExerciseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThingExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAnswer = freezed,
    Object? isAnswered = null,
    Object? isLoading = null,
    Object? exercise = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$ThingExerciseStateImpl(
      selectedAnswer: freezed == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ThingExercise,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ThingExerciseStateImpl extends _ThingExerciseState {
  const _$ThingExerciseStateImpl(
      {required this.selectedAnswer,
      required this.isAnswered,
      required this.isLoading,
      required this.exercise,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final String? selectedAnswer;
  @override
  final bool isAnswered;
  @override
  final bool isLoading;
  @override
  final ThingExercise exercise;
  @override
  final Option<Either<AppFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ThingExerciseState(selectedAnswer: $selectedAnswer, isAnswered: $isAnswered, isLoading: $isLoading, exercise: $exercise, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingExerciseStateImpl &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer) &&
            (identical(other.isAnswered, isAnswered) ||
                other.isAnswered == isAnswered) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedAnswer, isAnswered,
      isLoading, exercise, failureOrSuccessOption);

  /// Create a copy of ThingExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingExerciseStateImplCopyWith<_$ThingExerciseStateImpl> get copyWith =>
      __$$ThingExerciseStateImplCopyWithImpl<_$ThingExerciseStateImpl>(
          this, _$identity);
}

abstract class _ThingExerciseState extends ThingExerciseState {
  const factory _ThingExerciseState(
      {required final String? selectedAnswer,
      required final bool isAnswered,
      required final bool isLoading,
      required final ThingExercise exercise,
      required final Option<Either<AppFailure, dynamic>>
          failureOrSuccessOption}) = _$ThingExerciseStateImpl;
  const _ThingExerciseState._() : super._();

  @override
  String? get selectedAnswer;
  @override
  bool get isAnswered;
  @override
  bool get isLoading;
  @override
  ThingExercise get exercise;
  @override
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption;

  /// Create a copy of ThingExerciseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingExerciseStateImplCopyWith<_$ThingExerciseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
