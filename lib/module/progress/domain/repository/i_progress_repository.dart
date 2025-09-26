import 'package:dartz/dartz.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/common/error/app_failure.dart';

abstract class IProgressRepository {
  Future<Either<AppFailure, Unit>> updateUserProgress({
    required String userId,
    required String progressId,
    required ExerciseType exerciseType,
    String? exerciseId,
    String? lastAnswer,
    bool? isCorrect,
    int? totalExercises,
  });

  Future<Either<AppFailure, List<UserExercise>>> getUserExercises({
    required String userId,
    required String progressId,
  });

  Future<Either<AppFailure, List<UserProgress>>> getUserProgresses({
    required String userId,
  });
}
