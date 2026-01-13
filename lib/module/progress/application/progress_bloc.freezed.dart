// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserProgresses,
    required TResult Function(UserProgress progress) updateProgress,
    required TResult Function(List<Letter> letters) initLetters,
    required TResult Function(List<Number> numbers) initNumbers,
    required TResult Function(List<Thing> things) initThings,
    required TResult Function(List<WordSelection> wordSelections)
        initWordSelections,
    required TResult Function(List<WordMatch> wordMatches) initWordMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getUserProgresses,
    TResult? Function(UserProgress progress)? updateProgress,
    TResult? Function(List<Letter> letters)? initLetters,
    TResult? Function(List<Number> numbers)? initNumbers,
    TResult? Function(List<Thing> things)? initThings,
    TResult? Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult? Function(List<WordMatch> wordMatches)? initWordMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserProgresses,
    TResult Function(UserProgress progress)? updateProgress,
    TResult Function(List<Letter> letters)? initLetters,
    TResult Function(List<Number> numbers)? initNumbers,
    TResult Function(List<Thing> things)? initThings,
    TResult Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult Function(List<WordMatch> wordMatches)? initWordMatches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProgresses value) getUserProgresses,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_InitLetters value) initLetters,
    required TResult Function(_InitNumbers value) initNumbers,
    required TResult Function(_InitThings value) initThings,
    required TResult Function(_InitWordSelections value) initWordSelections,
    required TResult Function(_InitWordMatches value) initWordMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProgresses value)? getUserProgresses,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_InitLetters value)? initLetters,
    TResult? Function(_InitNumbers value)? initNumbers,
    TResult? Function(_InitThings value)? initThings,
    TResult? Function(_InitWordSelections value)? initWordSelections,
    TResult? Function(_InitWordMatches value)? initWordMatches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProgresses value)? getUserProgresses,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_InitLetters value)? initLetters,
    TResult Function(_InitNumbers value)? initNumbers,
    TResult Function(_InitThings value)? initThings,
    TResult Function(_InitWordSelections value)? initWordSelections,
    TResult Function(_InitWordMatches value)? initWordMatches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressEventCopyWith<$Res> {
  factory $ProgressEventCopyWith(
          ProgressEvent value, $Res Function(ProgressEvent) then) =
      _$ProgressEventCopyWithImpl<$Res, ProgressEvent>;
}

/// @nodoc
class _$ProgressEventCopyWithImpl<$Res, $Val extends ProgressEvent>
    implements $ProgressEventCopyWith<$Res> {
  _$ProgressEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUserProgressesImplCopyWith<$Res> {
  factory _$$GetUserProgressesImplCopyWith(_$GetUserProgressesImpl value,
          $Res Function(_$GetUserProgressesImpl) then) =
      __$$GetUserProgressesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetUserProgressesImplCopyWithImpl<$Res>
    extends _$ProgressEventCopyWithImpl<$Res, _$GetUserProgressesImpl>
    implements _$$GetUserProgressesImplCopyWith<$Res> {
  __$$GetUserProgressesImplCopyWithImpl(_$GetUserProgressesImpl _value,
      $Res Function(_$GetUserProgressesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetUserProgressesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserProgressesImpl implements _GetUserProgresses {
  const _$GetUserProgressesImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'ProgressEvent.getUserProgresses(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProgressesImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserProgressesImplCopyWith<_$GetUserProgressesImpl> get copyWith =>
      __$$GetUserProgressesImplCopyWithImpl<_$GetUserProgressesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserProgresses,
    required TResult Function(UserProgress progress) updateProgress,
    required TResult Function(List<Letter> letters) initLetters,
    required TResult Function(List<Number> numbers) initNumbers,
    required TResult Function(List<Thing> things) initThings,
    required TResult Function(List<WordSelection> wordSelections)
        initWordSelections,
    required TResult Function(List<WordMatch> wordMatches) initWordMatches,
  }) {
    return getUserProgresses(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getUserProgresses,
    TResult? Function(UserProgress progress)? updateProgress,
    TResult? Function(List<Letter> letters)? initLetters,
    TResult? Function(List<Number> numbers)? initNumbers,
    TResult? Function(List<Thing> things)? initThings,
    TResult? Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult? Function(List<WordMatch> wordMatches)? initWordMatches,
  }) {
    return getUserProgresses?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserProgresses,
    TResult Function(UserProgress progress)? updateProgress,
    TResult Function(List<Letter> letters)? initLetters,
    TResult Function(List<Number> numbers)? initNumbers,
    TResult Function(List<Thing> things)? initThings,
    TResult Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult Function(List<WordMatch> wordMatches)? initWordMatches,
    required TResult orElse(),
  }) {
    if (getUserProgresses != null) {
      return getUserProgresses(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProgresses value) getUserProgresses,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_InitLetters value) initLetters,
    required TResult Function(_InitNumbers value) initNumbers,
    required TResult Function(_InitThings value) initThings,
    required TResult Function(_InitWordSelections value) initWordSelections,
    required TResult Function(_InitWordMatches value) initWordMatches,
  }) {
    return getUserProgresses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProgresses value)? getUserProgresses,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_InitLetters value)? initLetters,
    TResult? Function(_InitNumbers value)? initNumbers,
    TResult? Function(_InitThings value)? initThings,
    TResult? Function(_InitWordSelections value)? initWordSelections,
    TResult? Function(_InitWordMatches value)? initWordMatches,
  }) {
    return getUserProgresses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProgresses value)? getUserProgresses,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_InitLetters value)? initLetters,
    TResult Function(_InitNumbers value)? initNumbers,
    TResult Function(_InitThings value)? initThings,
    TResult Function(_InitWordSelections value)? initWordSelections,
    TResult Function(_InitWordMatches value)? initWordMatches,
    required TResult orElse(),
  }) {
    if (getUserProgresses != null) {
      return getUserProgresses(this);
    }
    return orElse();
  }
}

