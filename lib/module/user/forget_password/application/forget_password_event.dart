part of 'forget_password_bloc.dart';

@freezed
class ForgetPasswordEvent with _$ForgetPasswordEvent {
  const factory ForgetPasswordEvent.forgetPassword({
    required EmailAddress email,
  }) = _ForgetPassword;
}
