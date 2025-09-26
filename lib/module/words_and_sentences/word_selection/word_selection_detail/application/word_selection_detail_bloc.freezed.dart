// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_selection_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WordSelectionDetailEvent {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get progressId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId, String progressId)
    initialize,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId, String progressId)? initialize,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId, String progressId)? initialize,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of WordSelectionDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSelectionDetailEventCopyWith<WordSelectionDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSelectionDetailEventCopyWith<$Res> {
  factory $WordSelectionDetailEventCopyWith(
    WordSelectionDetailEvent value,
    $Res Function(WordSelectionDetailEvent) then,
  ) = _$WordSelectionDetailEventCopyWithImpl<$Res, WordSelectionDetailEvent>;
  @useResult
  $Res call({String id, String userId, String progressId});
}

/// @nodoc
class _$WordSelectionDetailEventCopyWithImpl<
  $Res,
  $Val extends WordSelectionDetailEvent
>
    implements $WordSelectionDetailEventCopyWith<$Res> {
  _$WordSelectionDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSelectionDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? progressId = null,
  }) {
    return _then(
      _value.copyWith(
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
            progressId:
                null == progressId
                    ? _value.progressId
                    : progressId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res>
    implements $WordSelectionDetailEventCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
    _$InitializeImpl value,
    $Res Function(_$InitializeImpl) then,
  ) = __$$InitializeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId, String progressId});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$WordSelectionDetailEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
    _$InitializeImpl _value,
    $Res Function(_$InitializeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordSelectionDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? progressId = null,
  }) {
    return _then(
      _$InitializeImpl(
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

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({
    required this.id,
    required this.userId,
    required this.progressId,
  });

  @override
  final String id;
  @override
  final String userId;
  @override
  final String progressId;

  @override
  String toString() {
    return 'WordSelectionDetailEvent.initialize(id: $id, userId: $userId, progressId: $progressId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.progressId, progressId) ||
                other.progressId == progressId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, progressId);

  /// Create a copy of WordSelectionDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId, String progressId)
    initialize,
  }) {
    return initialize(id, userId, progressId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId, String progressId)? initialize,
  }) {
    return initialize?.call(id, userId, progressId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId, String progressId)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(id, userId, progressId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements WordSelectionDetailEvent {
  const factory _Initialize({
    required final String id,
    required final String userId,
    required final String progressId,
  }) = _$InitializeImpl;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get progressId;

  /// Create a copy of WordSelectionDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WordSelectionDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  WordSelection get wordSelection => throw _privateConstructorUsedError;
  List<UserExercise> get exercises => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get fetchFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of WordSelectionDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSelectionDetailStateCopyWith<WordSelectionDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSelectionDetailStateCopyWith<$Res> {
  factory $WordSelectionDetailStateCopyWith(
    WordSelectionDetailState value,
    $Res Function(WordSelectionDetailState) then,
  ) = _$WordSelectionDetailStateCopyWithImpl<$Res, WordSelectionDetailState>;
  @useResult
  $Res call({
    bool isLoading,
    WordSelection wordSelection,
    List<UserExercise> exercises,
    Option<Either<AppFailure, dynamic>> fetchFailure,
  });

  $WordSelectionCopyWith<$Res> get wordSelection;
}

/// @nodoc
class _$WordSelectionDetailStateCopyWithImpl<
  $Res,
  $Val extends WordSelectionDetailState
>
    implements $WordSelectionDetailStateCopyWith<$Res> {
  _$WordSelectionDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSelectionDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? wordSelection = null,
    Object? exercises = null,
    Object? fetchFailure = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            wordSelection:
                null == wordSelection
                    ? _value.wordSelection
                    : wordSelection // ignore: cast_nullable_to_non_nullable
                        as WordSelection,
            exercises:
                null == exercises
                    ? _value.exercises
                    : exercises // ignore: cast_nullable_to_non_nullable
                        as List<UserExercise>,
            fetchFailure:
                null == fetchFailure
                    ? _value.fetchFailure
                    : fetchFailure // ignore: cast_nullable_to_non_nullable
                        as Option<Either<AppFailure, dynamic>>,
          )
          as $Val,
    );
  }

  /// Create a copy of WordSelectionDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordSelectionCopyWith<$Res> get wordSelection {
    return $WordSelectionCopyWith<$Res>(_value.wordSelection, (value) {
      return _then(_value.copyWith(wordSelection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WordSelectionDetailStateImplCopyWith<$Res>
    implements $WordSelectionDetailStateCopyWith<$Res> {
  factory _$$WordSelectionDetailStateImplCopyWith(
    _$WordSelectionDetailStateImpl value,
    $Res Function(_$WordSelectionDetailStateImpl) then,
  ) = __$$WordSelectionDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    WordSelection wordSelection,
    List<UserExercise> exercises,
    Option<Either<AppFailure, dynamic>> fetchFailure,
  });

  @override
  $WordSelectionCopyWith<$Res> get wordSelection;
}

/// @nodoc
class __$$WordSelectionDetailStateImplCopyWithImpl<$Res>
    extends
        _$WordSelectionDetailStateCopyWithImpl<
          $Res,
          _$WordSelectionDetailStateImpl
        >
    implements _$$WordSelectionDetailStateImplCopyWith<$Res> {
  __$$WordSelectionDetailStateImplCopyWithImpl(
    _$WordSelectionDetailStateImpl _value,
    $Res Function(_$WordSelectionDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WordSelectionDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? wordSelection = null,
    Object? exercises = null,
    Object? fetchFailure = null,
  }) {
    return _then(
      _$WordSelectionDetailStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        wordSelection:
            null == wordSelection
                ? _value.wordSelection
                : wordSelection // ignore: cast_nullable_to_non_nullable
                    as WordSelection,
        exercises:
            null == exercises
                ? _value._exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                    as List<UserExercise>,
        fetchFailure:
            null == fetchFailure
                ? _value.fetchFailure
                : fetchFailure // ignore: cast_nullable_to_non_nullable
                    as Option<Either<AppFailure, dynamic>>,
      ),
    );
  }
}

/// @nodoc

class _$WordSelectionDetailStateImpl implements _WordSelectionDetailState {
  const _$WordSelectionDetailStateImpl({
    required this.isLoading,
    required this.wordSelection,
    required final List<UserExercise> exercises,
    required this.fetchFailure,
  }) : _exercises = exercises;

  @override
  final bool isLoading;
  @override
  final WordSelection wordSelection;
  final List<UserExercise> _exercises;
  @override
  List<UserExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final Option<Either<AppFailure, dynamic>> fetchFailure;

  @override
  String toString() {
    return 'WordSelectionDetailState(isLoading: $isLoading, wordSelection: $wordSelection, exercises: $exercises, fetchFailure: $fetchFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSelectionDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.wordSelection, wordSelection) ||
                other.wordSelection == wordSelection) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.fetchFailure, fetchFailure) ||
                other.fetchFailure == fetchFailure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    wordSelection,
    const DeepCollectionEquality().hash(_exercises),
    fetchFailure,
  );

  /// Create a copy of WordSelectionDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSelectionDetailStateImplCopyWith<_$WordSelectionDetailStateImpl>
  get copyWith => __$$WordSelectionDetailStateImplCopyWithImpl<
    _$WordSelectionDetailStateImpl
  >(this, _$identity);
}

abstract class _WordSelectionDetailState implements WordSelectionDetailState {
  const factory _WordSelectionDetailState({
    required final bool isLoading,
    required final WordSelection wordSelection,
    required final List<UserExercise> exercises,
    required final Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _$WordSelectionDetailStateImpl;

  @override
  bool get isLoading;
  @override
  WordSelection get wordSelection;
  @override
  List<UserExercise> get exercises;
  @override
  Option<Either<AppFailure, dynamic>> get fetchFailure;

  /// Create a copy of WordSelectionDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordSelectionDetailStateImplCopyWith<_$WordSelectionDetailStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
