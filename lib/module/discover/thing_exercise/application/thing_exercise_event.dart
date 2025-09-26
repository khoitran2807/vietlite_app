part of 'thing_exercise_bloc.dart';

@freezed
class ThingExerciseEvent with _$ThingExerciseEvent {
  const factory ThingExerciseEvent.initialize({
    required ThingExercise exercise,
    required String? lastAnswer,
  }) = _Initialize;
  const factory ThingExerciseEvent.selectAnswer({
    required String selectedAnswer,
  }) = _SelectAnswer;

  const factory ThingExerciseEvent.updateAnswerProgress({
    required String userId,
    required String progressId,
    required int totalExercises,
  }) = _ThingAnswerProgress;

  const factory ThingExerciseEvent.checkAnswer() = _CheckAnswer;
}
