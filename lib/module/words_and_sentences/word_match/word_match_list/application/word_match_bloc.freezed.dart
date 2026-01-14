// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_match_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WordMatchEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of WordMatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordMatchEventCopyWith<WordMatchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordMatchEventCopyWith<$Res> {
  factory $WordMatchEventCopyWith(
          WordMatchEvent value, $Res Function(WordMatchEvent) then) =
      _$WordMatchEventCopyWithImpl<$Res, WordMatchEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$WordMatchEventCopyWithImpl<$Res, $Val extends WordMatchEvent>
    implements $WordMatchEventCopyWith<$Res> {
  _$WordMatchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordMatchEvent
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
abstract class _$$InitializeImplCopyWith<$Res>
    implements $WordMatchEventCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$WordMatchEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordMatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$InitializeImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'WordMatchEvent.initialize(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of WordMatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) initialize,
  }) {
    return initialize(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? initialize,
  }) {
    return initialize?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(userId);
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

abstract class _Initialize implements WordMatchEvent {
  const factory _Initialize({required final String userId}) = _$InitializeImpl;

  @override
  String get userId;

  /// Create a copy of WordMatchEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WordMatchState {
  List<WordMatch> get wordMatches => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get fetchFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of WordMatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordMatchStateCopyWith<WordMatchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordMatchStateCopyWith<$Res> {
  factory $WordMatchStateCopyWith(
          WordMatchState value, $Res Function(WordMatchState) then) =
      _$WordMatchStateCopyWithImpl<$Res, WordMatchState>;
  @useResult
  $Res call(
      {List<WordMatch> wordMatches,
      bool isLoading,
      Option<Either<AppFailure, dynamic>> fetchFailure});
}

/// @nodoc
class _$WordMatchStateCopyWithImpl<$Res, $Val extends WordMatchState>
    implements $WordMatchStateCopyWith<$Res> {
  _$WordMatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordMatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordMatches = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(_value.copyWith(
      wordMatches: null == wordMatches
          ? _value.wordMatches
          : wordMatches // ignore: cast_nullable_to_non_nullable
              as List<WordMatch>,
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
abstract class _$$WordMatchStateImplCopyWith<$Res>
    implements $WordMatchStateCopyWith<$Res> {
  factory _$$WordMatchStateImplCopyWith(_$WordMatchStateImpl value,
          $Res Function(_$WordMatchStateImpl) then) =
      __$$WordMatchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WordMatch> wordMatches,
      bool isLoading,
      Option<Either<AppFailure, dynamic>> fetchFailure});
}

/// @nodoc
class __$$WordMatchStateImplCopyWithImpl<$Res>
    extends _$WordMatchStateCopyWithImpl<$Res, _$WordMatchStateImpl>
    implements _$$WordMatchStateImplCopyWith<$Res> {
  __$$WordMatchStateImplCopyWithImpl(
      _$WordMatchStateImpl _value, $Res Function(_$WordMatchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordMatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordMatches = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(_$WordMatchStateImpl(
      wordMatches: null == wordMatches
          ? _value._wordMatches
          : wordMatches // ignore: cast_nullable_to_non_nullable
              as List<WordMatch>,
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

class _$WordMatchStateImpl extends _WordMatchState {
  const _$WordMatchStateImpl(
      {required final List<WordMatch> wordMatches,
      required this.isLoading,
      required this.fetchFailure})
      : _wordMatches = wordMatches,
        super._();

  final List<WordMatch> _wordMatches;
  @override
  List<WordMatch> get wordMatches {
    if (_wordMatches is EqualUnmodifiableListView) return _wordMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordMatches);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<AppFailure, dynamic>> fetchFailure;

  @override
  String toString() {
    return 'WordMatchState(wordMatches: $wordMatches, isLoading: $isLoading, fetchFailure: $fetchFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordMatchStateImpl &&
            const DeepCollectionEquality()
                .equals(other._wordMatches, _wordMatches) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.fetchFailure, fetchFailure) ||
                other.fetchFailure == fetchFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wordMatches),
      isLoading,
      fetchFailure);

  /// Create a copy of WordMatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordMatchStateImplCopyWith<_$WordMatchStateImpl> get copyWith =>
      __$$WordMatchStateImplCopyWithImpl<_$WordMatchStateImpl>(
          this, _$identity);
}

abstract class _WordMatchState extends WordMatchState {
  const factory _WordMatchState(
          {required final List<WordMatch> wordMatches,
          required final bool isLoading,
          required final Option<Either<AppFailure, dynamic>> fetchFailure}) =
      _$WordMatchStateImpl;
  const _WordMatchState._() : super._();

  @override
  List<WordMatch> get wordMatches;
  @override
  bool get isLoading;
  @override
  Option<Either<AppFailure, dynamic>> get fetchFailure;

  /// Create a copy of WordMatchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordMatchStateImplCopyWith<_$WordMatchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
