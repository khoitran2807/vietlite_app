import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/application/word_selection_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late WordSelectionBloc wordSelectionBloc;
  late MockWordSelectionRepository mockWordSelectionRepository;
  late AppFailure apiError;

  setUp(() {
    mockWordSelectionRepository = MockWordSelectionRepository();
    wordSelectionBloc = WordSelectionBloc(
      repository: mockWordSelectionRepository,
    );
    apiError = AppFailure.otherError(message: 'error happened');
  });

  tearDown(() {
    wordSelectionBloc.close();
  });

  group('WordSelectionBloc Tests', () {
    const testUserId = 'user_1';
    final List<WordSelection> testWordSelections = [
      const WordSelection(
        id: '1',
        title: 'Test Word',
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
      ),
    ];

    blocTest<WordSelectionBloc, WordSelectionState>(
      'should emit [loading, success] when getWordSelections succeeds',
      build: () {
        when(
          () => mockWordSelectionRepository.getWordSelections(),
        ).thenAnswer((_) async => Right(testWordSelections));
        return wordSelectionBloc;
      },
      act:
          (bloc) =>
              bloc.add(const WordSelectionEvent.initialize(userId: testUserId)),
      expect:
          () => [
            WordSelectionState.initial().copyWith(isLoading: true),
            WordSelectionState.initial().copyWith(
              wordSelections: testWordSelections,
              isLoading: false,
              fetchFailure: optionOf(Right(testWordSelections)),
            ),
          ],
      verify: (_) {
        verify(() => mockWordSelectionRepository.getWordSelections()).called(1);
      },
    );

    blocTest<WordSelectionBloc, WordSelectionState>(
      'should emit [loading, failure] when getWordSelections fails',
      build: () {
        when(
          () => mockWordSelectionRepository.getWordSelections(),
        ).thenAnswer((_) async => Left(apiError));
        return wordSelectionBloc;
      },
      act:
          (bloc) =>
              bloc.add(const WordSelectionEvent.initialize(userId: testUserId)),
      expect:
          () => [
            WordSelectionState.initial().copyWith(isLoading: true),
            WordSelectionState.initial().copyWith(
              isLoading: false,
              fetchFailure: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockWordSelectionRepository.getWordSelections()).called(1);
      },
    );
  });
}
