import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/application/word_selection_detail_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/domain/repository/i_word_selection_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';

import '../../../../../utils/common_mocks.dart';

class MockWordSelectionDetailRepository extends Mock
    implements IWordSelectionDetailRepository {}

void main() {
  late WordSelectionDetailBloc bloc;
  late MockWordSelectionDetailRepository mockWordSelectionDetailRepository;
  late MockIProgressRepository mockIProgressRepository;
  late AppFailure apiError;

  setUp(() {
    mockWordSelectionDetailRepository = MockWordSelectionDetailRepository();
    mockIProgressRepository = MockIProgressRepository();
    bloc = WordSelectionDetailBloc(
      progressRepository: mockIProgressRepository,
      repository: mockWordSelectionDetailRepository,
    );
    apiError = AppFailure.otherError(message: 'error happend');
  });

  group('WordSelectionDetailBloc', () {
    const testId = '123';
    const testUserId = 'user_1';

    const testWordSelection = WordSelection(
      id: testId,
      title: 'Test Word Selection',
      exercises: [
        WordSelectionExercise(
          id: '1',
          choices: ['Choice 1', 'Choice 2'],
          question: 'What is the answer?',
          answer: 'Choice 1',
        ),
        WordSelectionExercise(
          id: '2',
          choices: ['Choice 1', 'Choice 2'],
          question: 'What is the capital of France?',
          answer: 'Choice 2',
        ),
      ],
      totalExercises: 2,
      order: 1,
    );

    final userExercises = [
      const UserExercise(lastAnswer: 'Choice 1', id: testId, isCorrect: true),
      const UserExercise(lastAnswer: 'Choice 2', id: testId, isCorrect: false),
    ];

    group('WordSelectionDetailBloc', () {
      blocTest<WordSelectionDetailBloc, WordSelectionDetailState>(
        'emits [loading, success] when initialize is called successfully',
        setUp: () {
          when(
            () => mockWordSelectionDetailRepository.getWordSelectionDetail(
              id: testId,
            ),
          ).thenAnswer((_) async => right(testWordSelection));
          when(
            () => mockIProgressRepository.getUserExercises(
              userId: testUserId,
              progressId: testId,
            ),
          ).thenAnswer((_) async => right(userExercises));
        },
        build: () => bloc,
        act:
            (bloc) => bloc.add(
              const WordSelectionDetailEvent.initialize(
                id: testId,
                userId: testUserId,
                progressId: testId,
              ),
            ),
        expect:
            () => [
              WordSelectionDetailState.initial().copyWith(
                isLoading: true,
                exercises: [],
              ), // Ensure exercises is passed
              WordSelectionDetailState.initial().copyWith(
                isLoading: false,
                wordSelection: testWordSelection,
                exercises: userExercises,
              ),
            ],
        verify: (_) {
          verify(
            () => mockWordSelectionDetailRepository.getWordSelectionDetail(
              id: testId,
            ),
          ).called(1);
          verify(
            () => mockIProgressRepository.getUserExercises(
              userId: testUserId,
              progressId: testId,
            ),
          ).called(1);
        },
      );

      blocTest<WordSelectionDetailBloc, WordSelectionDetailState>(
        'emits [loading, failure] when word selection progress fetching fails',
        setUp: () {
          when(
            () => mockWordSelectionDetailRepository.getWordSelectionDetail(
              id: testId,
            ),
          ).thenAnswer((_) async => const Right(testWordSelection));
          when(
            () => mockIProgressRepository.getUserExercises(
              userId: testUserId,
              progressId: testId,
            ),
          ).thenAnswer((_) async => Left(apiError));
        },
        build: () => bloc,
        act:
            (bloc) => bloc.add(
              const WordSelectionDetailEvent.initialize(
                id: testId,
                userId: testUserId,
                progressId: testId,
              ),
            ),
        expect:
            () => [
              WordSelectionDetailState.initial().copyWith(isLoading: true),
              WordSelectionDetailState.initial().copyWith(
                isLoading: false,
                wordSelection: testWordSelection,
                fetchFailure: optionOf(Left(apiError)),
              ),
            ],
        verify: (_) {
          verify(
            () => mockWordSelectionDetailRepository.getWordSelectionDetail(
              id: testId,
            ),
          ).called(1);
          verify(
            () => mockIProgressRepository.getUserExercises(
              userId: testUserId,
              progressId: testId,
            ),
          ).called(1);
        },
      );

      blocTest<WordSelectionDetailBloc, WordSelectionDetailState>(
        'emits [loading, failure] when fetching word selection fails',
        setUp: () {
          when(
            () => mockWordSelectionDetailRepository.getWordSelectionDetail(
              id: testId,
            ),
          ).thenAnswer((_) async => left(apiError));
          when(
            () => mockIProgressRepository.getUserExercises(
              userId: testUserId,
              progressId: testId,
            ),
          ).thenAnswer((_) async => right(userExercises));
        },
        build: () => bloc,
        act:
            (bloc) => bloc.add(
              const WordSelectionDetailEvent.initialize(
                id: testId,
                userId: testUserId,
                progressId: testId,
              ),
            ),
        expect:
            () => [
              WordSelectionDetailState.initial().copyWith(
                isLoading: true,
                exercises: [],
              ), // Ensure exercises is passed
            ],
      );
    });
  });
}
