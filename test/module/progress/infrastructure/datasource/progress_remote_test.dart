import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/infrastructure/datasource/progress_remote.dart';
import 'package:vietlite/module/progress/infrastructure/dto/user_progress_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late MockFirestoreService mockFirestoreService;
  late ProgressRemoteDataSource dataSource;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = ProgressRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  group('ProgressRemoteDataSource Tests', () {
    const userId = 'testUser';
    const progressId = 'progress123';
    const exerciseType = ExerciseType.wordSelection;
    const exerciseId = 'exercise456';
    const lastAnswer = 'answer';
    const isCorrect = true;
    const totalExercises = 1;
    test(
      'should call FirestoreService.updateUserProgress with correct parameters',
      () async {
        // Arrange

        when(
          () => mockFirestoreService.updateUserProgress(
            userId: userId,
            progressId: progressId,
            exerciseType: exerciseType.name,
            exerciseId: exerciseId,
            lastAnswer: lastAnswer,
            isCorrect: isCorrect,
            totalExercises: totalExercises,
          ),
        ).thenAnswer((_) async {});

        // Act: Call the method
        await dataSource.updateUserProgress(
          userId: userId,
          progressId: progressId,
          exerciseType: exerciseType,
          exerciseId: exerciseId,
          lastAnswer: lastAnswer,
          isCorrect: isCorrect,
          totalExercises: totalExercises,
        );

        // Assert
        verify(
          () => mockFirestoreService.updateUserProgress(
            userId: userId,
            progressId: progressId,
            exerciseType: exerciseType.name,
            exerciseId: exerciseId,
            lastAnswer: lastAnswer,
            isCorrect: isCorrect,
            totalExercises: totalExercises,
          ),
        ).called(1);
      },
    );
  });

  group('getWordSelectionProgress', () {
    test('should return UserExercise when data is found', () async {
      // Arrange
      const userId = 'user123';
      const progressId = 'progress456';
      const exerciseId = 'exercise789';
      final mockData = [
        {'id': exerciseId, 'lastAnswer': 'test', 'isCorrect': true},
      ];
      final expectedExercises =
          mockData
              .map((json) => UserExerciseDto.fromJson(json).toDomain)
              .toList();

      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress/$progressId/exercises',
        ),
      ).thenAnswer((_) async => mockData);

      // Act
      final result = await dataSource.getUserExercises(
        userId: userId,
        progressId: progressId,
      );

      // Assert
      expect(result, expectedExercises);
      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress/$progressId/exercises',
        ),
      ).called(1);
    });

    test('should return empty UserExercise when no data is found', () async {
      // Arrange
      const userId = 'user123';
      const progressId = 'progress456';

      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress/$progressId/exercises',
        ),
      ).thenAnswer((_) async => []);

      // Act
      final result = await dataSource.getUserExercises(
        userId: userId,
        progressId: progressId,
      );

      // Assert
      expect(result, []);
      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress/$progressId/exercises',
        ),
      ).called(1);
    });
  });

  group('getUserProgresses', () {
    const userId = 'user123';

    test('should return list of UserProgress when data is found', () async {
      // Arrange
      final mockData = [
        {
          'id': 'p1',
          'exerciseType': 'wordSelection',
          'writeAt': '2024-07-01T00:00:00.000',
          'exercises': [
            {'id': 'ex1', 'lastAnswer': 'ans', 'isCorrect': true},
          ],
        },
        {
          'id': 'p2',
          'exerciseType': 'things',
          'writeAt': '2024-07-02T00:00:00.000',
          'exercises': [],
        },
      ];

      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          orderBy: 'writeAt',
          descending: true,
        ),
      ).thenAnswer((_) async => mockData);

      // Act
      final result = await dataSource.getUserProgresses(userId: userId);

      // Assert
      expect(result.length, 2);
      expect(result.first.id, 'p1');
      expect(result.first.exerciseType, ExerciseType.wordSelection);
      expect(result.first.exercises.length, 1);
      expect(result.last.id, 'p2');
      expect(result.last.exerciseType, ExerciseType.things);

      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          orderBy: 'writeAt',
          descending: true,
        ),
      ).called(1);
    });

    test('should return empty list when no data found', () async {
      // Arrange
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          orderBy: 'writeAt',
          descending: true,
        ),
      ).thenAnswer((_) async => []);

      // Act
      final result = await dataSource.getUserProgresses(userId: userId);

      // Assert
      expect(result, isEmpty);
      verify(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'users/$userId/progress',
          subCollection: 'exercises',
          orderBy: 'writeAt',
          descending: true,
        ),
      ).called(1);
    });
  });
}
