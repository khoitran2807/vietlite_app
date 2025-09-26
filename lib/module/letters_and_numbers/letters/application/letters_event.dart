part of 'letters_bloc.dart';

@freezed
class LettersEvent with _$LettersEvent {
  const factory LettersEvent.initialize({required String userId}) = _Initialize;
}
