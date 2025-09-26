// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NumberDetailEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId) getNumberDetail,
    required TResult Function(String userId, String progressId)
    updateNumberDetailProgress,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId)? getNumberDetail,
    TResult? Function(String userId, String progressId)?
    updateNumberDetailProgress,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId)? getNumberDetail,
    TResult Function(String userId, String progressId)?
    updateNumberDetailProgress,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNumberDetail value) getNumberDetail,
    required TResult Function(_UpdateNumberDetailProgress value)
    updateNumberDetailProgress,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNumberDetail value)? getNumberDetail,
    TResult? Function(_UpdateNumberDetailProgress value)?
    updateNumberDetailProgress,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNumberDetail value)? getNumberDetail,
    TResult Function(_UpdateNumberDetailProgress value)?
    updateNumberDetailProgress,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of NumberDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberDetailEventCopyWith<NumberDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberDetailEventCopyWith<$Res> {
  factory $NumberDetailEventCopyWith(
    NumberDetailEvent value,
    $Res Function(NumberDetailEvent) then,
  ) = _$NumberDetailEventCopyWithImpl<$Res, NumberDetailEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$NumberDetailEventCopyWithImpl<$Res, $Val extends NumberDetailEvent>
    implements $NumberDetailEventCopyWith<$Res> {
  _$NumberDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _value.copyWith(
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetNumberDetailImplCopyWith<$Res>
    implements $NumberDetailEventCopyWith<$Res> {
  factory _$$GetNumberDetailImplCopyWith(
    _$GetNumberDetailImpl value,
    $Res Function(_$GetNumberDetailImpl) then,
  ) = __$$GetNumberDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId});
}

/// @nodoc
class __$$GetNumberDetailImplCopyWithImpl<$Res>
    extends _$NumberDetailEventCopyWithImpl<$Res, _$GetNumberDetailImpl>
    implements _$$GetNumberDetailImplCopyWith<$Res> {
  __$$GetNumberDetailImplCopyWithImpl(
    _$GetNumberDetailImpl _value,
    $Res Function(_$GetNumberDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumberDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? userId = null}) {
    return _then(
      _$GetNumberDetailImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetNumberDetailImpl implements _GetNumberDetail {
  const _$GetNumberDetailImpl({required this.id, required this.userId});

  @override
  final String id;
  @override
  final String userId;

  @override
  String toString() {
    return 'NumberDetailEvent.getNumberDetail(id: $id, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNumberDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId);

  /// Create a copy of NumberDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNumberDetailImplCopyWith<_$GetNumberDetailImpl> get copyWith =>
      __$$GetNumberDetailImplCopyWithImpl<_$GetNumberDetailImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId) getNumberDetail,
    required TResult Function(String userId, String progressId)
    updateNumberDetailProgress,
  }) {
    return getNumberDetail(id, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId)? getNumberDetail,
    TResult? Function(String userId, String progressId)?
    updateNumberDetailProgress,
  }) {
    return getNumberDetail?.call(id, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId)? getNumberDetail,
    TResult Function(String userId, String progressId)?
    updateNumberDetailProgress,
    required TResult orElse(),
  }) {
    if (getNumberDetail != null) {
      return getNumberDetail(id, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNumberDetail value) getNumberDetail,
    required TResult Function(_UpdateNumberDetailProgress value)
    updateNumberDetailProgress,
  }) {
    return getNumberDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNumberDetail value)? getNumberDetail,
    TResult? Function(_UpdateNumberDetailProgress value)?
    updateNumberDetailProgress,
  }) {
    return getNumberDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNumberDetail value)? getNumberDetail,
    TResult Function(_UpdateNumberDetailProgress value)?
    updateNumberDetailProgress,
    required TResult orElse(),
  }) {
    if (getNumberDetail != null) {
      return getNumberDetail(this);
    }
    return orElse();
  }
}

abstract class _GetNumberDetail implements NumberDetailEvent {
  const factory _GetNumberDetail({
    required final String id,
    required final String userId,
  }) = _$GetNumberDetailImpl;

  String get id;
  @override
  String get userId;

  /// Create a copy of NumberDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetNumberDetailImplCopyWith<_$GetNumberDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNumberDetailProgressImplCopyWith<$Res>
    implements $NumberDetailEventCopyWith<$Res> {
  factory _$$UpdateNumberDetailProgressImplCopyWith(
    _$UpdateNumberDetailProgressImpl value,
    $Res Function(_$UpdateNumberDetailProgressImpl) then,
  ) = __$$UpdateNumberDetailProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String progressId});
}

