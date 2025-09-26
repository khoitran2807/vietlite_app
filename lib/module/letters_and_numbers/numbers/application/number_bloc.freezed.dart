// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NumberEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) initialize,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? initialize,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? initialize,
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

  /// Create a copy of NumberEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberEventCopyWith<NumberEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberEventCopyWith<$Res> {
  factory $NumberEventCopyWith(
    NumberEvent value,
    $Res Function(NumberEvent) then,
  ) = _$NumberEventCopyWithImpl<$Res, NumberEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$NumberEventCopyWithImpl<$Res, $Val extends NumberEvent>
    implements $NumberEventCopyWith<$Res> {
  _$NumberEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberEvent
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
abstract class _$$InitializeImplCopyWith<$Res>
    implements $NumberEventCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
    _$InitializeImpl value,
    $Res Function(_$InitializeImpl) then,
  ) = __$$InitializeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$NumberEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
    _$InitializeImpl _value,
    $Res Function(_$InitializeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumberEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$InitializeImpl(
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

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'NumberEvent.initialize(userId: $userId)';
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

  /// Create a copy of NumberEvent
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

abstract class _Initialize implements NumberEvent {
  const factory _Initialize({required final String userId}) = _$InitializeImpl;

  @override
  String get userId;

  /// Create a copy of NumberEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NumberState {
  List<Number> get numbers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get fetchFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of NumberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumberStateCopyWith<NumberState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberStateCopyWith<$Res> {
  factory $NumberStateCopyWith(
    NumberState value,
    $Res Function(NumberState) then,
  ) = _$NumberStateCopyWithImpl<$Res, NumberState>;
  @useResult
  $Res call({
    List<Number> numbers,
    bool isLoading,
    Option<Either<AppFailure, dynamic>> fetchFailure,
  });
}

/// @nodoc
class _$NumberStateCopyWithImpl<$Res, $Val extends NumberState>
    implements $NumberStateCopyWith<$Res> {
  _$NumberStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(
      _value.copyWith(
            numbers:
                null == numbers
                    ? _value.numbers
                    : numbers // ignore: cast_nullable_to_non_nullable
                        as List<Number>,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            fetchFailure:
                null == fetchFailure
                    ? _value.fetchFailure
                    : fetchFailure // ignore: cast_nullable_to_non_nullable
                        as Option<Either<AppFailure, dynamic>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NumberStateImplCopyWith<$Res>
    implements $NumberStateCopyWith<$Res> {
  factory _$$NumberStateImplCopyWith(
    _$NumberStateImpl value,
    $Res Function(_$NumberStateImpl) then,
  ) = __$$NumberStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Number> numbers,
    bool isLoading,
    Option<Either<AppFailure, dynamic>> fetchFailure,
  });
}

/// @nodoc
class __$$NumberStateImplCopyWithImpl<$Res>
    extends _$NumberStateCopyWithImpl<$Res, _$NumberStateImpl>
    implements _$$NumberStateImplCopyWith<$Res> {
  __$$NumberStateImplCopyWithImpl(
    _$NumberStateImpl _value,
    $Res Function(_$NumberStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NumberState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(
      _$NumberStateImpl(
        numbers:
            null == numbers
                ? _value._numbers
                : numbers // ignore: cast_nullable_to_non_nullable
                    as List<Number>,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
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

class _$NumberStateImpl implements _NumberState {
  const _$NumberStateImpl({
    required final List<Number> numbers,
    required this.isLoading,
    required this.fetchFailure,
  }) : _numbers = numbers;

  final List<Number> _numbers;
  @override
  List<Number> get numbers {
    if (_numbers is EqualUnmodifiableListView) return _numbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<AppFailure, dynamic>> fetchFailure;

  @override
  String toString() {
    return 'NumberState(numbers: $numbers, isLoading: $isLoading, fetchFailure: $fetchFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumberStateImpl &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.fetchFailure, fetchFailure) ||
                other.fetchFailure == fetchFailure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_numbers),
    isLoading,
    fetchFailure,
  );

  /// Create a copy of NumberState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumberStateImplCopyWith<_$NumberStateImpl> get copyWith =>
      __$$NumberStateImplCopyWithImpl<_$NumberStateImpl>(this, _$identity);
}

abstract class _NumberState implements NumberState {
  const factory _NumberState({
    required final List<Number> numbers,
    required final bool isLoading,
    required final Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _$NumberStateImpl;

  @override
  List<Number> get numbers;
  @override
  bool get isLoading;
  @override
  Option<Either<AppFailure, dynamic>> get fetchFailure;

  /// Create a copy of NumberState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumberStateImplCopyWith<_$NumberStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
