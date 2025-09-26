// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DiscoverEvent {
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

  /// Create a copy of DiscoverEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscoverEventCopyWith<DiscoverEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverEventCopyWith<$Res> {
  factory $DiscoverEventCopyWith(
    DiscoverEvent value,
    $Res Function(DiscoverEvent) then,
  ) = _$DiscoverEventCopyWithImpl<$Res, DiscoverEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$DiscoverEventCopyWithImpl<$Res, $Val extends DiscoverEvent>
    implements $DiscoverEventCopyWith<$Res> {
  _$DiscoverEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscoverEvent
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
    implements $DiscoverEventCopyWith<$Res> {
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
    extends _$DiscoverEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
    _$InitializeImpl _value,
    $Res Function(_$InitializeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiscoverEvent
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
    return 'DiscoverEvent.initialize(userId: $userId)';
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

  /// Create a copy of DiscoverEvent
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

abstract class _Initialize implements DiscoverEvent {
  const factory _Initialize({required final String userId}) = _$InitializeImpl;

  @override
  String get userId;

  /// Create a copy of DiscoverEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiscoverState {
  List<Thing> get things => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get fetchFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscoverStateCopyWith<DiscoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverStateCopyWith<$Res> {
  factory $DiscoverStateCopyWith(
    DiscoverState value,
    $Res Function(DiscoverState) then,
  ) = _$DiscoverStateCopyWithImpl<$Res, DiscoverState>;
  @useResult
  $Res call({
    List<Thing> things,
    bool isLoading,
    Option<Either<AppFailure, dynamic>> fetchFailure,
  });
}

/// @nodoc
class _$DiscoverStateCopyWithImpl<$Res, $Val extends DiscoverState>
    implements $DiscoverStateCopyWith<$Res> {
  _$DiscoverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? things = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(
      _value.copyWith(
            things:
                null == things
                    ? _value.things
                    : things // ignore: cast_nullable_to_non_nullable
                        as List<Thing>,
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
abstract class _$$DiscoverStateImplCopyWith<$Res>
    implements $DiscoverStateCopyWith<$Res> {
  factory _$$DiscoverStateImplCopyWith(
    _$DiscoverStateImpl value,
    $Res Function(_$DiscoverStateImpl) then,
  ) = __$$DiscoverStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Thing> things,
    bool isLoading,
    Option<Either<AppFailure, dynamic>> fetchFailure,
  });
}

/// @nodoc
class __$$DiscoverStateImplCopyWithImpl<$Res>
    extends _$DiscoverStateCopyWithImpl<$Res, _$DiscoverStateImpl>
    implements _$$DiscoverStateImplCopyWith<$Res> {
  __$$DiscoverStateImplCopyWithImpl(
    _$DiscoverStateImpl _value,
    $Res Function(_$DiscoverStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? things = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(
      _$DiscoverStateImpl(
        things:
            null == things
                ? _value._things
                : things // ignore: cast_nullable_to_non_nullable
                    as List<Thing>,
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

class _$DiscoverStateImpl implements _DiscoverState {
  const _$DiscoverStateImpl({
    required final List<Thing> things,
    required this.isLoading,
    required this.fetchFailure,
  }) : _things = things;

  final List<Thing> _things;
  @override
  List<Thing> get things {
    if (_things is EqualUnmodifiableListView) return _things;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_things);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<AppFailure, dynamic>> fetchFailure;

  @override
  String toString() {
    return 'DiscoverState(things: $things, isLoading: $isLoading, fetchFailure: $fetchFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverStateImpl &&
            const DeepCollectionEquality().equals(other._things, _things) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.fetchFailure, fetchFailure) ||
                other.fetchFailure == fetchFailure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_things),
    isLoading,
    fetchFailure,
  );

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverStateImplCopyWith<_$DiscoverStateImpl> get copyWith =>
      __$$DiscoverStateImplCopyWithImpl<_$DiscoverStateImpl>(this, _$identity);
}

abstract class _DiscoverState implements DiscoverState {
  const factory _DiscoverState({
    required final List<Thing> things,
    required final bool isLoading,
    required final Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _$DiscoverStateImpl;

  @override
  List<Thing> get things;
  @override
  bool get isLoading;
  @override
  Option<Either<AppFailure, dynamic>> get fetchFailure;

  /// Create a copy of DiscoverState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscoverStateImplCopyWith<_$DiscoverStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
