import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/application/word_match_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late WordMatchBloc wordMatchBloc;
  late MockWordMatchRepository mockWordMatchRepository;
  late AppFailure apiError;

  setUp(() {
    mockWordMatchRepository = MockWordMatchRepository();
    wordMatchBloc = WordMatchBloc(repository: mockWordMatchRepository);
    apiError = AppFailure.otherError(message: 'error happened');
  });

  tearDown(() {
    wordMatchBloc.close();
  });

  group('WordMatchBloc Tests', () {
    const testUserId = 'user_1';
    final List<WordMatch> testWordMatches = [
      const WordMatch(
        id: '1',
        title: 'Test Word',
        exercises: [
          WordMatchExercise(
            id: 'ex1',
            choices: ['A', 'B', 'C', 'D'],
            answer: 'A',
            image: 'apple.png',
          ),
        ],
        totalExercises: 1,
        order: 1,
        isPremium: false,
      ),
    ];

    blocTest<WordMatchBloc, WordMatchState>(
      'should emit [loading, success] when getWordMatches succeeds',
      build: () {
        when(
          () => mockWordMatchRepository.getWordMatches(),
        ).thenAnswer((_) async => Right(testWordMatches));
        return wordMatchBloc;
      },
      act:
          (bloc) =>
              bloc.add(const WordMatchEvent.initialize(userId: testUserId)),
      expect:
          () => [
            WordMatchState.initial().copyWith(isLoading: true),
            WordMatchState.initial().copyWith(
              wordMatches: testWordMatches,
              isLoading: false,
              fetchFailure: optionOf(Right(testWordMatches)),
            ),
          ],
      verify: (_) {
        verify(() => mockWordMatchRepository.getWordMatches()).called(1);
      },
    );

    blocTest<WordMatchBloc, WordMatchState>(
      'should emit [loading, failure] when getWordMatches fails',
      build: () {
        when(
          () => mockWordMatchRepository.getWordMatches(),
        ).thenAnswer((_) async => Left(apiError));
        return wordMatchBloc;
      },
      act:
          (bloc) =>
              bloc.add(const WordMatchEvent.initialize(userId: testUserId)),
      expect:
          () => [
            WordMatchState.initial().copyWith(isLoading: true),
            WordMatchState.initial().copyWith(
              isLoading: false,
              fetchFailure: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockWordMatchRepository.getWordMatches()).called(1);
      },
    );
  });
}
