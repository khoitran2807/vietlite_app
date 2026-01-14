// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_selection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WordSelectionEvent {
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

  /// Create a copy of WordSelectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSelectionEventCopyWith<WordSelectionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSelectionEventCopyWith<$Res> {
  factory $WordSelectionEventCopyWith(
          WordSelectionEvent value, $Res Function(WordSelectionEvent) then) =
      _$WordSelectionEventCopyWithImpl<$Res, WordSelectionEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$WordSelectionEventCopyWithImpl<$Res, $Val extends WordSelectionEvent>
    implements $WordSelectionEventCopyWith<$Res> {
  _$WordSelectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSelectionEvent
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
    implements $WordSelectionEventCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$WordSelectionEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordSelectionEvent
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
    return 'WordSelectionEvent.initialize(userId: $userId)';
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

  /// Create a copy of WordSelectionEvent
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

abstract class _Initialize implements WordSelectionEvent {
  const factory _Initialize({required final String userId}) = _$InitializeImpl;

  @override
  String get userId;

  /// Create a copy of WordSelectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WordSelectionState {
  List<WordSelection> get wordSelections => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get fetchFailure =>
      throw _privateConstructorUsedError;

  /// Create a copy of WordSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordSelectionStateCopyWith<WordSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordSelectionStateCopyWith<$Res> {
  factory $WordSelectionStateCopyWith(
          WordSelectionState value, $Res Function(WordSelectionState) then) =
      _$WordSelectionStateCopyWithImpl<$Res, WordSelectionState>;
  @useResult
  $Res call(
      {List<WordSelection> wordSelections,
      bool isLoading,
      Option<Either<AppFailure, dynamic>> fetchFailure});
}

/// @nodoc
class _$WordSelectionStateCopyWithImpl<$Res, $Val extends WordSelectionState>
    implements $WordSelectionStateCopyWith<$Res> {
  _$WordSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordSelections = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(_value.copyWith(
      wordSelections: null == wordSelections
          ? _value.wordSelections
          : wordSelections // ignore: cast_nullable_to_non_nullable
              as List<WordSelection>,
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
abstract class _$$WordSelectionStateImplCopyWith<$Res>
    implements $WordSelectionStateCopyWith<$Res> {
  factory _$$WordSelectionStateImplCopyWith(_$WordSelectionStateImpl value,
          $Res Function(_$WordSelectionStateImpl) then) =
      __$$WordSelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<WordSelection> wordSelections,
      bool isLoading,
      Option<Either<AppFailure, dynamic>> fetchFailure});
}

/// @nodoc
class __$$WordSelectionStateImplCopyWithImpl<$Res>
    extends _$WordSelectionStateCopyWithImpl<$Res, _$WordSelectionStateImpl>
    implements _$$WordSelectionStateImplCopyWith<$Res> {
  __$$WordSelectionStateImplCopyWithImpl(_$WordSelectionStateImpl _value,
      $Res Function(_$WordSelectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordSelections = null,
    Object? isLoading = null,
    Object? fetchFailure = null,
  }) {
    return _then(_$WordSelectionStateImpl(
      wordSelections: null == wordSelections
          ? _value._wordSelections
          : wordSelections // ignore: cast_nullable_to_non_nullable
              as List<WordSelection>,
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

class _$WordSelectionStateImpl extends _WordSelectionState {
  const _$WordSelectionStateImpl(
      {required final List<WordSelection> wordSelections,
      required this.isLoading,
      required this.fetchFailure})
      : _wordSelections = wordSelections,
        super._();

  final List<WordSelection> _wordSelections;
  @override
  List<WordSelection> get wordSelections {
    if (_wordSelections is EqualUnmodifiableListView) return _wordSelections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordSelections);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<AppFailure, dynamic>> fetchFailure;

  @override
  String toString() {
    return 'WordSelectionState(wordSelections: $wordSelections, isLoading: $isLoading, fetchFailure: $fetchFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordSelectionStateImpl &&
            const DeepCollectionEquality()
                .equals(other._wordSelections, _wordSelections) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.fetchFailure, fetchFailure) ||
                other.fetchFailure == fetchFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_wordSelections),
      isLoading,
      fetchFailure);

  /// Create a copy of WordSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordSelectionStateImplCopyWith<_$WordSelectionStateImpl> get copyWith =>
      __$$WordSelectionStateImplCopyWithImpl<_$WordSelectionStateImpl>(
          this, _$identity);
}

abstract class _WordSelectionState extends WordSelectionState {
  const factory _WordSelectionState(
          {required final List<WordSelection> wordSelections,
          required final bool isLoading,
          required final Option<Either<AppFailure, dynamic>> fetchFailure}) =
      _$WordSelectionStateImpl;
  const _WordSelectionState._() : super._();

  @override
  List<WordSelection> get wordSelections;
  @override
  bool get isLoading;
  @override
  Option<Either<AppFailure, dynamic>> get fetchFailure;

  /// Create a copy of WordSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordSelectionStateImplCopyWith<_$WordSelectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