abstract class _GetUserProgresses implements ProgressEvent {
  const factory _GetUserProgresses({required final String userId}) =
      _$GetUserProgressesImpl;

  String get userId;

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserProgressesImplCopyWith<_$GetUserProgressesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProgressImplCopyWith<$Res> {
  factory _$$UpdateProgressImplCopyWith(_$UpdateProgressImpl value,
          $Res Function(_$UpdateProgressImpl) then) =
      __$$UpdateProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProgress progress});

  $UserProgressCopyWith<$Res> get progress;
}

/// @nodoc
class __$$UpdateProgressImplCopyWithImpl<$Res>
    extends _$ProgressEventCopyWithImpl<$Res, _$UpdateProgressImpl>
    implements _$$UpdateProgressImplCopyWith<$Res> {
  __$$UpdateProgressImplCopyWithImpl(
      _$UpdateProgressImpl _value, $Res Function(_$UpdateProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$UpdateProgressImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as UserProgress,
    ));
  }

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProgressCopyWith<$Res> get progress {
    return $UserProgressCopyWith<$Res>(_value.progress, (value) {
      return _then(_value.copyWith(progress: value));
    });
  }
}

/// @nodoc

class _$UpdateProgressImpl implements _UpdateProgress {
  const _$UpdateProgressImpl({required this.progress});

  @override
  final UserProgress progress;

  @override
  String toString() {
    return 'ProgressEvent.updateProgress(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProgressImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProgressImplCopyWith<_$UpdateProgressImpl> get copyWith =>
      __$$UpdateProgressImplCopyWithImpl<_$UpdateProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserProgresses,
    required TResult Function(UserProgress progress) updateProgress,
    required TResult Function(List<Letter> letters) initLetters,
    required TResult Function(List<Number> numbers) initNumbers,
    required TResult Function(List<Thing> things) initThings,
    required TResult Function(List<WordSelection> wordSelections)
        initWordSelections,
    required TResult Function(List<WordMatch> wordMatches) initWordMatches,
  }) {
    return updateProgress(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getUserProgresses,
    TResult? Function(UserProgress progress)? updateProgress,
    TResult? Function(List<Letter> letters)? initLetters,
    TResult? Function(List<Number> numbers)? initNumbers,
    TResult? Function(List<Thing> things)? initThings,
    TResult? Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult? Function(List<WordMatch> wordMatches)? initWordMatches,
  }) {
    return updateProgress?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserProgresses,
    TResult Function(UserProgress progress)? updateProgress,
    TResult Function(List<Letter> letters)? initLetters,
    TResult Function(List<Number> numbers)? initNumbers,
    TResult Function(List<Thing> things)? initThings,
    TResult Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult Function(List<WordMatch> wordMatches)? initWordMatches,
    required TResult orElse(),
  }) {
    if (updateProgress != null) {
      return updateProgress(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProgresses value) getUserProgresses,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_InitLetters value) initLetters,
    required TResult Function(_InitNumbers value) initNumbers,
    required TResult Function(_InitThings value) initThings,
    required TResult Function(_InitWordSelections value) initWordSelections,
    required TResult Function(_InitWordMatches value) initWordMatches,
  }) {
    return updateProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProgresses value)? getUserProgresses,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_InitLetters value)? initLetters,
    TResult? Function(_InitNumbers value)? initNumbers,
    TResult? Function(_InitThings value)? initThings,
    TResult? Function(_InitWordSelections value)? initWordSelections,
    TResult? Function(_InitWordMatches value)? initWordMatches,
  }) {
    return updateProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProgresses value)? getUserProgresses,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_InitLetters value)? initLetters,
    TResult Function(_InitNumbers value)? initNumbers,
    TResult Function(_InitThings value)? initThings,
    TResult Function(_InitWordSelections value)? initWordSelections,
    TResult Function(_InitWordMatches value)? initWordMatches,
    required TResult orElse(),
  }) {
    if (updateProgress != null) {
      return updateProgress(this);
    }
    return orElse();
  }
}

