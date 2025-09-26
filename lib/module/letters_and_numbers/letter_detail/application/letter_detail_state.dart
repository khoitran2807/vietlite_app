part of 'letter_detail_bloc.dart';

@freezed
class LetterDetailState with _$LetterDetailState {
  const factory LetterDetailState({
    required bool isLoading,
    required Letter letter,
    required Option<Either<AppFailure, Letter>> failureOrSuccessOption,
    required Option<Either<AppFailure, Unit>> fetchLetterDetailProgress,
  }) = _LetterDetailState;

  factory LetterDetailState.initial() => LetterDetailState(
    letter: Letter.empty(),
    isLoading: false,
    failureOrSuccessOption: none(),
    fetchLetterDetailProgress: none(),
  );
}
