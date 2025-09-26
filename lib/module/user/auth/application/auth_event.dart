part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initialize() = _Initialize;

  const factory AuthEvent.updateUser(AppUser user) = _UpdateUser;

  const factory AuthEvent.getPremiumConfig() = _GetPremiumConfig;

  const factory AuthEvent.signOut() = _SignOut;

  const factory AuthEvent.changePassword({
    required String currentPassword,
    required String newPassword,
  }) = _ChangePassword;
}