abstract class _UpdateProgress implements ProgressEvent {
  const factory _UpdateProgress({required final UserProgress progress}) =
      _$UpdateProgressImpl;

  UserProgress get progress;

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProgressImplCopyWith<_$UpdateProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitLettersImplCopyWith<$Res> {
  factory _$$InitLettersImplCopyWith(
          _$InitLettersImpl value, $Res Function(_$InitLettersImpl) then) =
      __$$InitLettersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Letter> letters});
}

/// @nodoc
class __$$InitLettersImplCopyWithImpl<$Res>
    extends _$ProgressEventCopyWithImpl<$Res, _$InitLettersImpl>
    implements _$$InitLettersImplCopyWith<$Res> {
  __$$InitLettersImplCopyWithImpl(
      _$InitLettersImpl _value, $Res Function(_$InitLettersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letters = null,
  }) {
    return _then(_$InitLettersImpl(
      letters: null == letters
          ? _value._letters
          : letters // ignore: cast_nullable_to_non_nullable
              as List<Letter>,
    ));
  }
}

/// @nodoc

class _$InitLettersImpl implements _InitLetters {
  const _$InitLettersImpl({required final List<Letter> letters})
      : _letters = letters;

  final List<Letter> _letters;
  @override
  List<Letter> get letters {
    if (_letters is EqualUnmodifiableListView) return _letters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_letters);
  }

  @override
  String toString() {
    return 'ProgressEvent.initLetters(letters: $letters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitLettersImpl &&
            const DeepCollectionEquality().equals(other._letters, _letters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_letters));

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitLettersImplCopyWith<_$InitLettersImpl> get copyWith =>
      __$$InitLettersImplCopyWithImpl<_$InitLettersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserProgresses,
    required TResult Function(UserProgress progress) updateProgress,
    required TResult Function(List<Letter> letters) initLetters,
    required TResult Function(List<Number> numbers) initNumbers,
    required TResult Function(List<Thing> things) initThings,
    required TResult Function(List<WordSelection> wordSelections)
        initWordSelections,
    required TResult Function(List<WordMatch> wordMatches) initWordMatches,
  }) {
    return initLetters(letters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getUserProgresses,
    TResult? Function(UserProgress progress)? updateProgress,
    TResult? Function(List<Letter> letters)? initLetters,
    TResult? Function(List<Number> numbers)? initNumbers,
    TResult? Function(List<Thing> things)? initThings,
    TResult? Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult? Function(List<WordMatch> wordMatches)? initWordMatches,
  }) {
    return initLetters?.call(letters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserProgresses,
    TResult Function(UserProgress progress)? updateProgress,
    TResult Function(List<Letter> letters)? initLetters,
    TResult Function(List<Number> numbers)? initNumbers,
    TResult Function(List<Thing> things)? initThings,
    TResult Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult Function(List<WordMatch> wordMatches)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initLetters != null) {
      return initLetters(letters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProgresses value) getUserProgresses,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_InitLetters value) initLetters,
    required TResult Function(_InitNumbers value) initNumbers,
    required TResult Function(_InitThings value) initThings,
    required TResult Function(_InitWordSelections value) initWordSelections,
    required TResult Function(_InitWordMatches value) initWordMatches,
  }) {
    return initLetters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProgresses value)? getUserProgresses,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_InitLetters value)? initLetters,
    TResult? Function(_InitNumbers value)? initNumbers,
    TResult? Function(_InitThings value)? initThings,
    TResult? Function(_InitWordSelections value)? initWordSelections,
    TResult? Function(_InitWordMatches value)? initWordMatches,
  }) {
    return initLetters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProgresses value)? getUserProgresses,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_InitLetters value)? initLetters,
    TResult Function(_InitNumbers value)? initNumbers,
    TResult Function(_InitThings value)? initThings,
    TResult Function(_InitWordSelections value)? initWordSelections,
    TResult Function(_InitWordMatches value)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initLetters != null) {
      return initLetters(this);
    }
    return orElse();
  }
}

abstract class _InitLetters implements ProgressEvent {
  const factory _InitLetters({required final List<Letter> letters}) =
      _$InitLettersImpl;

  List<Letter> get letters;

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitLettersImplCopyWith<_$InitLettersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitNumbersImplCopyWith<$Res> {
  factory _$$InitNumbersImplCopyWith(
          _$InitNumbersImpl value, $Res Function(_$InitNumbersImpl) then) =
      __$$InitNumbersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Number> numbers});
}

