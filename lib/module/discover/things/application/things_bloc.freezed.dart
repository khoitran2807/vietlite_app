// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'things_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ThingsEvent {
  ThingType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThingType type) getThings,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThingType type)? getThings,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThingType type)? getThings,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetThings value) getThings,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetThings value)? getThings,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetThings value)? getThings,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ThingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThingsEventCopyWith<ThingsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingsEventCopyWith<$Res> {
  factory $ThingsEventCopyWith(
    ThingsEvent value,
    $Res Function(ThingsEvent) then,
  ) = _$ThingsEventCopyWithImpl<$Res, ThingsEvent>;
  @useResult
  $Res call({ThingType type});
}

/// @nodoc
class _$ThingsEventCopyWithImpl<$Res, $Val extends ThingsEvent>
    implements $ThingsEventCopyWith<$Res> {
  _$ThingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _value.copyWith(
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as ThingType,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetThingsImplCopyWith<$Res>
    implements $ThingsEventCopyWith<$Res> {
  factory _$$GetThingsImplCopyWith(
    _$GetThingsImpl value,
    $Res Function(_$GetThingsImpl) then,
  ) = __$$GetThingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThingType type});
}

/// @nodoc
class __$$GetThingsImplCopyWithImpl<$Res>
    extends _$ThingsEventCopyWithImpl<$Res, _$GetThingsImpl>
    implements _$$GetThingsImplCopyWith<$Res> {
  __$$GetThingsImplCopyWithImpl(
    _$GetThingsImpl _value,
    $Res Function(_$GetThingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null}) {
    return _then(
      _$GetThingsImpl(
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as ThingType,
      ),
    );
  }
}

/// @nodoc

class _$GetThingsImpl implements _GetThings {
  const _$GetThingsImpl({required this.type});

  @override
  final ThingType type;

  @override
  String toString() {
    return 'ThingsEvent.getThings(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetThingsImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  /// Create a copy of ThingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetThingsImplCopyWith<_$GetThingsImpl> get copyWith =>
      __$$GetThingsImplCopyWithImpl<_$GetThingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThingType type) getThings,
  }) {
    return getThings(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThingType type)? getThings,
  }) {
    return getThings?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThingType type)? getThings,
    required TResult orElse(),
  }) {
    if (getThings != null) {
      return getThings(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetThings value) getThings,
  }) {
    return getThings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetThings value)? getThings,
  }) {
    return getThings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetThings value)? getThings,
    required TResult orElse(),
  }) {
    if (getThings != null) {
      return getThings(this);
    }
    return orElse();
  }
}

abstract class _GetThings implements ThingsEvent {
  const factory _GetThings({required final ThingType type}) = _$GetThingsImpl;

  @override
  ThingType get type;

  /// Create a copy of ThingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetThingsImplCopyWith<_$GetThingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThingsState {
  List<Thing> get things => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<AppFailure, List<Thing>>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of ThingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThingsStateCopyWith<ThingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingsStateCopyWith<$Res> {
  factory $ThingsStateCopyWith(
    ThingsState value,
    $Res Function(ThingsState) then,
  ) = _$ThingsStateCopyWithImpl<$Res, ThingsState>;
  @useResult
  $Res call({
    List<Thing> things,
    bool isLoading,
    Option<Either<AppFailure, List<Thing>>> failureOrSuccessOption,
  });
}

/// @nodoc
class _$ThingsStateCopyWithImpl<$Res, $Val extends ThingsState>
    implements $ThingsStateCopyWith<$Res> {
  _$ThingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? things = null,
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
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
            failureOrSuccessOption:
                null == failureOrSuccessOption
                    ? _value.failureOrSuccessOption
                    : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
                        as Option<Either<AppFailure, List<Thing>>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThingsStateImplCopyWith<$Res>
    implements $ThingsStateCopyWith<$Res> {
  factory _$$ThingsStateImplCopyWith(
    _$ThingsStateImpl value,
    $Res Function(_$ThingsStateImpl) then,
  ) = __$$ThingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Thing> things,
    bool isLoading,
    Option<Either<AppFailure, List<Thing>>> failureOrSuccessOption,
  });
}

/// @nodoc
class __$$ThingsStateImplCopyWithImpl<$Res>
    extends _$ThingsStateCopyWithImpl<$Res, _$ThingsStateImpl>
    implements _$$ThingsStateImplCopyWith<$Res> {
  __$$ThingsStateImplCopyWithImpl(
    _$ThingsStateImpl _value,
    $Res Function(_$ThingsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? things = null,
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(
      _$ThingsStateImpl(
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
        failureOrSuccessOption:
            null == failureOrSuccessOption
                ? _value.failureOrSuccessOption
                : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
                    as Option<Either<AppFailure, List<Thing>>>,
      ),
    );
  }
}

/// @nodoc

class _$ThingsStateImpl implements _ThingsState {
  const _$ThingsStateImpl({
    required final List<Thing> things,
    required this.isLoading,
    required this.failureOrSuccessOption,
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
  final Option<Either<AppFailure, List<Thing>>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ThingsState(things: $things, isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThingsStateImpl &&
            const DeepCollectionEquality().equals(other._things, _things) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_things),
    isLoading,
    failureOrSuccessOption,
  );

  /// Create a copy of ThingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingsStateImplCopyWith<_$ThingsStateImpl> get copyWith =>
      __$$ThingsStateImplCopyWithImpl<_$ThingsStateImpl>(this, _$identity);
}

abstract class _ThingsState implements ThingsState {
  const factory _ThingsState({
    required final List<Thing> things,
    required final bool isLoading,
    required final Option<Either<AppFailure, List<Thing>>>
    failureOrSuccessOption,
  }) = _$ThingsStateImpl;

  @override
  List<Thing> get things;
  @override
  bool get isLoading;
  @override
  Option<Either<AppFailure, List<Thing>>> get failureOrSuccessOption;

  /// Create a copy of ThingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThingsStateImplCopyWith<_$ThingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
