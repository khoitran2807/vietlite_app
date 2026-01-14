import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/repository/word_match_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/common_mocks.dart';

void main() {
  late WordMatchRepository repository;
  late MockWordMatchRemoteDataSource mockWordMatchRemoteDataSource;
  setUp(() {
    mockWordMatchRemoteDataSource = MockWordMatchRemoteDataSource();
    repository = WordMatchRepository(
      remoteDataSource: mockWordMatchRemoteDataSource,
    );
  });

  group('WordMatch repository tests', () {
    test(
      'should return list of WordMatch when remoteDataSource succeeds',
      () async {
        final mockWordMatches = [
          const WordMatch(
            id: '1',
            title: 'A',
            exercises: [
              WordMatchExercise(
                id: 'ex1',
                choices: ['A', 'B', 'C', 'D'],
                image: 'apple.png',
                answer: 'A',
              ),
            ],
            totalExercises: 1,
            order: 1,
          ),
        ];
        when(
          () => mockWordMatchRemoteDataSource.getWordMatches(),
        ).thenAnswer((_) async => mockWordMatches);
        //act
        final result = await repository.getWordMatches();
        expect(result, Right(mockWordMatches));
        verify(() => mockWordMatchRemoteDataSource.getWordMatches()).called(1);
        verifyNoMoreInteractions(mockWordMatchRemoteDataSource);
      },
    );
    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => mockWordMatchRemoteDataSource.getWordMatches(),
        ).thenThrow(Exception());

        // Act
        final result = await repository.getWordMatches();

        // Assert
        expect(result, isA<Left<AppFailure, List<WordMatch>>>());
        verify(() => mockWordMatchRemoteDataSource.getWordMatches()).called(1);
      },
    );
  });
  group('getUserProgress tests', () {
    test(
      'should return list of UserProgress when remoteDataSource succeeds',
      () async {
        final mockUserProgressList = [
          const UserProgress(
            id: '1',
            exerciseType: ExerciseType.wordMatch,
            writeAt: null,
            exercises: [],
          ),
          const UserProgress(
            id: '2',
            exerciseType: ExerciseType.wordMatch,
            writeAt: null,
            exercises: [],
          ),
        ];

        when(
          () => mockWordMatchRemoteDataSource.getUserProgress(userId: '123'),
        ).thenAnswer((_) async => mockUserProgressList);

        final result = await repository.getUserProgress(userId: '123');

        expect(result, Right(mockUserProgressList));
        verify(
          () => mockWordMatchRemoteDataSource.getUserProgress(userId: '123'),
        ).called(1);
        verifyNoMoreInteractions(mockWordMatchRemoteDataSource);
      },
    );

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        when(
          () => mockWordMatchRemoteDataSource.getUserProgress(userId: '123'),
        ).thenThrow(Exception());

        final result = await repository.getUserProgress(userId: '123');

        expect(result, isA<Left<AppFailure, List<UserProgress>>>());
        verify(
          () => mockWordMatchRemoteDataSource.getUserProgress(userId: '123'),
        ).called(1);
      },
    );
  });
}