/// @nodoc
class __$$InitNumbersImplCopyWithImpl<$Res>
    extends _$ProgressEventCopyWithImpl<$Res, _$InitNumbersImpl>
    implements _$$InitNumbersImplCopyWith<$Res> {
  __$$InitNumbersImplCopyWithImpl(
      _$InitNumbersImpl _value, $Res Function(_$InitNumbersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
  }) {
    return _then(_$InitNumbersImpl(
      numbers: null == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<Number>,
    ));
  }
}

/// @nodoc

class _$InitNumbersImpl implements _InitNumbers {
  const _$InitNumbersImpl({required final List<Number> numbers})
      : _numbers = numbers;

  final List<Number> _numbers;
  @override
  List<Number> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  @override
  String toString() {
    return 'ProgressEvent.initNumbers(numbers: $numbers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitNumbersImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_numbers));

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitNumbersImplCopyWith<_$InitNumbersImpl> get copyWith =>
      __$$InitNumbersImplCopyWithImpl<_$InitNumbersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserProgresses,
    required TResult Function(UserProgress progress) updateProgress,
    required TResult Function(List<Letter> letters) initLetters,
    required TResult Function(List<Number> numbers) initNumbers,
    required TResult Function(List<Thing> things) initThings,
    required TResult Function(List<WordSelection> wordSelections)
        initWordSelections,
    required TResult Function(List<WordMatch> wordMatches) initWordMatches,
  }) {
    return initNumbers(numbers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getUserProgresses,
    TResult? Function(UserProgress progress)? updateProgress,
    TResult? Function(List<Letter> letters)? initLetters,
    TResult? Function(List<Number> numbers)? initNumbers,
    TResult? Function(List<Thing> things)? initThings,
    TResult? Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult? Function(List<WordMatch> wordMatches)? initWordMatches,
  }) {
    return initNumbers?.call(numbers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserProgresses,
    TResult Function(UserProgress progress)? updateProgress,
    TResult Function(List<Letter> letters)? initLetters,
    TResult Function(List<Number> numbers)? initNumbers,
    TResult Function(List<Thing> things)? initThings,
    TResult Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult Function(List<WordMatch> wordMatches)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initNumbers != null) {
      return initNumbers(numbers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProgresses value) getUserProgresses,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_InitLetters value) initLetters,
    required TResult Function(_InitNumbers value) initNumbers,
    required TResult Function(_InitThings value) initThings,
    required TResult Function(_InitWordSelections value) initWordSelections,
    required TResult Function(_InitWordMatches value) initWordMatches,
  }) {
    return initNumbers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProgresses value)? getUserProgresses,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_InitLetters value)? initLetters,
    TResult? Function(_InitNumbers value)? initNumbers,
    TResult? Function(_InitThings value)? initThings,
    TResult? Function(_InitWordSelections value)? initWordSelections,
    TResult? Function(_InitWordMatches value)? initWordMatches,
  }) {
    return initNumbers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProgresses value)? getUserProgresses,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_InitLetters value)? initLetters,
    TResult Function(_InitNumbers value)? initNumbers,
    TResult Function(_InitThings value)? initThings,
    TResult Function(_InitWordSelections value)? initWordSelections,
    TResult Function(_InitWordMatches value)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initNumbers != null) {
      return initNumbers(this);
    }
    return orElse();
  }
}

abstract class _InitNumbers implements ProgressEvent {
  const factory _InitNumbers({required final List<Number> numbers}) =
      _$InitNumbersImpl;

  List<Number> get numbers;

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitNumbersImplCopyWith<_$InitNumbersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitThingsImplCopyWith<$Res> {
  factory _$$InitThingsImplCopyWith(
          _$InitThingsImpl value, $Res Function(_$InitThingsImpl) then) =
      __$$InitThingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Thing> things});
}

/// @nodoc
class __$$InitThingsImplCopyWithImpl<$Res>
    extends _$ProgressEventCopyWithImpl<$Res, _$InitThingsImpl>
    implements _$$InitThingsImplCopyWith<$Res> {
  __$$InitThingsImplCopyWithImpl(
      _$InitThingsImpl _value, $Res Function(_$InitThingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? things = null,
  }) {
    return _then(_$InitThingsImpl(
      things: null == things
          ? _value._things
          : things // ignore: cast_nullable_to_non_nullable
              as List<Thing>,
    ));
  }
}

/// @nodoc

class _$InitThingsImpl implements _InitThings {
  const _$InitThingsImpl({required final List<Thing> things})
      : _things = things;

