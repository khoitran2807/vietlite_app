part of 'word_selection_exercise_bloc.dart';

@freezed
class WordSelectionExerciseEvent with _$WordSelectionExerciseEvent {
  const factory WordSelectionExerciseEvent.initialize({
    required WordSelectionExercise exercise,
    required String? lastAnswer,
  }) = _Initialize;
  const factory WordSelectionExerciseEvent.selectAnswer({
    required String selectedAnswer,
  }) = _SelectAnswer;

  const factory WordSelectionExerciseEvent.updateAnswerProgress({
    required String userId,
    required String progressId,
    required int totalExercises,
  }) = _UpdateAnswerProgress;

  const factory WordSelectionExerciseEvent.checkAnswer() = _CheckAnswer;
}