/// @nodoc
class __$$UpdateNumberDetailProgressImplCopyWithImpl<$Res>
    extends
        _$NumberDetailEventCopyWithImpl<$Res, _$UpdateNumberDetailProgressImpl>
    implements _$$UpdateNumberDetailProgressImplCopyWith<$Res> {
  __$$UpdateNumberDetailProgressImplCopyWithImpl(
    _$UpdateNumberDetailProgressImpl _value,
    $Res Function(_$UpdateNumberDetailProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumberDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? progressId = null}) {
    return _then(
      _$UpdateNumberDetailProgressImpl(
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        progressId:
            null == progressId
                ? _value.progressId
                : progressId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateNumberDetailProgressImpl implements _UpdateNumberDetailProgress {
  const _$UpdateNumberDetailProgressImpl({
    required this.userId,
    required this.progressId,
  });

  @override
  final String userId;
  @override
  final String progressId;

  @override
  String toString() {
    return 'NumberDetailEvent.updateNumberDetailProgress(userId: $userId, progressId: $progressId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNumberDetailProgressImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.progressId, progressId) ||
                other.progressId == progressId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, progressId);

  /// Create a copy of NumberDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNumberDetailProgressImplCopyWith<_$UpdateNumberDetailProgressImpl>
  get copyWith => __$$UpdateNumberDetailProgressImplCopyWithImpl<
    _$UpdateNumberDetailProgressImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId) getNumberDetail,
    required TResult Function(String userId, String progressId)
    updateNumberDetailProgress,
  }) {
    return updateNumberDetailProgress(userId, progressId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId)? getNumberDetail,
    TResult? Function(String userId, String progressId)?
    updateNumberDetailProgress,
  }) {
    return updateNumberDetailProgress?.call(userId, progressId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId)? getNumberDetail,
    TResult Function(String userId, String progressId)?
    updateNumberDetailProgress,
    required TResult orElse(),
  }) {
    if (updateNumberDetailProgress != null) {
      return updateNumberDetailProgress(userId, progressId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetNumberDetail value) getNumberDetail,
    required TResult Function(_UpdateNumberDetailProgress value)
    updateNumberDetailProgress,
  }) {
    return updateNumberDetailProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetNumberDetail value)? getNumberDetail,
    TResult? Function(_UpdateNumberDetailProgress value)?
    updateNumberDetailProgress,
  }) {
    return updateNumberDetailProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetNumberDetail value)? getNumberDetail,
    TResult Function(_UpdateNumberDetailProgress value)?
    updateNumberDetailProgress,
    required TResult orElse(),
  }) {
    if (updateNumberDetailProgress != null) {
      return updateNumberDetailProgress(this);
    }
    return orElse();
  }
}

abstract class _UpdateNumberDetailProgress implements NumberDetailEvent {
  const factory _UpdateNumberDetailProgress({
    required final String userId,
    required final String progressId,
  }) = _$UpdateNumberDetailProgressImpl;

  @override
  String get userId;
  String get progressId;

  /// Create a copy of NumberDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNumberDetailProgressImplCopyWith<_$UpdateNumberDetailProgressImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NumberDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  Number get number => throw _privateConstructorUsedError;
  Option<Either<AppFailure, Number>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<AppFailure, Unit>> get fetchNumberDetailProgress =>
      throw _privateConstructorUsedError;

  /// Create a copy of NumberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberDetailStateCopyWith<NumberDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberDetailStateCopyWith<$Res> {
  factory $NumberDetailStateCopyWith(
    NumberDetailState value,
    $Res Function(NumberDetailState) then,
  ) = _$NumberDetailStateCopyWithImpl<$Res, NumberDetailState>;
  @useResult
  $Res call({
    bool isLoading,
    Number number,
    Option<Either<AppFailure, Number>> failureOrSuccessOption,
    Option<Either<AppFailure, Unit>> fetchNumberDetailProgress,
  });

  $NumberCopyWith<$Res> get number;
}

