// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppUser user) updateUser,
    required TResult Function() getPremiumConfig,
    required TResult Function() signOut,
    required TResult Function(String currentPassword, String newPassword)
        changePassword,
    required TResult Function() deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppUser user)? updateUser,
    TResult? Function()? getPremiumConfig,
    TResult? Function()? signOut,
    TResult? Function(String currentPassword, String newPassword)?
        changePassword,
    TResult? Function()? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppUser user)? updateUser,
    TResult Function()? getPremiumConfig,
    TResult Function()? signOut,
    TResult Function(String currentPassword, String newPassword)?
        changePassword,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_GetPremiumConfig value) getPremiumConfig,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_DeleteUser value) deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'AuthEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppUser user) updateUser,
    required TResult Function() getPremiumConfig,
    required TResult Function() signOut,
    required TResult Function(String currentPassword, String newPassword)
        changePassword,
    required TResult Function() deleteUser,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppUser user)? updateUser,
    TResult? Function()? getPremiumConfig,
    TResult? Function()? signOut,
    TResult? Function(String currentPassword, String newPassword)?
        changePassword,
    TResult? Function()? deleteUser,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppUser user)? updateUser,
    TResult Function()? getPremiumConfig,
    TResult Function()? signOut,
    TResult Function(String currentPassword, String newPassword)?
        changePassword,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_GetPremiumConfig value) getPremiumConfig,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AuthEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$UpdateUserImplCopyWith<$Res> {
  factory _$$UpdateUserImplCopyWith(
          _$UpdateUserImpl value, $Res Function(_$UpdateUserImpl) then) =
      __$$UpdateUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppUser user});

  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$UpdateUserImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdateUserImpl>
    implements _$$UpdateUserImplCopyWith<$Res> {
  __$$UpdateUserImplCopyWithImpl(
      _$UpdateUserImpl _value, $Res Function(_$UpdateUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UpdateUserImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ));
  }

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UpdateUserImpl implements _UpdateUser {
  const _$UpdateUserImpl(this.user);

  @override
  final AppUser user;

  @override
  String toString() {
    return 'AuthEvent.updateUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      __$$UpdateUserImplCopyWithImpl<_$UpdateUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppUser user) updateUser,
    required TResult Function() getPremiumConfig,
    required TResult Function() signOut,
    required TResult Function(String currentPassword, String newPassword)
        changePassword,
    required TResult Function() deleteUser,
  }) {
    return updateUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppUser user)? updateUser,
    TResult? Function()? getPremiumConfig,
    TResult? Function()? signOut,
    TResult? Function(String currentPassword, String newPassword)?
        changePassword,
    TResult? Function()? deleteUser,
  }) {
    return updateUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppUser user)? updateUser,
    TResult Function()? getPremiumConfig,
    TResult Function()? signOut,
    TResult Function(String currentPassword, String newPassword)?
        changePassword,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_GetPremiumConfig value) getPremiumConfig,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class _UpdateUser implements AuthEvent {
  const factory _UpdateUser(final AppUser user) = _$UpdateUserImpl;

  AppUser get user;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPremiumConfigImplCopyWith<$Res> {
  factory _$$GetPremiumConfigImplCopyWith(_$GetPremiumConfigImpl value,
          $Res Function(_$GetPremiumConfigImpl) then) =
      __$$GetPremiumConfigImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPremiumConfigImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GetPremiumConfigImpl>
    implements _$$GetPremiumConfigImplCopyWith<$Res> {
  __$$GetPremiumConfigImplCopyWithImpl(_$GetPremiumConfigImpl _value,
      $Res Function(_$GetPremiumConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetPremiumConfigImpl implements _GetPremiumConfig {
  const _$GetPremiumConfigImpl();

  @override
  String toString() {
    return 'AuthEvent.getPremiumConfig()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPremiumConfigImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppUser user) updateUser,
    required TResult Function() getPremiumConfig,
    required TResult Function() signOut,
    required TResult Function(String currentPassword, String newPassword)
        changePassword,
    required TResult Function() deleteUser,
  }) {
    return getPremiumConfig();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppUser user)? updateUser,
    TResult? Function()? getPremiumConfig,
    TResult? Function()? signOut,
    TResult? Function(String currentPassword, String newPassword)?
        changePassword,
    TResult? Function()? deleteUser,
  }) {
    return getPremiumConfig?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppUser user)? updateUser,
    TResult Function()? getPremiumConfig,
    TResult Function()? signOut,
    TResult Function(String currentPassword, String newPassword)?
        changePassword,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (getPremiumConfig != null) {
      return getPremiumConfig();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_GetPremiumConfig value) getPremiumConfig,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return getPremiumConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return getPremiumConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (getPremiumConfig != null) {
      return getPremiumConfig(this);
    }
    return orElse();
  }
}

abstract class _GetPremiumConfig implements AuthEvent {
  const factory _GetPremiumConfig() = _$GetPremiumConfigImpl;
}

/// @nodoc
abstract class _$$SignOutImplCopyWith<$Res> {
  factory _$$SignOutImplCopyWith(
          _$SignOutImpl value, $Res Function(_$SignOutImpl) then) =
      __$$SignOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutImpl>
    implements _$$SignOutImplCopyWith<$Res> {
  __$$SignOutImplCopyWithImpl(
      _$SignOutImpl _value, $Res Function(_$SignOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutImpl implements _SignOut {
  const _$SignOutImpl();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppUser user) updateUser,
    required TResult Function() getPremiumConfig,
    required TResult Function() signOut,
    required TResult Function(String currentPassword, String newPassword)
        changePassword,
    required TResult Function() deleteUser,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppUser user)? updateUser,
    TResult? Function()? getPremiumConfig,
    TResult? Function()? signOut,
    TResult? Function(String currentPassword, String newPassword)?
        changePassword,
    TResult? Function()? deleteUser,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppUser user)? updateUser,
    TResult Function()? getPremiumConfig,
    TResult Function()? signOut,
    TResult Function(String currentPassword, String newPassword)?
        changePassword,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_GetPremiumConfig value) getPremiumConfig,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOut implements AuthEvent {
  const factory _SignOut() = _$SignOutImpl;
}

/// @nodoc
abstract class _$$ChangePasswordImplCopyWith<$Res> {
  factory _$$ChangePasswordImplCopyWith(_$ChangePasswordImpl value,
          $Res Function(_$ChangePasswordImpl) then) =
      __$$ChangePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class __$$ChangePasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ChangePasswordImpl>
    implements _$$ChangePasswordImplCopyWith<$Res> {
  __$$ChangePasswordImplCopyWithImpl(
      _$ChangePasswordImpl _value, $Res Function(_$ChangePasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$ChangePasswordImpl(
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangePasswordImpl implements _ChangePassword {
  const _$ChangePasswordImpl(
      {required this.currentPassword, required this.newPassword});

  @override
  final String currentPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'AuthEvent.changePassword(currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPassword, newPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordImplCopyWith<_$ChangePasswordImpl> get copyWith =>
      __$$ChangePasswordImplCopyWithImpl<_$ChangePasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppUser user) updateUser,
    required TResult Function() getPremiumConfig,
    required TResult Function() signOut,
    required TResult Function(String currentPassword, String newPassword)
        changePassword,
    required TResult Function() deleteUser,
  }) {
    return changePassword(currentPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppUser user)? updateUser,
    TResult? Function()? getPremiumConfig,
    TResult? Function()? signOut,
    TResult? Function(String currentPassword, String newPassword)?
        changePassword,
    TResult? Function()? deleteUser,
  }) {
    return changePassword?.call(currentPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppUser user)? updateUser,
    TResult Function()? getPremiumConfig,
    TResult Function()? signOut,
    TResult Function(String currentPassword, String newPassword)?
        changePassword,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(currentPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_GetPremiumConfig value) getPremiumConfig,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements AuthEvent {
  const factory _ChangePassword(
      {required final String currentPassword,
      required final String newPassword}) = _$ChangePasswordImpl;

  String get currentPassword;
  String get newPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordImplCopyWith<_$ChangePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteUserImplCopyWith<$Res> {
  factory _$$DeleteUserImplCopyWith(
          _$DeleteUserImpl value, $Res Function(_$DeleteUserImpl) then) =
      __$$DeleteUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$DeleteUserImpl>
    implements _$$DeleteUserImplCopyWith<$Res> {
  __$$DeleteUserImplCopyWithImpl(
      _$DeleteUserImpl _value, $Res Function(_$DeleteUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteUserImpl implements _DeleteUser {
  const _$DeleteUserImpl();

  @override
  String toString() {
    return 'AuthEvent.deleteUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(AppUser user) updateUser,
    required TResult Function() getPremiumConfig,
    required TResult Function() signOut,
    required TResult Function(String currentPassword, String newPassword)
        changePassword,
    required TResult Function() deleteUser,
  }) {
    return deleteUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(AppUser user)? updateUser,
    TResult? Function()? getPremiumConfig,
    TResult? Function()? signOut,
    TResult? Function(String currentPassword, String newPassword)?
        changePassword,
    TResult? Function()? deleteUser,
  }) {
    return deleteUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(AppUser user)? updateUser,
    TResult Function()? getPremiumConfig,
    TResult Function()? signOut,
    TResult Function(String currentPassword, String newPassword)?
        changePassword,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateUser value) updateUser,
    required TResult Function(_GetPremiumConfig value) getPremiumConfig,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateUser value)? updateUser,
    TResult? Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateUser value)? updateUser,
    TResult Function(_GetPremiumConfig value)? getPremiumConfig,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class _DeleteUser implements AuthEvent {
  const factory _DeleteUser() = _$DeleteUserImpl;
}

/// @nodoc
mixin _$AuthState {
  AppUser get appUser => throw _privateConstructorUsedError;
  PremiumConfig get premiumConfig => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {AppUser appUser,
      PremiumConfig premiumConfig,
      bool isLoading,
      Option<Either<AppFailure, dynamic>> failureOrSuccessOption});

  $AppUserCopyWith<$Res> get appUser;
  $PremiumConfigCopyWith<$Res> get premiumConfig;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appUser = null,
    Object? premiumConfig = null,
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      appUser: null == appUser
          ? _value.appUser
          : appUser // ignore: cast_nullable_to_non_nullable
              as AppUser,
      premiumConfig: null == premiumConfig
          ? _value.premiumConfig
          : premiumConfig // ignore: cast_nullable_to_non_nullable
              as PremiumConfig,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get appUser {
    return $AppUserCopyWith<$Res>(_value.appUser, (value) {
      return _then(_value.copyWith(appUser: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PremiumConfigCopyWith<$Res> get premiumConfig {
    return $PremiumConfigCopyWith<$Res>(_value.premiumConfig, (value) {
      return _then(_value.copyWith(premiumConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppUser appUser,
      PremiumConfig premiumConfig,
      bool isLoading,
      Option<Either<AppFailure, dynamic>> failureOrSuccessOption});

  @override
  $AppUserCopyWith<$Res> get appUser;
  @override
  $PremiumConfigCopyWith<$Res> get premiumConfig;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appUser = null,
    Object? premiumConfig = null,
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$AuthStateImpl(
      appUser: null == appUser
          ? _value.appUser
          : appUser // ignore: cast_nullable_to_non_nullable
              as AppUser,
      premiumConfig: null == premiumConfig
          ? _value.premiumConfig
          : premiumConfig // ignore: cast_nullable_to_non_nullable
              as PremiumConfig,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState {
  const _$AuthStateImpl(
      {required this.appUser,
      required this.premiumConfig,
      required this.isLoading,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final AppUser appUser;
  @override
  final PremiumConfig premiumConfig;
  @override
  final bool isLoading;
  @override
  final Option<Either<AppFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'AuthState(appUser: $appUser, premiumConfig: $premiumConfig, isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.appUser, appUser) || other.appUser == appUser) &&
            (identical(other.premiumConfig, premiumConfig) ||
                other.premiumConfig == premiumConfig) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, appUser, premiumConfig, isLoading, failureOrSuccessOption);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {required final AppUser appUser,
      required final PremiumConfig premiumConfig,
      required final bool isLoading,
      required final Option<Either<AppFailure, dynamic>>
          failureOrSuccessOption}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  AppUser get appUser;
  @override
  PremiumConfig get premiumConfig;
  @override
  bool get isLoading;
  @override
  Option<Either<AppFailure, dynamic>> get failureOrSuccessOption;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
