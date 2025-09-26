part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.anonymousSignIn() = _AnonymousSignIn;

  const factory LoginEvent.signInWithEmailAndPassword({
    required EmailAddress email,
    required Password password,
  }) = _SignInWithEmailAndPassword;

  const factory LoginEvent.signInWithGoogle() = _SignInWithGoogle;
}
