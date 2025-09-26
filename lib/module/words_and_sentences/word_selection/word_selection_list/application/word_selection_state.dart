part of 'word_selection_bloc.dart';

@freezed
class WordSelectionState with _$WordSelectionState {
  const WordSelectionState._();

  const factory WordSelectionState({
    required List<WordSelection> wordSelections,
    required bool isLoading,
    required Option<Either<AppFailure, dynamic>> fetchFailure,
  }) = _WordSelectionState;

  factory WordSelectionState.initial() => WordSelectionState(
    wordSelections: [],
    isLoading: false,
    fetchFailure: none(),
  );
}
