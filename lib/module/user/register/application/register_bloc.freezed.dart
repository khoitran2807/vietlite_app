// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegisterEvent {
  String get name => throw _privateConstructorUsedError;
  EmailAddress get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String name,
      EmailAddress email,
      Password password,
    )
    registerWithEmailAndPassword,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, EmailAddress email, Password password)?
    registerWithEmailAndPassword,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, EmailAddress email, Password password)?
    registerWithEmailAndPassword,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterWithEmailAndPassword value)
    registerWithEmailAndPassword,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterWithEmailAndPassword value)?
    registerWithEmailAndPassword,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterWithEmailAndPassword value)?
    registerWithEmailAndPassword,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterEventCopyWith<RegisterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
    RegisterEvent value,
    $Res Function(RegisterEvent) then,
  ) = _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
  @useResult
  $Res call({String name, EmailAddress email, Password password});
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterWithEmailAndPasswordImplCopyWith<$Res>
    implements $RegisterEventCopyWith<$Res> {
  factory _$$RegisterWithEmailAndPasswordImplCopyWith(
    _$RegisterWithEmailAndPasswordImpl value,
    $Res Function(_$RegisterWithEmailAndPasswordImpl) then,
  ) = __$$RegisterWithEmailAndPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, EmailAddress email, Password password});
}

/// @nodoc
class __$$RegisterWithEmailAndPasswordImplCopyWithImpl<$Res>
    extends
        _$RegisterEventCopyWithImpl<$Res, _$RegisterWithEmailAndPasswordImpl>
    implements _$$RegisterWithEmailAndPasswordImplCopyWith<$Res> {
  __$$RegisterWithEmailAndPasswordImplCopyWithImpl(
    _$RegisterWithEmailAndPasswordImpl _value,
    $Res Function(_$RegisterWithEmailAndPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(
      _$RegisterWithEmailAndPasswordImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
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

class _$RegisterWithEmailAndPasswordImpl
    implements _RegisterWithEmailAndPassword {
  const _$RegisterWithEmailAndPasswordImpl({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  final String name;
  @override
  final EmailAddress email;
  @override
  final Password password;

  @override
  String toString() {
    return 'RegisterEvent.registerWithEmailAndPassword(name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithEmailAndPasswordImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, password);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterWithEmailAndPasswordImplCopyWith<
    _$RegisterWithEmailAndPasswordImpl
  >
  get copyWith => __$$RegisterWithEmailAndPasswordImplCopyWithImpl<
    _$RegisterWithEmailAndPasswordImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String name,
      EmailAddress email,
      Password password,
    )
    registerWithEmailAndPassword,
  }) {
    return registerWithEmailAndPassword(name, email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, EmailAddress email, Password password)?
    registerWithEmailAndPassword,
  }) {
    return registerWithEmailAndPassword?.call(name, email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, EmailAddress email, Password password)?
    registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPassword != null) {
      return registerWithEmailAndPassword(name, email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterWithEmailAndPassword value)
    registerWithEmailAndPassword,
  }) {
    return registerWithEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterWithEmailAndPassword value)?
    registerWithEmailAndPassword,
  }) {
    return registerWithEmailAndPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterWithEmailAndPassword value)?
    registerWithEmailAndPassword,
    required TResult orElse(),
  }) {
    if (registerWithEmailAndPassword != null) {
      return registerWithEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class _RegisterWithEmailAndPassword implements RegisterEvent {
  const factory _RegisterWithEmailAndPassword({
    required final String name,
    required final EmailAddress email,
    required final Password password,
  }) = _$RegisterWithEmailAndPasswordImpl;

  @override
  String get name;
  @override
  EmailAddress get email;
  @override
  Password get password;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterWithEmailAndPasswordImplCopyWith<
    _$RegisterWithEmailAndPasswordImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  bool get isRegister => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
    RegisterState value,
    $Res Function(RegisterState) then,
  ) = _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call({
    bool isRegister,
    Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  });
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRegister = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(
      _value.copyWith(
            isRegister:
                null == isRegister
                    ? _value.isRegister
                    : isRegister // ignore: cast_nullable_to_non_nullable
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
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
    _$RegisterStateImpl value,
    $Res Function(_$RegisterStateImpl) then,
  ) = __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isRegister,
    Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  });
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
    _$RegisterStateImpl _value,
    $Res Function(_$RegisterStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRegister = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(
      _$RegisterStateImpl(
        isRegister:
            null == isRegister
                ? _value.isRegister
                : isRegister // ignore: cast_nullable_to_non_nullable
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

class _$RegisterStateImpl implements _RegisterState {
  const _$RegisterStateImpl({
    required this.isRegister,
    required this.failureOrSuccessOption,
  });

  @override
  final bool isRegister;
  @override
  final Option<Either<AppFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'RegisterState(isRegister: $isRegister, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.isRegister, isRegister) ||
                other.isRegister == isRegister) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isRegister, failureOrSuccessOption);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState({
    required final bool isRegister,
    required final Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _$RegisterStateImpl;

  @override
  bool get isRegister;
  @override
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
