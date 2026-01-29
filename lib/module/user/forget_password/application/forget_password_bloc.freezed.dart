// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgetPasswordEvent {
  EmailAddress get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmailAddress email) forgetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailAddress email)? forgetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailAddress email)? forgetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgetPassword value) forgetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgetPassword value)? forgetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgetPassword value)? forgetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ForgetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgetPasswordEventCopyWith<ForgetPasswordEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordEventCopyWith<$Res> {
  factory $ForgetPasswordEventCopyWith(
          ForgetPasswordEvent value, $Res Function(ForgetPasswordEvent) then) =
      _$ForgetPasswordEventCopyWithImpl<$Res, ForgetPasswordEvent>;
  @useResult
  $Res call({EmailAddress email});
}

/// @nodoc
class _$ForgetPasswordEventCopyWithImpl<$Res, $Val extends ForgetPasswordEvent>
    implements $ForgetPasswordEventCopyWith<$Res> {
  _$ForgetPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgetPasswordImplCopyWith<$Res>
    implements $ForgetPasswordEventCopyWith<$Res> {
  factory _$$ForgetPasswordImplCopyWith(_$ForgetPasswordImpl value,
          $Res Function(_$ForgetPasswordImpl) then) =
      __$$ForgetPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EmailAddress email});
}

/// @nodoc
class __$$ForgetPasswordImplCopyWithImpl<$Res>
    extends _$ForgetPasswordEventCopyWithImpl<$Res, _$ForgetPasswordImpl>
    implements _$$ForgetPasswordImplCopyWith<$Res> {
  __$$ForgetPasswordImplCopyWithImpl(
      _$ForgetPasswordImpl _value, $Res Function(_$ForgetPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgetPasswordImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
    ));
  }
}

/// @nodoc

class _$ForgetPasswordImpl implements _ForgetPassword {
  const _$ForgetPasswordImpl({required this.email});

  @override
  final EmailAddress email;

  @override
  String toString() {
    return 'ForgetPasswordEvent.forgetPassword(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetPasswordImplCopyWith<_$ForgetPasswordImpl> get copyWith =>
      __$$ForgetPasswordImplCopyWithImpl<_$ForgetPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmailAddress email) forgetPassword,
  }) {
    return forgetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailAddress email)? forgetPassword,
  }) {
    return forgetPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailAddress email)? forgetPassword,
    required TResult orElse(),
  }) {
    if (forgetPassword != null) {
      return forgetPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ForgetPassword value) forgetPassword,
  }) {
    return forgetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ForgetPassword value)? forgetPassword,
  }) {
    return forgetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ForgetPassword value)? forgetPassword,
    required TResult orElse(),
  }) {
    if (forgetPassword != null) {
      return forgetPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgetPassword implements ForgetPasswordEvent {
  const factory _ForgetPassword({required final EmailAddress email}) =
      _$ForgetPasswordImpl;

  @override
  EmailAddress get email;

  /// Create a copy of ForgetPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgetPasswordImplCopyWith<_$ForgetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgetPasswordState {
  bool get isForgetPassword => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of ForgetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgetPasswordStateCopyWith<ForgetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordStateCopyWith<$Res> {
  factory $ForgetPasswordStateCopyWith(
          ForgetPasswordState value, $Res Function(ForgetPasswordState) then) =
      _$ForgetPasswordStateCopyWithImpl<$Res, ForgetPasswordState>;
  @useResult
  $Res call(
      {bool isForgetPassword,
      Option<Either<AppFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$ForgetPasswordStateCopyWithImpl<$Res, $Val extends ForgetPasswordState>
    implements $ForgetPasswordStateCopyWith<$Res> {
  _$ForgetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isForgetPassword = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isForgetPassword: null == isForgetPassword
          ? _value.isForgetPassword
          : isForgetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgetPasswordStateImplCopyWith<$Res>
    implements $ForgetPasswordStateCopyWith<$Res> {
  factory _$$ForgetPasswordStateImplCopyWith(_$ForgetPasswordStateImpl value,
          $Res Function(_$ForgetPasswordStateImpl) then) =
      __$$ForgetPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isForgetPassword,
      Option<Either<AppFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$ForgetPasswordStateImplCopyWithImpl<$Res>
    extends _$ForgetPasswordStateCopyWithImpl<$Res, _$ForgetPasswordStateImpl>
    implements _$$ForgetPasswordStateImplCopyWith<$Res> {
  __$$ForgetPasswordStateImplCopyWithImpl(_$ForgetPasswordStateImpl _value,
      $Res Function(_$ForgetPasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isForgetPassword = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$ForgetPasswordStateImpl(
      isForgetPassword: null == isForgetPassword
          ? _value.isForgetPassword
          : isForgetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ForgetPasswordStateImpl implements _ForgetPasswordState {
  const _$ForgetPasswordStateImpl(
      {required this.isForgetPassword, required this.failureOrSuccessOption});

  @override
  final bool isForgetPassword;
  @override
  final Option<Either<AppFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ForgetPasswordState(isForgetPassword: $isForgetPassword, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPasswordStateImpl &&
            (identical(other.isForgetPassword, isForgetPassword) ||
                other.isForgetPassword == isForgetPassword) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isForgetPassword, failureOrSuccessOption);

  /// Create a copy of ForgetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetPasswordStateImplCopyWith<_$ForgetPasswordStateImpl> get copyWith =>
      __$$ForgetPasswordStateImplCopyWithImpl<_$ForgetPasswordStateImpl>(
          this, _$identity);
}

abstract class _ForgetPasswordState implements ForgetPasswordState {
  const factory _ForgetPasswordState(
      {required final bool isForgetPassword,
      required final Option<Either<AppFailure, dynamic>>
          failureOrSuccessOption}) = _$ForgetPasswordStateImpl;

  @override
  bool get isForgetPassword;
  @override
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption;

  /// Create a copy of ForgetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgetPasswordStateImplCopyWith<_$ForgetPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