/// @nodoc
class _$NumberDetailStateCopyWithImpl<$Res, $Val extends NumberDetailState>
    implements $NumberDetailStateCopyWith<$Res> {
  _$NumberDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? number = null,
    Object? failureOrSuccessOption = null,
    Object? fetchNumberDetailProgress = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            number:
                null == number
                    ? _value.number
                    : number // ignore: cast_nullable_to_non_nullable
                        as Number,
            failureOrSuccessOption:
                null == failureOrSuccessOption
                    ? _value.failureOrSuccessOption
                    : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
                        as Option<Either<AppFailure, Number>>,
            fetchNumberDetailProgress:
                null == fetchNumberDetailProgress
                    ? _value.fetchNumberDetailProgress
                    : fetchNumberDetailProgress // ignore: cast_nullable_to_non_nullable
                        as Option<Either<AppFailure, Unit>>,
          )
          as $Val,
    );
  }

  /// Create a copy of NumberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NumberCopyWith<$Res> get number {
    return $NumberCopyWith<$Res>(_value.number, (value) {
      return _then(_value.copyWith(number: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NumberDetailStateImplCopyWith<$Res>
    implements $NumberDetailStateCopyWith<$Res> {
  factory _$$NumberDetailStateImplCopyWith(
    _$NumberDetailStateImpl value,
    $Res Function(_$NumberDetailStateImpl) then,
  ) = __$$NumberDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    Number number,
    Option<Either<AppFailure, Number>> failureOrSuccessOption,
    Option<Either<AppFailure, Unit>> fetchNumberDetailProgress,
  });

  @override
  $NumberCopyWith<$Res> get number;
}

/// @nodoc
class __$$NumberDetailStateImplCopyWithImpl<$Res>
    extends _$NumberDetailStateCopyWithImpl<$Res, _$NumberDetailStateImpl>
    implements _$$NumberDetailStateImplCopyWith<$Res> {
  __$$NumberDetailStateImplCopyWithImpl(
    _$NumberDetailStateImpl _value,
    $Res Function(_$NumberDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? number = null,
    Object? failureOrSuccessOption = null,
    Object? fetchNumberDetailProgress = null,
  }) {
    return _then(
      _$NumberDetailStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        number:
            null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                    as Number,
        failureOrSuccessOption:
            null == failureOrSuccessOption
                ? _value.failureOrSuccessOption
                : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
                    as Option<Either<AppFailure, Number>>,
        fetchNumberDetailProgress:
            null == fetchNumberDetailProgress
                ? _value.fetchNumberDetailProgress
                : fetchNumberDetailProgress // ignore: cast_nullable_to_non_nullable
                    as Option<Either<AppFailure, Unit>>,
      ),
    );
  }
}

/// @nodoc

class _$NumberDetailStateImpl implements _NumberDetailState {
  const _$NumberDetailStateImpl({
    required this.isLoading,
    required this.number,
    required this.failureOrSuccessOption,
    required this.fetchNumberDetailProgress,
  });

  @override
  final bool isLoading;
  @override
  final Number number;
  @override
  final Option<Either<AppFailure, Number>> failureOrSuccessOption;
  @override
  final Option<Either<AppFailure, Unit>> fetchNumberDetailProgress;

  @override
  String toString() {
    return 'NumberDetailState(isLoading: $isLoading, number: $number, failureOrSuccessOption: $failureOrSuccessOption, fetchNumberDetailProgress: $fetchNumberDetailProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(
                  other.fetchNumberDetailProgress,
                  fetchNumberDetailProgress,
                ) ||
                other.fetchNumberDetailProgress == fetchNumberDetailProgress));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    number,
    failureOrSuccessOption,
    fetchNumberDetailProgress,
  );

  /// Create a copy of NumberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberDetailStateImplCopyWith<_$NumberDetailStateImpl> get copyWith =>
      __$$NumberDetailStateImplCopyWithImpl<_$NumberDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _NumberDetailState implements NumberDetailState {
  const factory _NumberDetailState({
    required final bool isLoading,
    required final Number number,
    required final Option<Either<AppFailure, Number>> failureOrSuccessOption,
    required final Option<Either<AppFailure, Unit>> fetchNumberDetailProgress,
  }) = _$NumberDetailStateImpl;

  @override
  bool get isLoading;
  @override
  Number get number;
  @override
  Option<Either<AppFailure, Number>> get failureOrSuccessOption;
  @override
  Option<Either<AppFailure, Unit>> get fetchNumberDetailProgress;

  /// Create a copy of NumberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberDetailStateImplCopyWith<_$NumberDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
