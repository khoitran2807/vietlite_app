part of 'forget_password_bloc.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState({
    required bool isForgetPassword,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _ForgetPasswordState;

  factory ForgetPasswordState.initial() => ForgetPasswordState(
    isForgetPassword: false,
    failureOrSuccessOption: none(),
  );
}