  final List<Thing> _things;
  @override
  List<Thing> get things {
    if (_things is EqualUnmodifiableListView) return _things;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_things);
  }

  @override
  String toString() {
    return 'ProgressEvent.initThings(things: $things)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitThingsImpl &&
            const DeepCollectionEquality().equals(other._things, _things));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_things));

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitThingsImplCopyWith<_$InitThingsImpl> get copyWith =>
      __$$InitThingsImplCopyWithImpl<_$InitThingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserProgresses,
    required TResult Function(UserProgress progress) updateProgress,
    required TResult Function(List<Letter> letters) initLetters,
    required TResult Function(List<Number> numbers) initNumbers,
    required TResult Function(List<Thing> things) initThings,
    required TResult Function(List<WordSelection> wordSelections)
        initWordSelections,
    required TResult Function(List<WordMatch> wordMatches) initWordMatches,
  }) {
    return initThings(things);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getUserProgresses,
    TResult? Function(UserProgress progress)? updateProgress,
    TResult? Function(List<Letter> letters)? initLetters,
    TResult? Function(List<Number> numbers)? initNumbers,
    TResult? Function(List<Thing> things)? initThings,
    TResult? Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult? Function(List<WordMatch> wordMatches)? initWordMatches,
  }) {
    return initThings?.call(things);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserProgresses,
    TResult Function(UserProgress progress)? updateProgress,
    TResult Function(List<Letter> letters)? initLetters,
    TResult Function(List<Number> numbers)? initNumbers,
    TResult Function(List<Thing> things)? initThings,
    TResult Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult Function(List<WordMatch> wordMatches)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initThings != null) {
      return initThings(things);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProgresses value) getUserProgresses,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_InitLetters value) initLetters,
    required TResult Function(_InitNumbers value) initNumbers,
    required TResult Function(_InitThings value) initThings,
    required TResult Function(_InitWordSelections value) initWordSelections,
    required TResult Function(_InitWordMatches value) initWordMatches,
  }) {
    return initThings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProgresses value)? getUserProgresses,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_InitLetters value)? initLetters,
    TResult? Function(_InitNumbers value)? initNumbers,
    TResult? Function(_InitThings value)? initThings,
    TResult? Function(_InitWordSelections value)? initWordSelections,
    TResult? Function(_InitWordMatches value)? initWordMatches,
  }) {
    return initThings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProgresses value)? getUserProgresses,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_InitLetters value)? initLetters,
    TResult Function(_InitNumbers value)? initNumbers,
    TResult Function(_InitThings value)? initThings,
    TResult Function(_InitWordSelections value)? initWordSelections,
    TResult Function(_InitWordMatches value)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initThings != null) {
      return initThings(this);
    }
    return orElse();
  }
}

abstract class _InitThings implements ProgressEvent {
  const factory _InitThings({required final List<Thing> things}) =
      _$InitThingsImpl;

  List<Thing> get things;

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitThingsImplCopyWith<_$InitThingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitWordSelectionsImplCopyWith<$Res> {
  factory _$$InitWordSelectionsImplCopyWith(_$InitWordSelectionsImpl value,
          $Res Function(_$InitWordSelectionsImpl) then) =
      __$$InitWordSelectionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<WordSelection> wordSelections});
}

/// @nodoc
class __$$InitWordSelectionsImplCopyWithImpl<$Res>
    extends _$ProgressEventCopyWithImpl<$Res, _$InitWordSelectionsImpl>
    implements _$$InitWordSelectionsImplCopyWith<$Res> {
  __$$InitWordSelectionsImplCopyWithImpl(_$InitWordSelectionsImpl _value,
      $Res Function(_$InitWordSelectionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordSelections = null,
  }) {
    return _then(_$InitWordSelectionsImpl(
      wordSelections: null == wordSelections
          ? _value._wordSelections
          : wordSelections // ignore: cast_nullable_to_non_nullable
              as List<WordSelection>,
    ));
  }
}

/// @nodoc

class _$InitWordSelectionsImpl implements _InitWordSelections {
  const _$InitWordSelectionsImpl(
      {required final List<WordSelection> wordSelections})
      : _wordSelections = wordSelections;

