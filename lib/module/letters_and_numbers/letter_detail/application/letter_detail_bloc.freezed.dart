// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LetterDetailEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId) getLetterDetail,
    required TResult Function(String userId, String progressId)
        updateLetterDetailProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId)? getLetterDetail,
    TResult? Function(String userId, String progressId)?
        updateLetterDetailProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId)? getLetterDetail,
    TResult Function(String userId, String progressId)?
        updateLetterDetailProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLetterDetail value) getLetterDetail,
    required TResult Function(_UpdateLetterDetailProgress value)
        updateLetterDetailProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLetterDetail value)? getLetterDetail,
    TResult? Function(_UpdateLetterDetailProgress value)?
        updateLetterDetailProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLetterDetail value)? getLetterDetail,
    TResult Function(_UpdateLetterDetailProgress value)?
        updateLetterDetailProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of LetterDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LetterDetailEventCopyWith<LetterDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterDetailEventCopyWith<$Res> {
  factory $LetterDetailEventCopyWith(
          LetterDetailEvent value, $Res Function(LetterDetailEvent) then) =
      _$LetterDetailEventCopyWithImpl<$Res, LetterDetailEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$LetterDetailEventCopyWithImpl<$Res, $Val extends LetterDetailEvent>
    implements $LetterDetailEventCopyWith<$Res> {
  _$LetterDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LetterDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetLetterDetailImplCopyWith<$Res>
    implements $LetterDetailEventCopyWith<$Res> {
  factory _$$GetLetterDetailImplCopyWith(_$GetLetterDetailImpl value,
          $Res Function(_$GetLetterDetailImpl) then) =
      __$$GetLetterDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId});
}

/// @nodoc
class __$$GetLetterDetailImplCopyWithImpl<$Res>
    extends _$LetterDetailEventCopyWithImpl<$Res, _$GetLetterDetailImpl>
    implements _$$GetLetterDetailImplCopyWith<$Res> {
  __$$GetLetterDetailImplCopyWithImpl(
      _$GetLetterDetailImpl _value, $Res Function(_$GetLetterDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of LetterDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
  }) {
    return _then(_$GetLetterDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetLetterDetailImpl implements _GetLetterDetail {
  const _$GetLetterDetailImpl({required this.id, required this.userId});

  @override
  final String id;
  @override
  final String userId;

  @override
  String toString() {
    return 'LetterDetailEvent.getLetterDetail(id: $id, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLetterDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId);

  /// Create a copy of LetterDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLetterDetailImplCopyWith<_$GetLetterDetailImpl> get copyWith =>
      __$$GetLetterDetailImplCopyWithImpl<_$GetLetterDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId) getLetterDetail,
    required TResult Function(String userId, String progressId)
        updateLetterDetailProgress,
  }) {
    return getLetterDetail(id, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId)? getLetterDetail,
    TResult? Function(String userId, String progressId)?
        updateLetterDetailProgress,
  }) {
    return getLetterDetail?.call(id, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId)? getLetterDetail,
    TResult Function(String userId, String progressId)?
        updateLetterDetailProgress,
    required TResult orElse(),
  }) {
    if (getLetterDetail != null) {
      return getLetterDetail(id, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLetterDetail value) getLetterDetail,
    required TResult Function(_UpdateLetterDetailProgress value)
        updateLetterDetailProgress,
  }) {
    return getLetterDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLetterDetail value)? getLetterDetail,
    TResult? Function(_UpdateLetterDetailProgress value)?
        updateLetterDetailProgress,
  }) {
    return getLetterDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLetterDetail value)? getLetterDetail,
    TResult Function(_UpdateLetterDetailProgress value)?
        updateLetterDetailProgress,
    required TResult orElse(),
  }) {
    if (getLetterDetail != null) {
      return getLetterDetail(this);
    }
    return orElse();
  }
}

abstract class _GetLetterDetail implements LetterDetailEvent {
  const factory _GetLetterDetail(
      {required final String id,
      required final String userId}) = _$GetLetterDetailImpl;

  String get id;
  @override
  String get userId;

