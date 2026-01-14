import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/application/word_match_detail_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/domain/repository/i_word_match_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';

import '../../../../../utils/common_mocks.dart';

class MockWordMatchDetailRepository extends Mock
    implements IWordMatchDetailRepository {}

void main() {
  late WordMatchDetailBloc bloc;
  late MockWordMatchDetailRepository mockWordMatchDetailRepository;
  late MockIProgressRepository mockIProgressRepository;
  late AppFailure apiError;

  setUp(() {
    mockWordMatchDetailRepository = MockWordMatchDetailRepository();
    mockIProgressRepository = MockIProgressRepository();
    bloc = WordMatchDetailBloc(
      progressRepository: mockIProgressRepository,
      repository: mockWordMatchDetailRepository,
    );
    apiError = AppFailure.otherError(message: 'error happend');
  });

  group('WordMatchDetailBloc', () {
    const testId = '123';
    const testUserId = 'user_1';

    const testWordMatch = WordMatch(
      id: testId,
      title: 'Test Word Match',
      exercises: [
        WordMatchExercise(
          id: '1',
          choices: ['Choice 1', 'Choice 2'],
          answer: 'Choice 1',
          image: 'apple.png',
        ),
        WordMatchExercise(
          id: '2',
          choices: ['Choice 1', 'Choice 2'],
          image: 'apple.png',
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

    group('WordMatchDetailBloc', () {
      blocTest<WordMatchDetailBloc, WordMatchDetailState>(
        'emits [loading, success] when initialize is called successfully',
        setUp: () {
          when(
            () => mockWordMatchDetailRepository.getWordMatchDetail(id: testId),
          ).thenAnswer((_) async => right(testWordMatch));
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
              const WordMatchDetailEvent.initialize(
                id: testId,
                userId: testUserId,
                progressId: testId,
              ),
            ),
        expect:
            () => [
              WordMatchDetailState.initial().copyWith(
                isLoading: true,
                exercises: [],
              ), // Ensure exercises is passed
              WordMatchDetailState.initial().copyWith(
                isLoading: false,
                wordMatch: testWordMatch,
                exercises: userExercises,
              ),
            ],
        verify: (_) {
          verify(
            () => mockWordMatchDetailRepository.getWordMatchDetail(id: testId),
          ).called(1);
          verify(
            () => mockIProgressRepository.getUserExercises(
              userId: testUserId,
              progressId: testId,
            ),
          ).called(1);
        },
      );

      blocTest<WordMatchDetailBloc, WordMatchDetailState>(
        'emits [loading, failure] when word match progress fetching fails',
        setUp: () {
          when(
            () => mockWordMatchDetailRepository.getWordMatchDetail(id: testId),
          ).thenAnswer((_) async => const Right(testWordMatch));
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
              const WordMatchDetailEvent.initialize(
                id: testId,
                userId: testUserId,
                progressId: testId,
              ),
            ),
        expect:
            () => [
              WordMatchDetailState.initial().copyWith(isLoading: true),
              WordMatchDetailState.initial().copyWith(
                isLoading: false,
                wordMatch: testWordMatch,
                fetchFailure: optionOf(Left(apiError)),
              ),
            ],
        verify: (_) {
          verify(
            () => mockWordMatchDetailRepository.getWordMatchDetail(id: testId),
          ).called(1);
          verify(
            () => mockIProgressRepository.getUserExercises(
              userId: testUserId,
              progressId: testId,
            ),
          ).called(1);
        },
      );

      blocTest<WordMatchDetailBloc, WordMatchDetailState>(
        'emits [loading, failure] when fetching word match fails',
        setUp: () {
          when(
            () => mockWordMatchDetailRepository.getWordMatchDetail(id: testId),
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
              const WordMatchDetailEvent.initialize(
                id: testId,
                userId: testUserId,
                progressId: testId,
              ),
            ),
        expect:
            () => [
              WordMatchDetailState.initial().copyWith(
                isLoading: true,
                exercises: [],
              ), // Ensure exercises is passed
            ],
      );
    });
  });
}