  final List<WordSelection> _wordSelections;
  @override
  List<WordSelection> get wordSelections {
    if (_wordSelections is EqualUnmodifiableListView) return _wordSelections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordSelections);
  }

  @override
  String toString() {
    return 'ProgressEvent.initWordSelections(wordSelections: $wordSelections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitWordSelectionsImpl &&
            const DeepCollectionEquality()
                .equals(other._wordSelections, _wordSelections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_wordSelections));

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitWordSelectionsImplCopyWith<_$InitWordSelectionsImpl> get copyWith =>
      __$$InitWordSelectionsImplCopyWithImpl<_$InitWordSelectionsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserProgresses,
    required TResult Function(UserProgress progress) updateProgress,
    required TResult Function(List<Letter> letters) initLetters,
    required TResult Function(List<Number> numbers) initNumbers,
    required TResult Function(List<Thing> things) initThings,
    required TResult Function(List<WordSelection> wordSelections)
        initWordSelections,
    required TResult Function(List<WordMatch> wordMatches) initWordMatches,
  }) {
    return initWordSelections(wordSelections);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getUserProgresses,
    TResult? Function(UserProgress progress)? updateProgress,
    TResult? Function(List<Letter> letters)? initLetters,
    TResult? Function(List<Number> numbers)? initNumbers,
    TResult? Function(List<Thing> things)? initThings,
    TResult? Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult? Function(List<WordMatch> wordMatches)? initWordMatches,
  }) {
    return initWordSelections?.call(wordSelections);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserProgresses,
    TResult Function(UserProgress progress)? updateProgress,
    TResult Function(List<Letter> letters)? initLetters,
    TResult Function(List<Number> numbers)? initNumbers,
    TResult Function(List<Thing> things)? initThings,
    TResult Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult Function(List<WordMatch> wordMatches)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initWordSelections != null) {
      return initWordSelections(wordSelections);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProgresses value) getUserProgresses,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_InitLetters value) initLetters,
    required TResult Function(_InitNumbers value) initNumbers,
    required TResult Function(_InitThings value) initThings,
    required TResult Function(_InitWordSelections value) initWordSelections,
    required TResult Function(_InitWordMatches value) initWordMatches,
  }) {
    return initWordSelections(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProgresses value)? getUserProgresses,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_InitLetters value)? initLetters,
    TResult? Function(_InitNumbers value)? initNumbers,
    TResult? Function(_InitThings value)? initThings,
    TResult? Function(_InitWordSelections value)? initWordSelections,
    TResult? Function(_InitWordMatches value)? initWordMatches,
  }) {
    return initWordSelections?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProgresses value)? getUserProgresses,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_InitLetters value)? initLetters,
    TResult Function(_InitNumbers value)? initNumbers,
    TResult Function(_InitThings value)? initThings,
    TResult Function(_InitWordSelections value)? initWordSelections,
    TResult Function(_InitWordMatches value)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initWordSelections != null) {
      return initWordSelections(this);
    }
    return orElse();
  }
}

abstract class _InitWordSelections implements ProgressEvent {
  const factory _InitWordSelections(
          {required final List<WordSelection> wordSelections}) =
      _$InitWordSelectionsImpl;

  List<WordSelection> get wordSelections;

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitWordSelectionsImplCopyWith<_$InitWordSelectionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitWordMatchesImplCopyWith<$Res> {
  factory _$$InitWordMatchesImplCopyWith(_$InitWordMatchesImpl value,
          $Res Function(_$InitWordMatchesImpl) then) =
      __$$InitWordMatchesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<WordMatch> wordMatches});
}

/// @nodoc
class __$$InitWordMatchesImplCopyWithImpl<$Res>
    extends _$ProgressEventCopyWithImpl<$Res, _$InitWordMatchesImpl>
    implements _$$InitWordMatchesImplCopyWith<$Res> {
  __$$InitWordMatchesImplCopyWithImpl(
      _$InitWordMatchesImpl _value, $Res Function(_$InitWordMatchesImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordMatches = null,
  }) {
    return _then(_$InitWordMatchesImpl(
      wordMatches: null == wordMatches
          ? _value._wordMatches
          : wordMatches // ignore: cast_nullable_to_non_nullable
              as List<WordMatch>,
    ));
  }
}

/// @nodoc

class _$InitWordMatchesImpl implements _InitWordMatches {
  const _$InitWordMatchesImpl({required final List<WordMatch> wordMatches})
      : _wordMatches = wordMatches;

  final List<WordMatch> _wordMatches;
  @override
  List<WordMatch> get wordMatches {
    if (_wordMatches is EqualUnmodifiableListView) return _wordMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordMatches);
  }

  @override
  String toString() {
    return 'ProgressEvent.initWordMatches(wordMatches: $wordMatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitWordMatchesImpl &&
            const DeepCollectionEquality()
                .equals(other._wordMatches, _wordMatches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_wordMatches));

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitWordMatchesImplCopyWith<_$InitWordMatchesImpl> get copyWith =>
      __$$InitWordMatchesImplCopyWithImpl<_$InitWordMatchesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getUserProgresses,
    required TResult Function(UserProgress progress) updateProgress,
    required TResult Function(List<Letter> letters) initLetters,
    required TResult Function(List<Number> numbers) initNumbers,
    required TResult Function(List<Thing> things) initThings,
    required TResult Function(List<WordSelection> wordSelections)
        initWordSelections,
    required TResult Function(List<WordMatch> wordMatches) initWordMatches,
  }) {
    return initWordMatches(wordMatches);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getUserProgresses,
    TResult? Function(UserProgress progress)? updateProgress,
    TResult? Function(List<Letter> letters)? initLetters,
    TResult? Function(List<Number> numbers)? initNumbers,
    TResult? Function(List<Thing> things)? initThings,
    TResult? Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult? Function(List<WordMatch> wordMatches)? initWordMatches,
  }) {
    return initWordMatches?.call(wordMatches);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getUserProgresses,
    TResult Function(UserProgress progress)? updateProgress,
    TResult Function(List<Letter> letters)? initLetters,
    TResult Function(List<Number> numbers)? initNumbers,
    TResult Function(List<Thing> things)? initThings,
    TResult Function(List<WordSelection> wordSelections)? initWordSelections,
    TResult Function(List<WordMatch> wordMatches)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initWordMatches != null) {
      return initWordMatches(wordMatches);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProgresses value) getUserProgresses,
    required TResult Function(_UpdateProgress value) updateProgress,
    required TResult Function(_InitLetters value) initLetters,
    required TResult Function(_InitNumbers value) initNumbers,
    required TResult Function(_InitThings value) initThings,
    required TResult Function(_InitWordSelections value) initWordSelections,
    required TResult Function(_InitWordMatches value) initWordMatches,
  }) {
    return initWordMatches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProgresses value)? getUserProgresses,
    TResult? Function(_UpdateProgress value)? updateProgress,
    TResult? Function(_InitLetters value)? initLetters,
    TResult? Function(_InitNumbers value)? initNumbers,
    TResult? Function(_InitThings value)? initThings,
    TResult? Function(_InitWordSelections value)? initWordSelections,
    TResult? Function(_InitWordMatches value)? initWordMatches,
  }) {
    return initWordMatches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProgresses value)? getUserProgresses,
    TResult Function(_UpdateProgress value)? updateProgress,
    TResult Function(_InitLetters value)? initLetters,
    TResult Function(_InitNumbers value)? initNumbers,
    TResult Function(_InitThings value)? initThings,
    TResult Function(_InitWordSelections value)? initWordSelections,
    TResult Function(_InitWordMatches value)? initWordMatches,
    required TResult orElse(),
  }) {
    if (initWordMatches != null) {
      return initWordMatches(this);
    }
    return orElse();
  }
}

