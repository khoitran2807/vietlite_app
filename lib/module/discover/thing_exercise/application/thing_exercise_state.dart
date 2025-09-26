part of 'thing_exercise_bloc.dart';

@freezed
class ThingExerciseState with _$ThingExerciseState {
  const ThingExerciseState._();

  const factory ThingExerciseState({
    required String? selectedAnswer,
    required bool isAnswered,
    required bool isLoading,
    required ThingExercise exercise,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _ThingExerciseState;

  bool get isCorrect => selectedAnswer == exercise.answer;

  factory ThingExerciseState.initial() => ThingExerciseState(
    selectedAnswer: null,
    isAnswered: false,
    exercise: ThingExercise.empty(),
    isLoading: false,
    failureOrSuccessOption: none(),
  );
}
