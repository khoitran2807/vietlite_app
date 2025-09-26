part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.registerWithEmailAndPassword({
    required String name,
    required EmailAddress email,
    required Password password,
  }) = _RegisterWithEmailAndPassword;
}
