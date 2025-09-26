part of 'word_selection_detail_bloc.dart';

@freezed
class WordSelectionDetailState with _$WordSelectionDetailState {
  const factory WordSelectionDetailState({
    required bool isLoading,
    required WordSelection wordSelection,
    required List<UserExercise> exercises,
    required Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _WordSelectionDetailState;

  factory WordSelectionDetailState.initial() => WordSelectionDetailState(
    exercises: [],
    wordSelection: WordSelection.empty(),
    isLoading: false,
    fetchFailure: none(),
  );
}
