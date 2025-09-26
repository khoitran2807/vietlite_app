import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';

part 'user_progress.freezed.dart';

@freezed
class UserProgress with _$UserProgress {
  const UserProgress._();

  const factory UserProgress({
    required String id,
    required ExerciseType exerciseType,
    required DateTime? writeAt,
    required List<UserExercise> exercises,
  }) = _UserProgress;

  factory UserProgress.empty() => const UserProgress(
    id: '',
    exerciseType: ExerciseType.other,
    exercises: [],
    writeAt: null,
  );

  int get completedExercises =>
      exercises.where((exercise) => exercise.isCorrect).length;
}

@freezed
class UserExercise with _$UserExercise {
  const UserExercise._();

  const factory UserExercise({
    required String id,
    required String lastAnswer,
    required bool isCorrect,
  }) = _UserExercise;

  factory UserExercise.empty() =>
      const UserExercise(id: '', lastAnswer: '', isCorrect: false);
}
