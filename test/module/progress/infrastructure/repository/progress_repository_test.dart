import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/infrastructure/repository/progress_repository.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../utils/common_mocks.dart';

void main() {
  late ProgressRepository repository;
  late MockProgressRemoteDataSource mockProgressRemoteDataSource;
  setUp(() {
    mockProgressRemoteDataSource = MockProgressRemoteDataSource();
    repository = ProgressRepository(
      remoteDataSource: mockProgressRemoteDataSource,
    );
  });

  group('updateUserProgress', () {
    const userId = 'user123';
    const progressId = 'progress123';
    const exerciseType = ExerciseType.wordSelection;
    const exerciseId = 'exercise123';
    const lastAnswer = 'answer';
    const isCorrect = true;
    const totalExercises = 1;

    test('should return Unit when updateUserProgress is successful', () async {
      when(
        () => mockProgressRemoteDataSource.updateUserProgress(
          userId: userId,
          progressId: progressId,
          exerciseType: exerciseType,
          exerciseId: exerciseId,
          lastAnswer: lastAnswer,
          isCorrect: isCorrect,
          totalExercises: totalExercises,
        ),
      ).thenAnswer((_) async => unit);

      final result = await repository.updateUserProgress(
        userId: userId,
        progressId: progressId,
        exerciseType: exerciseType,
        exerciseId: exerciseId,
        lastAnswer: lastAnswer,
        isCorrect: isCorrect,
        totalExercises: totalExercises,
      );

      expect(result, const Right(unit));
      verify(
        () => mockProgressRemoteDataSource.updateUserProgress(
          userId: userId,
          progressId: progressId,
          exerciseType: exerciseType,
          exerciseId: exerciseId,
          lastAnswer: lastAnswer,
          isCorrect: isCorrect,
          totalExercises: totalExercises,
        ),
      ).called(1);
      verifyNoMoreInteractions(mockProgressRemoteDataSource);
    });

    test(
      'should return AppFailure when updateUserProgress throws an exception',
      () async {
        when(
          () => mockProgressRemoteDataSource.updateUserProgress(
            userId: userId,
            progressId: progressId,
            exerciseType: exerciseType,
            exerciseId: exerciseId,
            lastAnswer: lastAnswer,
            isCorrect: isCorrect,
            totalExercises: totalExercises,
          ),
        ).thenThrow(Exception('Server error'));

        final result = await repository.updateUserProgress(
          userId: userId,
          progressId: progressId,
          exerciseType: exerciseType,
          exerciseId: exerciseId,
          lastAnswer: lastAnswer,
          isCorrect: isCorrect,
          totalExercises: totalExercises,
        );

        expect(result, isA<Left<AppFailure, Unit>>());
        verify(
          () => mockProgressRemoteDataSource.updateUserProgress(
            userId: userId,
            progressId: progressId,
            exerciseType: exerciseType,
            exerciseId: exerciseId,
            lastAnswer: lastAnswer,
            isCorrect: isCorrect,
            totalExercises: totalExercises,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockProgressRemoteDataSource);
      },
    );
  });

  group('getWordSelectionProgress', () {
    const userId = 'user123';
    const progressId = 'progress456';
    final userExercise = [UserExercise.empty()];

    test('should return Right(UserExercise) when data is found', () async {
      // Arrange
      when(
        () => mockProgressRemoteDataSource.getUserExercises(
          userId: userId,
          progressId: progressId,
        ),
      ).thenAnswer((_) async => userExercise);

      // Act
      final result = await repository.getUserExercises(
        userId: userId,
        progressId: progressId,
      );

      // Assert
      expect(result, Right(userExercise));
      verify(
        () => mockProgressRemoteDataSource.getUserExercises(
          userId: userId,
          progressId: progressId,
        ),
      ).called(1);
    });

    test('should return Left(AppFailure) when fetch fails', () async {
      // Arrange
      when(
        () => mockProgressRemoteDataSource.getUserExercises(
          userId: userId,
          progressId: progressId,
        ),
      ).thenThrow(Exception('Fetch failed'));

      // Act
      final result = await repository.getUserExercises(
        userId: userId,
        progressId: progressId,
      );

      // Assert
      expect(result, isA<Left<AppFailure, List<UserExercise>>>());
    });
  });

  group('getUserProgresses', () {
    const userId = 'user123';

    final userProgressList = [
      UserProgress(
        id: 'p1',
        exerciseType: ExerciseType.wordSelection,
        writeAt: DateTime(2024, 7, 1),
        exercises: const [
          UserExercise(id: 'ex1', lastAnswer: 'ans', isCorrect: true),
        ],
      ),
    ];

    test(
      'should return Right(List<UserProgress>) when fetch succeeds',
      () async {
        // Arrange
        when(
          () => mockProgressRemoteDataSource.getUserProgresses(userId: userId),
        ).thenAnswer((_) async => userProgressList);

        // Act
        final result = await repository.getUserProgresses(userId: userId);

        // Assert
        expect(result, Right(userProgressList));
        verify(
          () => mockProgressRemoteDataSource.getUserProgresses(userId: userId),
        ).called(1);
        verifyNoMoreInteractions(mockProgressRemoteDataSource);
      },
    );

    test('should return Left(AppFailure) when fetch fails', () async {
      // Arrange
      when(
        () => mockProgressRemoteDataSource.getUserProgresses(userId: userId),
      ).thenThrow(Exception('Server error'));

      // Act
      final result = await repository.getUserProgresses(userId: userId);

      // Assert
      expect(result, isA<Left<AppFailure, List<UserProgress>>>());
      verify(
        () => mockProgressRemoteDataSource.getUserProgresses(userId: userId),
      ).called(1);
      verifyNoMoreInteractions(mockProgressRemoteDataSource);
    });
  });
}
