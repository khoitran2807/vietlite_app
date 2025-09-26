part of 'word_match_exercise_bloc.dart';

@freezed
class WordMatchExerciseState with _$WordMatchExerciseState {
  const WordMatchExerciseState._();

  const factory WordMatchExerciseState({
    required String? selectedAnswer,
    required bool isAnswered,
    required bool isLoading,
    required WordMatchExercise exercise,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _WordMatchExerciseState;

  bool get isCorrect => selectedAnswer == exercise.answer;

  factory WordMatchExerciseState.initial() => WordMatchExerciseState(
    selectedAnswer: null,
    isAnswered: false,
    exercise: WordMatchExercise.empty(),
    isLoading: false,
    failureOrSuccessOption: none(),
  );
}
