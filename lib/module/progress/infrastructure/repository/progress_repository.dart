import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/progress/domain/repository/i_progress_repository.dart';
import 'package:vietlite/module/progress/infrastructure/datasource/progress_remote.dart';

@Injectable(as: IProgressRepository)
class ProgressRepository extends IProgressRepository {
  final ProgressRemoteDataSource remoteDataSource;

  ProgressRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, Unit>> updateUserProgress({
    required String userId,
    required String progressId,
    required ExerciseType exerciseType,
    String? exerciseId,
    String? lastAnswer,
    bool? isCorrect,
    int? totalExercises,
  }) async {
    try {
      await remoteDataSource.updateUserProgress(
        userId: userId,
        progressId: progressId,
        exerciseType: exerciseType,
        exerciseId: exerciseId,
        lastAnswer: lastAnswer,
        isCorrect: isCorrect,
        totalExercises: totalExercises,
      );
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, List<UserExercise>>> getUserExercises({
    required String userId,
    required String progressId,
  }) async {
    try {
      final exercises = await remoteDataSource.getUserExercises(
        userId: userId,
        progressId: progressId,
      );
      return Right(exercises);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, List<UserProgress>>> getUserProgresses({
    required String userId,
  }) async {
    try {
      final List<UserProgress> userProgresses = await remoteDataSource
          .getUserProgresses(userId: userId);
      return Right(userProgresses);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
