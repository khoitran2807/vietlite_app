part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required bool isRegister,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _RegisterState;
  factory RegisterState.initial() =>
      RegisterState(isRegister: false, failureOrSuccessOption: none());
}