  /// Create a copy of LetterDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetLetterDetailImplCopyWith<_$GetLetterDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateLetterDetailProgressImplCopyWith<$Res>
    implements $LetterDetailEventCopyWith<$Res> {
  factory _$$UpdateLetterDetailProgressImplCopyWith(
          _$UpdateLetterDetailProgressImpl value,
          $Res Function(_$UpdateLetterDetailProgressImpl) then) =
      __$$UpdateLetterDetailProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String progressId});
}

/// @nodoc
class __$$UpdateLetterDetailProgressImplCopyWithImpl<$Res>
    extends _$LetterDetailEventCopyWithImpl<$Res,
        _$UpdateLetterDetailProgressImpl>
    implements _$$UpdateLetterDetailProgressImplCopyWith<$Res> {
  __$$UpdateLetterDetailProgressImplCopyWithImpl(
      _$UpdateLetterDetailProgressImpl _value,
      $Res Function(_$UpdateLetterDetailProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of LetterDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? progressId = null,
  }) {
    return _then(_$UpdateLetterDetailProgressImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      progressId: null == progressId
          ? _value.progressId
          : progressId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateLetterDetailProgressImpl implements _UpdateLetterDetailProgress {
  const _$UpdateLetterDetailProgressImpl(
      {required this.userId, required this.progressId});

  @override
  final String userId;
  @override
  final String progressId;

  @override
  String toString() {
    return 'LetterDetailEvent.updateLetterDetailProgress(userId: $userId, progressId: $progressId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLetterDetailProgressImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.progressId, progressId) ||
                other.progressId == progressId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, progressId);

  /// Create a copy of LetterDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLetterDetailProgressImplCopyWith<_$UpdateLetterDetailProgressImpl>
      get copyWith => __$$UpdateLetterDetailProgressImplCopyWithImpl<
          _$UpdateLetterDetailProgressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId) getLetterDetail,
    required TResult Function(String userId, String progressId)
        updateLetterDetailProgress,
  }) {
    return updateLetterDetailProgress(userId, progressId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId)? getLetterDetail,
    TResult? Function(String userId, String progressId)?
        updateLetterDetailProgress,
  }) {
    return updateLetterDetailProgress?.call(userId, progressId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId)? getLetterDetail,
    TResult Function(String userId, String progressId)?
        updateLetterDetailProgress,
    required TResult orElse(),
  }) {
    if (updateLetterDetailProgress != null) {
      return updateLetterDetailProgress(userId, progressId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLetterDetail value) getLetterDetail,
    required TResult Function(_UpdateLetterDetailProgress value)
        updateLetterDetailProgress,
  }) {
    return updateLetterDetailProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLetterDetail value)? getLetterDetail,
    TResult? Function(_UpdateLetterDetailProgress value)?
        updateLetterDetailProgress,
  }) {
    return updateLetterDetailProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLetterDetail value)? getLetterDetail,
    TResult Function(_UpdateLetterDetailProgress value)?
        updateLetterDetailProgress,
    required TResult orElse(),
  }) {
    if (updateLetterDetailProgress != null) {
      return updateLetterDetailProgress(this);
    }
    return orElse();
  }
}

abstract class _UpdateLetterDetailProgress implements LetterDetailEvent {
  const factory _UpdateLetterDetailProgress(
      {required final String userId,
      required final String progressId}) = _$UpdateLetterDetailProgressImpl;

  @override
  String get userId;
  String get progressId;

  /// Create a copy of LetterDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateLetterDetailProgressImplCopyWith<_$UpdateLetterDetailProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LetterDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  Letter get letter => throw _privateConstructorUsedError;
  Option<Either<AppFailure, Letter>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<AppFailure, Unit>> get fetchLetterDetailProgress =>
      throw _privateConstructorUsedError;

  /// Create a copy of LetterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LetterDetailStateCopyWith<LetterDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterDetailStateCopyWith<$Res> {
  factory $LetterDetailStateCopyWith(
          LetterDetailState value, $Res Function(LetterDetailState) then) =
      _$LetterDetailStateCopyWithImpl<$Res, LetterDetailState>;
  @useResult
  $Res call(
      {bool isLoading,
      Letter letter,
      Option<Either<AppFailure, Letter>> failureOrSuccessOption,
      Option<Either<AppFailure, Unit>> fetchLetterDetailProgress});

