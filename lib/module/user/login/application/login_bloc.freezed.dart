// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymousSignIn,
    required TResult Function(EmailAddress email, Password password)
    signInWithEmailAndPassword,
    required TResult Function() signInWithGoogle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? anonymousSignIn,
    TResult? Function(EmailAddress email, Password password)?
    signInWithEmailAndPassword,
    TResult? Function()? signInWithGoogle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymousSignIn,
    TResult Function(EmailAddress email, Password password)?
    signInWithEmailAndPassword,
    TResult Function()? signInWithGoogle,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnonymousSignIn value) anonymousSignIn,
    required TResult Function(_SignInWithEmailAndPassword value)
    signInWithEmailAndPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnonymousSignIn value)? anonymousSignIn,
    TResult? Function(_SignInWithEmailAndPassword value)?
    signInWithEmailAndPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnonymousSignIn value)? anonymousSignIn,
    TResult Function(_SignInWithEmailAndPassword value)?
    signInWithEmailAndPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
    LoginEvent value,
    $Res Function(LoginEvent) then,
  ) = _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AnonymousSignInImplCopyWith<$Res> {
  factory _$$AnonymousSignInImplCopyWith(
    _$AnonymousSignInImpl value,
    $Res Function(_$AnonymousSignInImpl) then,
  ) = __$$AnonymousSignInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AnonymousSignInImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$AnonymousSignInImpl>
    implements _$$AnonymousSignInImplCopyWith<$Res> {
  __$$AnonymousSignInImplCopyWithImpl(
    _$AnonymousSignInImpl _value,
    $Res Function(_$AnonymousSignInImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AnonymousSignInImpl implements _AnonymousSignIn {
  const _$AnonymousSignInImpl();

  @override
  String toString() {
    return 'LoginEvent.anonymousSignIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AnonymousSignInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymousSignIn,
    required TResult Function(EmailAddress email, Password password)
    signInWithEmailAndPassword,
    required TResult Function() signInWithGoogle,
  }) {
    return anonymousSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? anonymousSignIn,
    TResult? Function(EmailAddress email, Password password)?
    signInWithEmailAndPassword,
    TResult? Function()? signInWithGoogle,
  }) {
    return anonymousSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymousSignIn,
    TResult Function(EmailAddress email, Password password)?
    signInWithEmailAndPassword,
    TResult Function()? signInWithGoogle,
    required TResult orElse(),
  }) {
    if (anonymousSignIn != null) {
      return anonymousSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnonymousSignIn value) anonymousSignIn,
    required TResult Function(_SignInWithEmailAndPassword value)
    signInWithEmailAndPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
  }) {
    return anonymousSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnonymousSignIn value)? anonymousSignIn,
    TResult? Function(_SignInWithEmailAndPassword value)?
    signInWithEmailAndPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
  }) {
    return anonymousSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnonymousSignIn value)? anonymousSignIn,
    TResult Function(_SignInWithEmailAndPassword value)?
    signInWithEmailAndPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    required TResult orElse(),
  }) {
    if (anonymousSignIn != null) {
      return anonymousSignIn(this);
    }
    return orElse();
  }
}

abstract class _AnonymousSignIn implements LoginEvent {
  const factory _AnonymousSignIn() = _$AnonymousSignInImpl;
}

/// @nodoc
abstract class _$$SignInWithEmailAndPasswordImplCopyWith<$Res> {
  factory _$$SignInWithEmailAndPasswordImplCopyWith(
    _$SignInWithEmailAndPasswordImpl value,
    $Res Function(_$SignInWithEmailAndPasswordImpl) then,
  ) = __$$SignInWithEmailAndPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EmailAddress email, Password password});
}

/// @nodoc
class __$$SignInWithEmailAndPasswordImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$SignInWithEmailAndPasswordImpl>
    implements _$$SignInWithEmailAndPasswordImplCopyWith<$Res> {
  __$$SignInWithEmailAndPasswordImplCopyWithImpl(
    _$SignInWithEmailAndPasswordImpl _value,
    $Res Function(_$SignInWithEmailAndPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignInWithEmailAndPasswordImpl(
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as EmailAddress,
        password:
            null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                    as Password,
      ),
    );
  }
}

