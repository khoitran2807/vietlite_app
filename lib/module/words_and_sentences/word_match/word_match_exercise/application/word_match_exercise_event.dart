part of 'word_match_exercise_bloc.dart';

@freezed
class WordMatchExerciseEvent with _$WordMatchExerciseEvent {
  const factory WordMatchExerciseEvent.initialize({
    required WordMatchExercise exercise,
    required String? lastAnswer,
  }) = _Initialize;
  const factory WordMatchExerciseEvent.selectAnswer({
    required String selectedAnswer,
  }) = _SelectAnswer;

  const factory WordMatchExerciseEvent.updateAnswerProgress({
    required String userId,
    required String progressId,
    required int totalExercises,
  }) = _UpdateAnswerProgress;

  const factory WordMatchExerciseEvent.checkAnswer() = _CheckAnswer;
}
