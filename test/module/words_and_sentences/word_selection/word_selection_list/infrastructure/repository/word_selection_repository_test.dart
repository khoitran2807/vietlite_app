import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/repository/word_selection_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/common_mocks.dart';

void main() {
  late WordSelectionRepository repository;
  late MockWordSelectionRemoteDataSource mockWordSelectionRemoteDataSource;
  setUp(() {
    mockWordSelectionRemoteDataSource = MockWordSelectionRemoteDataSource();
    repository = WordSelectionRepository(
      remoteDataSource: mockWordSelectionRemoteDataSource,
    );
  });

  group('WordSelection repository tests', () {
    test(
      'should return list of WordSelection when remoteDataSource succeeds',
      () async {
        final mockWordSelections = [
          const WordSelection(
            id: '1',
            title: 'A',
            exercises: [
              WordSelectionExercise(
                id: 'ex1',
                choices: ['A', 'B', 'C', 'D'],
                question: 'What is Flutter?',
                answer: 'A',
              ),
            ],
            totalExercises: 1,
            order: 1,
            isPremium: false,
          ),
        ];
        when(
          () => mockWordSelectionRemoteDataSource.getWordSelections(),
        ).thenAnswer((_) async => mockWordSelections);
        //act
        final result = await repository.getWordSelections();
        expect(result, Right(mockWordSelections));
        verify(
          () => mockWordSelectionRemoteDataSource.getWordSelections(),
        ).called(1);
        verifyNoMoreInteractions(mockWordSelectionRemoteDataSource);
      },
    );
    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => mockWordSelectionRemoteDataSource.getWordSelections(),
        ).thenThrow(Exception());

        // Act
        final result = await repository.getWordSelections();

        // Assert
        expect(result, isA<Left<AppFailure, List<WordSelection>>>());
        verify(
          () => mockWordSelectionRemoteDataSource.getWordSelections(),
        ).called(1);
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
            exerciseType: ExerciseType.wordSelection,
            writeAt: null,
            exercises: [],
          ),
          const UserProgress(
            id: '2',
            exerciseType: ExerciseType.wordSelection,
            writeAt: null,
            exercises: [],
          ),
        ];

        when(
          () =>
              mockWordSelectionRemoteDataSource.getUserProgress(userId: '123'),
        ).thenAnswer((_) async => mockUserProgressList);

        final result = await repository.getUserProgress(userId: '123');

        expect(result, Right(mockUserProgressList));
        verify(
          () =>
              mockWordSelectionRemoteDataSource.getUserProgress(userId: '123'),
        ).called(1);
        verifyNoMoreInteractions(mockWordSelectionRemoteDataSource);
      },
    );

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        when(
          () =>
              mockWordSelectionRemoteDataSource.getUserProgress(userId: '123'),
        ).thenThrow(Exception());

        final result = await repository.getUserProgress(userId: '123');

        expect(result, isA<Left<AppFailure, List<UserProgress>>>());
        verify(
          () =>
              mockWordSelectionRemoteDataSource.getUserProgress(userId: '123'),
        ).called(1);
      },
    );
  });
}
