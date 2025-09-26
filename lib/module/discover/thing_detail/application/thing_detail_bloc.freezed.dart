// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thing_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ThingDetailEvent {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId) getThingDetail,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId)? getThingDetail,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId)? getThingDetail,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetThingDetail value) getThingDetail,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetThingDetail value)? getThingDetail,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetThingDetail value)? getThingDetail,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ThingDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThingDetailEventCopyWith<ThingDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingDetailEventCopyWith<$Res> {
  factory $ThingDetailEventCopyWith(
    ThingDetailEvent value,
    $Res Function(ThingDetailEvent) then,
  ) = _$ThingDetailEventCopyWithImpl<$Res, ThingDetailEvent>;
  @useResult
  $Res call({String id, String userId});
}

/// @nodoc
class _$ThingDetailEventCopyWithImpl<$Res, $Val extends ThingDetailEvent>
    implements $ThingDetailEventCopyWith<$Res> {
  _$ThingDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? userId = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetThingDetailImplCopyWith<$Res>
    implements $ThingDetailEventCopyWith<$Res> {
  factory _$$GetThingDetailImplCopyWith(
    _$GetThingDetailImpl value,
    $Res Function(_$GetThingDetailImpl) then,
  ) = __$$GetThingDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId});
}

/// @nodoc
class __$$GetThingDetailImplCopyWithImpl<$Res>
    extends _$ThingDetailEventCopyWithImpl<$Res, _$GetThingDetailImpl>
    implements _$$GetThingDetailImplCopyWith<$Res> {
  __$$GetThingDetailImplCopyWithImpl(
    _$GetThingDetailImpl _value,
    $Res Function(_$GetThingDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThingDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? userId = null}) {
    return _then(
      _$GetThingDetailImpl(
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

class _$GetThingDetailImpl implements _GetThingDetail {
  const _$GetThingDetailImpl({required this.id, required this.userId});

  @override
  final String id;
  @override
  final String userId;

  @override
  String toString() {
    return 'ThingDetailEvent.getThingDetail(id: $id, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetThingDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId);

  /// Create a copy of ThingDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetThingDetailImplCopyWith<_$GetThingDetailImpl> get copyWith =>
      __$$GetThingDetailImplCopyWithImpl<_$GetThingDetailImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String userId) getThingDetail,
  }) {
    return getThingDetail(id, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String userId)? getThingDetail,
  }) {
    return getThingDetail?.call(id, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String userId)? getThingDetail,
    required TResult orElse(),
  }) {
    if (getThingDetail != null) {
      return getThingDetail(id, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetThingDetail value) getThingDetail,
  }) {
    return getThingDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetThingDetail value)? getThingDetail,
  }) {
    return getThingDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetThingDetail value)? getThingDetail,
    required TResult orElse(),
  }) {
    if (getThingDetail != null) {
      return getThingDetail(this);
    }
    return orElse();
  }
}

abstract class _GetThingDetail implements ThingDetailEvent {
  const factory _GetThingDetail({
    required final String id,
    required final String userId,
  }) = _$GetThingDetailImpl;

  @override
  String get id;
  @override
  String get userId;

  /// Create a copy of ThingDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetThingDetailImplCopyWith<_$GetThingDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThingDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  Thing get thing => throw _privateConstructorUsedError;
  List<UserExercise> get exercises => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of ThingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThingDetailStateCopyWith<ThingDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingDetailStateCopyWith<$Res> {
  factory $ThingDetailStateCopyWith(
    ThingDetailState value,
    $Res Function(ThingDetailState) then,
  ) = _$ThingDetailStateCopyWithImpl<$Res, ThingDetailState>;
  @useResult
  $Res call({
    bool isLoading,
    Thing thing,
    List<UserExercise> exercises,
    Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  });

  $ThingCopyWith<$Res> get thing;
}

/// @nodoc
class _$ThingDetailStateCopyWithImpl<$Res, $Val extends ThingDetailState>
    implements $ThingDetailStateCopyWith<$Res> {
  _$ThingDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? thing = null,
    Object? exercises = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            thing:
                null == thing
                    ? _value.thing
                    : thing // ignore: cast_nullable_to_non_nullable
                        as Thing,
            exercises:
                null == exercises
                    ? _value.exercises
                    : exercises // ignore: cast_nullable_to_non_nullable
                        as List<UserExercise>,
            failureOrSuccessOption:
                null == failureOrSuccessOption
                    ? _value.failureOrSuccessOption
                    : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
                        as Option<Either<AppFailure, dynamic>>,
          )
          as $Val,
    );
  }

  /// Create a copy of ThingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThingCopyWith<$Res> get thing {
    return $ThingCopyWith<$Res>(_value.thing, (value) {
      return _then(_value.copyWith(thing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThingDetailStateImplCopyWith<$Res>
    implements $ThingDetailStateCopyWith<$Res> {
  factory _$$ThingDetailStateImplCopyWith(
    _$ThingDetailStateImpl value,
    $Res Function(_$ThingDetailStateImpl) then,
  ) = __$$ThingDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    Thing thing,
    List<UserExercise> exercises,
    Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  });

  @override
  $ThingCopyWith<$Res> get thing;
}

/// @nodoc
class __$$ThingDetailStateImplCopyWithImpl<$Res>
    extends _$ThingDetailStateCopyWithImpl<$Res, _$ThingDetailStateImpl>
    implements _$$ThingDetailStateImplCopyWith<$Res> {
  __$$ThingDetailStateImplCopyWithImpl(
    _$ThingDetailStateImpl _value,
    $Res Function(_$ThingDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? thing = null,
    Object? exercises = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(
      _$ThingDetailStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        thing:
            null == thing
                ? _value.thing
                : thing // ignore: cast_nullable_to_non_nullable
                    as Thing,
        exercises:
            null == exercises
                ? _value._exercises
                : exercises // ignore: cast_nullable_to_non_nullable
                    as List<UserExercise>,
        failureOrSuccessOption:
            null == failureOrSuccessOption
                ? _value.failureOrSuccessOption
                : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
                    as Option<Either<AppFailure, dynamic>>,
      ),
    );
  }
}

/// @nodoc

class _$ThingDetailStateImpl implements _ThingDetailState {
  const _$ThingDetailStateImpl({
    required this.isLoading,
    required this.thing,
    required final List<UserExercise> exercises,
    required this.failureOrSuccessOption,
  }) : _exercises = exercises;

  @override
  final bool isLoading;
  @override
  final Thing thing;
  final List<UserExercise> _exercises;
  @override
  List<UserExercise> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  final Option<Either<AppFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ThingDetailState(isLoading: $isLoading, thing: $thing, exercises: $exercises, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.thing, thing) || other.thing == thing) &&
            const DeepCollectionEquality().equals(
              other._exercises,
              _exercises,
            ) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    thing,
    const DeepCollectionEquality().hash(_exercises),
    failureOrSuccessOption,
  );

  /// Create a copy of ThingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingDetailStateImplCopyWith<_$ThingDetailStateImpl> get copyWith =>
      __$$ThingDetailStateImplCopyWithImpl<_$ThingDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ThingDetailState implements ThingDetailState {
  const factory _ThingDetailState({
    required final bool isLoading,
    required final Thing thing,
    required final List<UserExercise> exercises,
    required final Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _$ThingDetailStateImpl;

  @override
  bool get isLoading;
  @override
  Thing get thing;
  @override
  List<UserExercise> get exercises;
  @override
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption;

  /// Create a copy of ThingDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingDetailStateImplCopyWith<_$ThingDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
