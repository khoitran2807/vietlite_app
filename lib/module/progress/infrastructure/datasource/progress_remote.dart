import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/infrastructure/dto/user_progress_dto.dart';
import 'package:vietlite/plugin/firebase/firestore_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProgressRemoteDataSource {
  final FirestoreService firestoreService;

  const ProgressRemoteDataSource({required this.firestoreService});

  Future<void> updateUserProgress({
    required String userId,
    required String progressId,
    required ExerciseType exerciseType,
    String? exerciseId,
    String? lastAnswer,
    bool? isCorrect,
    int? totalExercises,
  }) async {
    await firestoreService.updateUserProgress(
      userId: userId,
      progressId: progressId,
      exerciseType: exerciseType.name,
      exerciseId: exerciseId,
      lastAnswer: lastAnswer,
      isCorrect: isCorrect,
      totalExercises: totalExercises,
    );
  }

  Future<List<UserExercise>> getUserExercises({
    required String userId,
    required String progressId,
  }) async {
    final List<Map<String, dynamic>> userExercisesMap = await firestoreService
        .getDocumentsInCollection(
          collection: 'users/$userId/progress/$progressId/exercises',
        );
    return userExercisesMap.map((exercise) {
      final userExercise = UserExerciseDto.fromJson(exercise).toDomain;
      return userExercise;
    }).toList();
  }

  Future<List<UserProgress>> getUserProgresses({required String userId}) async {
    final List<Map<String, dynamic>> progressMap = await firestoreService
        .getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          orderBy: 'writeAt',
          descending: true,
        );
    final userProgresses =
        progressMap.map((userProgress) {
          return UserProgressDto.fromJson(userProgress).toDomain;
        }).toList();
    return userProgresses;
  }
}