/// @nodoc

class _$SignInWithEmailAndPasswordImpl implements _SignInWithEmailAndPassword {
  const _$SignInWithEmailAndPasswordImpl({
    required this.email,
    required this.password,
  });

  @override
  final EmailAddress email;
  @override
  final Password password;

  @override
  String toString() {
    return 'LoginEvent.signInWithEmailAndPassword(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithEmailAndPasswordImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInWithEmailAndPasswordImplCopyWith<_$SignInWithEmailAndPasswordImpl>
  get copyWith => __$$SignInWithEmailAndPasswordImplCopyWithImpl<
    _$SignInWithEmailAndPasswordImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymousSignIn,
    required TResult Function(EmailAddress email, Password password)
    signInWithEmailAndPassword,
    required TResult Function() signInWithGoogle,
  }) {
    return signInWithEmailAndPassword(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? anonymousSignIn,
    TResult? Function(EmailAddress email, Password password)?
    signInWithEmailAndPassword,
    TResult? Function()? signInWithGoogle,
  }) {
    return signInWithEmailAndPassword?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymousSignIn,
    TResult Function(EmailAddress email, Password password)?
    signInWithEmailAndPassword,
    TResult Function()? signInWithGoogle,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnonymousSignIn value) anonymousSignIn,
    required TResult Function(_SignInWithEmailAndPassword value)
    signInWithEmailAndPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
  }) {
    return signInWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnonymousSignIn value)? anonymousSignIn,
    TResult? Function(_SignInWithEmailAndPassword value)?
    signInWithEmailAndPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
  }) {
    return signInWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnonymousSignIn value)? anonymousSignIn,
    TResult Function(_SignInWithEmailAndPassword value)?
    signInWithEmailAndPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    required TResult orElse(),
  }) {
    if (signInWithEmailAndPassword != null) {
      return signInWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailAndPassword implements LoginEvent {
  const factory _SignInWithEmailAndPassword({
    required final EmailAddress email,
    required final Password password,
  }) = _$SignInWithEmailAndPasswordImpl;

  EmailAddress get email;
  Password get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInWithEmailAndPasswordImplCopyWith<_$SignInWithEmailAndPasswordImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInWithGoogleImplCopyWith<$Res> {
  factory _$$SignInWithGoogleImplCopyWith(
    _$SignInWithGoogleImpl value,
    $Res Function(_$SignInWithGoogleImpl) then,
  ) = __$$SignInWithGoogleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithGoogleImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$SignInWithGoogleImpl>
    implements _$$SignInWithGoogleImplCopyWith<$Res> {
  __$$SignInWithGoogleImplCopyWithImpl(
    _$SignInWithGoogleImpl _value,
    $Res Function(_$SignInWithGoogleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInWithGoogleImpl implements _SignInWithGoogle {
  const _$SignInWithGoogleImpl();

  @override
  String toString() {
    return 'LoginEvent.signInWithGoogle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInWithGoogleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() anonymousSignIn,
    required TResult Function(EmailAddress email, Password password)
    signInWithEmailAndPassword,
    required TResult Function() signInWithGoogle,
  }) {
    return signInWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? anonymousSignIn,
    TResult? Function(EmailAddress email, Password password)?
    signInWithEmailAndPassword,
    TResult? Function()? signInWithGoogle,
  }) {
    return signInWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? anonymousSignIn,
    TResult Function(EmailAddress email, Password password)?
    signInWithEmailAndPassword,
    TResult Function()? signInWithGoogle,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnonymousSignIn value) anonymousSignIn,
    required TResult Function(_SignInWithEmailAndPassword value)
    signInWithEmailAndPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnonymousSignIn value)? anonymousSignIn,
    TResult? Function(_SignInWithEmailAndPassword value)?
    signInWithEmailAndPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnonymousSignIn value)? anonymousSignIn,
    TResult Function(_SignInWithEmailAndPassword value)?
    signInWithEmailAndPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogle implements LoginEvent {
  const factory _SignInWithGoogle() = _$SignInWithGoogleImpl;
}

/// @nodoc
mixin _$LoginState {
  bool get isAnonymousSignIn => throw _privateConstructorUsedError;
  bool get isSignInWithEmailAndPassword => throw _privateConstructorUsedError;
  bool get isSignInWithGoogle => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
    LoginState value,
    $Res Function(LoginState) then,
  ) = _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call({
    bool isAnonymousSignIn,
    bool isSignInWithEmailAndPassword,
    bool isSignInWithGoogle,
    Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  });
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnonymousSignIn = null,
    Object? isSignInWithEmailAndPassword = null,
    Object? isSignInWithGoogle = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(
      _value.copyWith(
            isAnonymousSignIn:
                null == isAnonymousSignIn
                    ? _value.isAnonymousSignIn
                    : isAnonymousSignIn // ignore: cast_nullable_to_non_nullable
                        as bool,
            isSignInWithEmailAndPassword:
                null == isSignInWithEmailAndPassword
                    ? _value.isSignInWithEmailAndPassword
                    : isSignInWithEmailAndPassword // ignore: cast_nullable_to_non_nullable
                        as bool,
            isSignInWithGoogle:
                null == isSignInWithGoogle
                    ? _value.isSignInWithGoogle
                    : isSignInWithGoogle // ignore: cast_nullable_to_non_nullable
                        as bool,
            failureOrSuccessOption:
                null == failureOrSuccessOption
                    ? _value.failureOrSuccessOption
                    : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
                        as Option<Either<AppFailure, dynamic>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
    _$LoginStateImpl value,
    $Res Function(_$LoginStateImpl) then,
  ) = __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isAnonymousSignIn,
    bool isSignInWithEmailAndPassword,
    bool isSignInWithGoogle,
    Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  });
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
    _$LoginStateImpl _value,
    $Res Function(_$LoginStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnonymousSignIn = null,
    Object? isSignInWithEmailAndPassword = null,
    Object? isSignInWithGoogle = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(
      _$LoginStateImpl(
        isAnonymousSignIn:
            null == isAnonymousSignIn
                ? _value.isAnonymousSignIn
                : isAnonymousSignIn // ignore: cast_nullable_to_non_nullable
                    as bool,
        isSignInWithEmailAndPassword:
            null == isSignInWithEmailAndPassword
                ? _value.isSignInWithEmailAndPassword
                : isSignInWithEmailAndPassword // ignore: cast_nullable_to_non_nullable
                    as bool,
        isSignInWithGoogle:
            null == isSignInWithGoogle
                ? _value.isSignInWithGoogle
                : isSignInWithGoogle // ignore: cast_nullable_to_non_nullable
                    as bool,
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

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl({
    required this.isAnonymousSignIn,
    required this.isSignInWithEmailAndPassword,
    required this.isSignInWithGoogle,
    required this.failureOrSuccessOption,
  });

  @override
  final bool isAnonymousSignIn;
  @override
  final bool isSignInWithEmailAndPassword;
  @override
  final bool isSignInWithGoogle;
  @override
  final Option<Either<AppFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'LoginState(isAnonymousSignIn: $isAnonymousSignIn, isSignInWithEmailAndPassword: $isSignInWithEmailAndPassword, isSignInWithGoogle: $isSignInWithGoogle, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.isAnonymousSignIn, isAnonymousSignIn) ||
                other.isAnonymousSignIn == isAnonymousSignIn) &&
            (identical(
                  other.isSignInWithEmailAndPassword,
                  isSignInWithEmailAndPassword,
                ) ||
                other.isSignInWithEmailAndPassword ==
                    isSignInWithEmailAndPassword) &&
            (identical(other.isSignInWithGoogle, isSignInWithGoogle) ||
                other.isSignInWithGoogle == isSignInWithGoogle) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isAnonymousSignIn,
    isSignInWithEmailAndPassword,
    isSignInWithGoogle,
    failureOrSuccessOption,
  );

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState({
    required final bool isAnonymousSignIn,
    required final bool isSignInWithEmailAndPassword,
    required final bool isSignInWithGoogle,
    required final Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _$LoginStateImpl;

  @override
  bool get isAnonymousSignIn;
  @override
  bool get isSignInWithEmailAndPassword;
  @override
  bool get isSignInWithGoogle;
  @override
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
