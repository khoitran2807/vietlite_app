part of 'letters_bloc.dart';

@freezed
class LettersState with _$LettersState {
  const factory LettersState({
    required List<Letter> letters,
    required bool isLoading,
    required Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _LetterState;

  factory LettersState.initial() =>
      LettersState(letters: [], isLoading: false, fetchFailure: none());
}
