part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isAnonymousSignIn,
    required bool isSignInWithEmailAndPassword,
    required bool isSignInWithGoogle,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
    isAnonymousSignIn: false,
    isSignInWithEmailAndPassword: false,
    isSignInWithGoogle: false,
    failureOrSuccessOption: none(),
  );
}
