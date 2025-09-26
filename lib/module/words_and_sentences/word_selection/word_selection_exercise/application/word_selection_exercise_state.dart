part of 'word_selection_exercise_bloc.dart';

@freezed
class WordSelectionExerciseState with _$WordSelectionExerciseState {
  const WordSelectionExerciseState._();

  const factory WordSelectionExerciseState({
    required String? selectedAnswer,
    required bool isAnswered,
    required bool isLoading,
    required WordSelectionExercise exercise,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _WordSelectionExerciseState;

  bool get isCorrect => selectedAnswer == exercise.answer;

  factory WordSelectionExerciseState.initial() => WordSelectionExerciseState(
    selectedAnswer: null,
    isAnswered: false,
    exercise: WordSelectionExercise.empty(),
    isLoading: false,
    failureOrSuccessOption: none(),
  );
}