  $LetterCopyWith<$Res> get letter;
}

/// @nodoc
class _$LetterDetailStateCopyWithImpl<$Res, $Val extends LetterDetailState>
    implements $LetterDetailStateCopyWith<$Res> {
  _$LetterDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LetterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? letter = null,
    Object? failureOrSuccessOption = null,
    Object? fetchLetterDetailProgress = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as Letter,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, Letter>>,
      fetchLetterDetailProgress: null == fetchLetterDetailProgress
          ? _value.fetchLetterDetailProgress
          : fetchLetterDetailProgress // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, Unit>>,
    ) as $Val);
  }

  /// Create a copy of LetterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LetterCopyWith<$Res> get letter {
    return $LetterCopyWith<$Res>(_value.letter, (value) {
      return _then(_value.copyWith(letter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LetterDetailStateImplCopyWith<$Res>
    implements $LetterDetailStateCopyWith<$Res> {
  factory _$$LetterDetailStateImplCopyWith(_$LetterDetailStateImpl value,
          $Res Function(_$LetterDetailStateImpl) then) =
      __$$LetterDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Letter letter,
      Option<Either<AppFailure, Letter>> failureOrSuccessOption,
      Option<Either<AppFailure, Unit>> fetchLetterDetailProgress});

  @override
  $LetterCopyWith<$Res> get letter;
}

/// @nodoc
class __$$LetterDetailStateImplCopyWithImpl<$Res>
    extends _$LetterDetailStateCopyWithImpl<$Res, _$LetterDetailStateImpl>
    implements _$$LetterDetailStateImplCopyWith<$Res> {
  __$$LetterDetailStateImplCopyWithImpl(_$LetterDetailStateImpl _value,
      $Res Function(_$LetterDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LetterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? letter = null,
    Object? failureOrSuccessOption = null,
    Object? fetchLetterDetailProgress = null,
  }) {
    return _then(_$LetterDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as Letter,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, Letter>>,
      fetchLetterDetailProgress: null == fetchLetterDetailProgress
          ? _value.fetchLetterDetailProgress
          : fetchLetterDetailProgress // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$LetterDetailStateImpl implements _LetterDetailState {
  const _$LetterDetailStateImpl(
      {required this.isLoading,
      required this.letter,
      required this.failureOrSuccessOption,
      required this.fetchLetterDetailProgress});

  @override
  final bool isLoading;
  @override
  final Letter letter;
  @override
  final Option<Either<AppFailure, Letter>> failureOrSuccessOption;
  @override
  final Option<Either<AppFailure, Unit>> fetchLetterDetailProgress;

  @override
  String toString() {
    return 'LetterDetailState(isLoading: $isLoading, letter: $letter, failureOrSuccessOption: $failureOrSuccessOption, fetchLetterDetailProgress: $fetchLetterDetailProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetterDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.fetchLetterDetailProgress,
                    fetchLetterDetailProgress) ||
                other.fetchLetterDetailProgress == fetchLetterDetailProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, letter,
      failureOrSuccessOption, fetchLetterDetailProgress);

  /// Create a copy of LetterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LetterDetailStateImplCopyWith<_$LetterDetailStateImpl> get copyWith =>
      __$$LetterDetailStateImplCopyWithImpl<_$LetterDetailStateImpl>(
          this, _$identity);
}

abstract class _LetterDetailState implements LetterDetailState {
  const factory _LetterDetailState(
      {required final bool isLoading,
      required final Letter letter,
      required final Option<Either<AppFailure, Letter>> failureOrSuccessOption,
      required final Option<Either<AppFailure, Unit>>
          fetchLetterDetailProgress}) = _$LetterDetailStateImpl;

  @override
  bool get isLoading;
  @override
  Letter get letter;
  @override
  Option<Either<AppFailure, Letter>> get failureOrSuccessOption;
  @override
  Option<Either<AppFailure, Unit>> get fetchLetterDetailProgress;

  /// Create a copy of LetterDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LetterDetailStateImplCopyWith<_$LetterDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
