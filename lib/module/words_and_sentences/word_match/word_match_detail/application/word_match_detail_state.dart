part of 'word_match_detail_bloc.dart';

@freezed
class WordMatchDetailState with _$WordMatchDetailState {
  const factory WordMatchDetailState({
    required bool isLoading,
    required WordMatch wordMatch,
    required List<UserExercise> exercises,
    required Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _WordMatchState;

  factory WordMatchDetailState.initial() => WordMatchDetailState(
    isLoading: false,
    wordMatch: WordMatch.empty(),
    exercises: [],
    fetchFailure: none(),
  );
}