abstract class _InitWordMatches implements ProgressEvent {
  const factory _InitWordMatches({required final List<WordMatch> wordMatches}) =
      _$InitWordMatchesImpl;

  List<WordMatch> get wordMatches;

  /// Create a copy of ProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitWordMatchesImplCopyWith<_$InitWordMatchesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProgressState {
  List<Letter> get letters => throw _privateConstructorUsedError;
  List<Number> get numbers => throw _privateConstructorUsedError;
  List<Thing> get things => throw _privateConstructorUsedError;
  List<WordSelection> get wordSelections => throw _privateConstructorUsedError;
  List<WordMatch> get wordMatches => throw _privateConstructorUsedError;
  List<UserProgress> get userProgresses => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get fetchFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressStateCopyWith<ProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressStateCopyWith<$Res> {
  factory $ProgressStateCopyWith(
          ProgressState value, $Res Function(ProgressState) then) =
      _$ProgressStateCopyWithImpl<$Res, ProgressState>;
  @useResult
  $Res call(
      {List<Letter> letters,
      List<Number> numbers,
      List<Thing> things,
      List<WordSelection> wordSelections,
      List<WordMatch> wordMatches,
      List<UserProgress> userProgresses,
      bool isLoading,
      Option<Either<AppFailure, dynamic>> fetchFailure});
}

/// @nodoc
class _$ProgressStateCopyWithImpl<$Res, $Val extends ProgressState>
    implements $ProgressStateCopyWith<$Res> {
  _$ProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letters = null,
    Object? numbers = null,
    Object? things = null,
    Object? wordSelections = null,
    Object? wordMatches = null,
    Object? userProgresses = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(_value.copyWith(
      letters: null == letters
          ? _value.letters
          : letters // ignore: cast_nullable_to_non_nullable
              as List<Letter>,
      numbers: null == numbers
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<Number>,
      things: null == things
          ? _value.things
          : things // ignore: cast_nullable_to_non_nullable
              as List<Thing>,
      wordSelections: null == wordSelections
          ? _value.wordSelections
          : wordSelections // ignore: cast_nullable_to_non_nullable
              as List<WordSelection>,
      wordMatches: null == wordMatches
          ? _value.wordMatches
          : wordMatches // ignore: cast_nullable_to_non_nullable
              as List<WordMatch>,
      userProgresses: null == userProgresses
          ? _value.userProgresses
          : userProgresses // ignore: cast_nullable_to_non_nullable
              as List<UserProgress>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchFailure: null == fetchFailure
          ? _value.fetchFailure
          : fetchFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressStateImplCopyWith<$Res>
    implements $ProgressStateCopyWith<$Res> {
  factory _$$ProgressStateImplCopyWith(
          _$ProgressStateImpl value, $Res Function(_$ProgressStateImpl) then) =
      __$$ProgressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Letter> letters,
      List<Number> numbers,
      List<Thing> things,
      List<WordSelection> wordSelections,
      List<WordMatch> wordMatches,
      List<UserProgress> userProgresses,
      bool isLoading,
      Option<Either<AppFailure, dynamic>> fetchFailure});
}

/// @nodoc
class __$$ProgressStateImplCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res, _$ProgressStateImpl>
    implements _$$ProgressStateImplCopyWith<$Res> {
  __$$ProgressStateImplCopyWithImpl(
      _$ProgressStateImpl _value, $Res Function(_$ProgressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letters = null,
    Object? numbers = null,
    Object? things = null,
    Object? wordSelections = null,
    Object? wordMatches = null,
    Object? userProgresses = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(_$ProgressStateImpl(
      letters: null == letters
          ? _value._letters
          : letters // ignore: cast_nullable_to_non_nullable
              as List<Letter>,
      numbers: null == numbers
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<Number>,
      things: null == things
          ? _value._things
          : things // ignore: cast_nullable_to_non_nullable
              as List<Thing>,
      wordSelections: null == wordSelections
          ? _value._wordSelections
          : wordSelections // ignore: cast_nullable_to_non_nullable
              as List<WordSelection>,
      wordMatches: null == wordMatches
          ? _value._wordMatches
          : wordMatches // ignore: cast_nullable_to_non_nullable
              as List<WordMatch>,
      userProgresses: null == userProgresses
          ? _value._userProgresses
          : userProgresses // ignore: cast_nullable_to_non_nullable
              as List<UserProgress>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchFailure: null == fetchFailure
          ? _value.fetchFailure
          : fetchFailure // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ProgressStateImpl extends _ProgressState {
  const _$ProgressStateImpl(
      {required final List<Letter> letters,
      required final List<Number> numbers,
      required final List<Thing> things,
      required final List<WordSelection> wordSelections,
      required final List<WordMatch> wordMatches,
      required final List<UserProgress> userProgresses,
      required this.isLoading,
      required this.fetchFailure})
      : _letters = letters,
        _numbers = numbers,
        _things = things,
        _wordSelections = wordSelections,
        _wordMatches = wordMatches,
        _userProgresses = userProgresses,
        super._();

  final List<Letter> _letters;
  @override
  List<Letter> get letters {
    if (_letters is EqualUnmodifiableListView) return _letters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_letters);
  }

  final List<Number> _numbers;
  @override
  List<Number> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  final List<Thing> _things;
  @override
  List<Thing> get things {
    if (_things is EqualUnmodifiableListView) return _things;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_things);
  }

  final List<WordSelection> _wordSelections;
  @override
  List<WordSelection> get wordSelections {
    if (_wordSelections is EqualUnmodifiableListView) return _wordSelections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordSelections);
  }

  final List<WordMatch> _wordMatches;
  @override
  List<WordMatch> get wordMatches {
    if (_wordMatches is EqualUnmodifiableListView) return _wordMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordMatches);
  }

  final List<UserProgress> _userProgresses;
  @override
  List<UserProgress> get userProgresses {
    if (_userProgresses is EqualUnmodifiableListView) return _userProgresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userProgresses);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<AppFailure, dynamic>> fetchFailure;

  @override
  String toString() {
    return 'ProgressState(letters: $letters, numbers: $numbers, things: $things, wordSelections: $wordSelections, wordMatches: $wordMatches, userProgresses: $userProgresses, isLoading: $isLoading, fetchFailure: $fetchFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressStateImpl &&
            const DeepCollectionEquality().equals(other._letters, _letters) &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality().equals(other._things, _things) &&
            const DeepCollectionEquality()
                .equals(other._wordSelections, _wordSelections) &&
            const DeepCollectionEquality()
                .equals(other._wordMatches, _wordMatches) &&
            const DeepCollectionEquality()
                .equals(other._userProgresses, _userProgresses) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.fetchFailure, fetchFailure) ||
                other.fetchFailure == fetchFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_letters),
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(_things),
      const DeepCollectionEquality().hash(_wordSelections),
      const DeepCollectionEquality().hash(_wordMatches),
      const DeepCollectionEquality().hash(_userProgresses),
      isLoading,
      fetchFailure);

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressStateImplCopyWith<_$ProgressStateImpl> get copyWith =>
      __$$ProgressStateImplCopyWithImpl<_$ProgressStateImpl>(this, _$identity);
}

abstract class _ProgressState extends ProgressState {
  const factory _ProgressState(
          {required final List<Letter> letters,
          required final List<Number> numbers,
          required final List<Thing> things,
          required final List<WordSelection> wordSelections,
          required final List<WordMatch> wordMatches,
          required final List<UserProgress> userProgresses,
          required final bool isLoading,
          required final Option<Either<AppFailure, dynamic>> fetchFailure}) =
      _$ProgressStateImpl;
  const _ProgressState._() : super._();

  @override
  List<Letter> get letters;
  @override
  List<Number> get numbers;
  @override
  List<Thing> get things;
  @override
  List<WordSelection> get wordSelections;
  @override
  List<WordMatch> get wordMatches;
  @override
  List<UserProgress> get userProgresses;
  @override
  bool get isLoading;
  @override
  Option<Either<AppFailure, dynamic>> get fetchFailure;

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressStateImplCopyWith<_$ProgressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
