part of 'word_match_bloc.dart';

@freezed
class WordMatchState with _$WordMatchState {
  const WordMatchState._();

  const factory WordMatchState({
    required List<WordMatch> wordMatches,
    required bool isLoading,
    required Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _WordMatchState;

  factory WordMatchState.initial() =>
      WordMatchState(wordMatches: [], isLoading: false, fetchFailure: none());
}
