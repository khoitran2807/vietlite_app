// progress_bloc_test.dart
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/common_mocks.dart';

void main() {
  group('ProgressBloc', () {
    late ProgressBloc progressBloc;
    late MockProgressRepository mockProgressRepository;
    late AppFailure apiError;

    setUp(() {
      mockProgressRepository = MockProgressRepository();
      progressBloc = ProgressBloc(repository: mockProgressRepository);
      apiError = AppFailure.otherError(message: 'error happend');
    });

    tearDown(() {
      progressBloc.close();
    });

    final testLetter = Letter.empty().copyWith(id: '1', title: 'A');
    final testNumber = Number.empty().copyWith(id: '1', title: '1');
    final testThing = Thing.empty().copyWith(id: '1', name: 'Apple');
    final testWordSelection = WordSelection.empty().copyWith(id: 'ws1');
    final testWordMatch = WordMatch.empty().copyWith(id: 'wm1');

    final testProgress = UserProgress(
      id: 'progress_1',
      exerciseType: ExerciseType.letter,
      writeAt: DateTime(2024, 1, 1),
      exercises: [],
    );

    blocTest<ProgressBloc, ProgressState>(
      'emits progresses when getUserProgresses succeeds',
      build: () {
        when(
          () => mockProgressRepository.getUserProgresses(userId: '123'),
        ).thenAnswer((_) async => Right([testProgress]));
        return ProgressBloc(repository: mockProgressRepository);
      },
      act:
          (bloc) =>
              bloc.add(const ProgressEvent.getUserProgresses(userId: '123')),
      expect:
          () => [
            isA<ProgressState>()
                .having(
                  (s) => s.userProgresses.length,
                  'userProgresses length',
                  1,
                )
                .having(
                  (s) => s.userProgresses.first.id,
                  'userProgress id',
                  'progress_1',
                )
                .having((s) => s.isLoading, 'isLoading', false),
          ],
    );

    blocTest<ProgressBloc, ProgressState>(
      'emits failure when getUserProgresses fails',
      build: () {
        when(
          () => mockProgressRepository.getUserProgresses(userId: 'u1'),
        ).thenAnswer((_) async => Left(apiError));
        return progressBloc;
      },
      act:
          (bloc) =>
              bloc.add(const ProgressEvent.getUserProgresses(userId: 'u1')),
      expect:
          () => [
            ProgressState.initial().copyWith(
              fetchFailure: some(Left(apiError)),
              isLoading: false,
            ),
          ],
    );

    blocTest<ProgressBloc, ProgressState>(
      'updateProgress replaces old progress when exists',
      build: () => progressBloc,
      seed:
          () =>
              ProgressState.initial().copyWith(userProgresses: [testProgress]),
      act: (bloc) {
        final updated = testProgress.copyWith(
          exercises: [UserExercise.empty().copyWith(id: 'ex1')],
        );
        bloc.add(ProgressEvent.updateProgress(progress: updated));
      },
      expect:
          () => [
            isA<ProgressState>().having(
              (s) => s.userProgresses.first.exercises.first.id,
              'exercise id',
              'ex1',
            ),
          ],
    );
    blocTest<ProgressBloc, ProgressState>(
      'updateProgress de-duplicates exercises by id: keeps others, replaces same id and moves it to front',
      build: () => progressBloc,
      seed: () {
        final old = testProgress.copyWith(
          exercises: [
            UserExercise.empty().copyWith(id: 'ex1'),
            UserExercise.empty().copyWith(id: 'ex2'),
          ],
        );
        return ProgressState.initial().copyWith(userProgresses: [old]);
      },
      act: (bloc) {
        final updated = testProgress.copyWith(
          exercises: [UserExercise.empty().copyWith(id: 'ex2')],
        );
        bloc.add(ProgressEvent.updateProgress(progress: updated));
      },
      expect:
          () => [
            isA<ProgressState>()
                .having(
                  (s) => s.userProgresses.length,
                  'userProgresses length',
                  1,
                )
                .having(
                  (s) => s.userProgresses.first.exercises.length,
                  'exercises length',
                  2,
                )
                .having(
                  (s) =>
                      s.userProgresses.first.exercises
                          .map((e) => e.id)
                          .toList(),
                  'exercise ids order',
                  ['ex2', 'ex1'],
                ),
          ],
    );

    blocTest<ProgressBloc, ProgressState>(
      'updateProgress adds new progress when not exists',
      build: () => progressBloc,
      act: (bloc) {
        final newProgress = UserProgress(
          id: 'progress_new',
          exerciseType: ExerciseType.number,
          writeAt: DateTime(2024, 2, 1),
          exercises: [],
        );
        bloc.add(ProgressEvent.updateProgress(progress: newProgress));
      },
      expect:
          () => [
            ProgressState.initial().copyWith(
              userProgresses: [
                UserProgress(
                  id: 'progress_new',
                  exerciseType: ExerciseType.number,
                  writeAt: DateTime(2024, 2, 1),
                  exercises: [],
                ),
              ],
            ),
          ],
    );

    blocTest<ProgressBloc, ProgressState>(
      'initLetters sets letters',
      build: () => progressBloc,
      act: (bloc) => bloc.add(ProgressEvent.initLetters(letters: [testLetter])),
      expect:
          () => [
            ProgressState.initial().copyWith(letters: [testLetter]),
          ],
    );

    blocTest<ProgressBloc, ProgressState>(
      'initNumbers sets numbers',
      build: () => progressBloc,
      act: (bloc) => bloc.add(ProgressEvent.initNumbers(numbers: [testNumber])),
      expect:
          () => [
            ProgressState.initial().copyWith(numbers: [testNumber]),
          ],
    );

    blocTest<ProgressBloc, ProgressState>(
      'initThings sets things',
      build: () => progressBloc,
      act: (bloc) => bloc.add(ProgressEvent.initThings(things: [testThing])),
      expect:
          () => [
            ProgressState.initial().copyWith(things: [testThing]),
          ],
    );

    blocTest<ProgressBloc, ProgressState>(
      'initWordSelections sets wordSelections',
      build: () => progressBloc,
      act:
          (bloc) => bloc.add(
            ProgressEvent.initWordSelections(
              wordSelections: [testWordSelection],
            ),
          ),
      expect:
          () => [
            ProgressState.initial().copyWith(
              wordSelections: [testWordSelection],
            ),
          ],
    );

    blocTest<ProgressBloc, ProgressState>(
      'initWordMatches sets wordMatches',
      build: () => progressBloc,
      act:
          (bloc) => bloc.add(
            ProgressEvent.initWordMatches(wordMatches: [testWordMatch]),
          ),
      expect:
          () => [
            ProgressState.initial().copyWith(wordMatches: [testWordMatch]),
          ],
    );
  });

  group('ProgressState getters', () {
    final letterA = Letter.empty().copyWith(id: 'l1', title: 'A', order: 1);
    final letterB = Letter.empty().copyWith(id: 'l2', title: 'B', order: 2);

    final number1 = Number.empty().copyWith(id: 'n1', title: '1');
    final number2 = Number.empty().copyWith(id: 'n2', title: '2');

    final thing1 = Thing.empty().copyWith(id: 't1', name: 'Apple', order: 1);
    final thing2 = Thing.empty().copyWith(id: 't2', name: 'Banana', order: 2);

    final ws1 = WordSelection.empty().copyWith(id: 'ws1', order: 1);
    final ws2 = WordSelection.empty().copyWith(id: 'ws2', order: 2);

    final wm1 = WordMatch.empty().copyWith(id: 'wm1', order: 1);
    final wm2 = WordMatch.empty().copyWith(id: 'wm2', order: 2);

    test('compareWriteAt orders by writeAt descending when both non-null', () {
      final state = ProgressState.initial();

      final older = UserProgress(
        id: 'old',
        exerciseType: ExerciseType.letter,
        writeAt: DateTime(2023, 1, 1),
        exercises: [],
      );

      final newer = UserProgress(
        id: 'new',
        exerciseType: ExerciseType.letter,
        writeAt: DateTime(2024, 1, 1),
        exercises: [],
      );

      expect(state.compareWriteAt(newer, older), lessThan(0));
      expect(state.compareWriteAt(older, newer), greaterThan(0));
      expect(state.compareWriteAt(newer, newer), 0);
    });

    test('lastLearnedLetter & nextLearnedLetter work correctly', () {
      final state = ProgressState.initial().copyWith(
        letters: [letterA, letterB],
        userProgresses: [
          UserProgress(
            id: 'l1',
            exerciseType: ExerciseType.letter,
            writeAt: DateTime(2024, 1, 1),
            exercises: [],
          ),
        ],
      );

      expect(state.lastLearnedLetter, letterA);
      expect(state.nextLearnedLetter, letterB);
    });

    test('lastLearnedNumber & nextLearnedNumber work correctly', () {
      final state = ProgressState.initial().copyWith(
        numbers: [number1, number2],
        userProgresses: [
          UserProgress(
            id: 'n1',
            exerciseType: ExerciseType.number,
            writeAt: DateTime(2024, 1, 1),
            exercises: [],
          ),
        ],
      );

      expect(state.lastLearnedNumber, number1);
      expect(state.nextLearnedNumber, number2);
    });

    test('lastLearnedThing & nextLearnedThing work correctly', () {
      final state = ProgressState.initial().copyWith(
        things: [thing1, thing2],
        userProgresses: [
          UserProgress(
            id: 't1',
            exerciseType: ExerciseType.things,
            writeAt: DateTime(2024, 1, 1),
            exercises: [],
          ),
        ],
      );

      expect(state.lastLearnedThing, thing1);
      expect(state.nextLearnedThing, thing2);
    });

    test(
      'lastLearnedWordSelection & nextLearnedWordSelection work correctly',
      () {
        final state = ProgressState.initial().copyWith(
          wordSelections: [ws1, ws2],
          userProgresses: [
            UserProgress(
              id: 'ws1',
              exerciseType: ExerciseType.wordSelection,
              writeAt: DateTime(2024, 1, 1),
              exercises: [],
            ),
          ],
        );

        expect(state.lastLearnedWordSelection, ws1);
        expect(state.nextLearnedWordSelection, ws2);
      },
    );

    test('lastLearnedWordMatch & nextLearnedWordMatch work correctly', () {
      final state = ProgressState.initial().copyWith(
        wordMatches: [wm1, wm2],
        userProgresses: [
          UserProgress(
            id: 'wm1',
            exerciseType: ExerciseType.wordMatch,
            writeAt: DateTime(2024, 1, 1),
            exercises: [],
          ),
        ],
      );

      expect(state.lastLearnedWordMatch, wm1);
      expect(state.nextLearnedWordMatch, wm2);
    });

    test('compareWriteAt handles null correctly', () {
      final state = ProgressState.initial();

      const a = UserProgress(
        id: 'a',
        exerciseType: ExerciseType.letter,
        writeAt: null,
        exercises: [],
      );
      final b = UserProgress(
        id: 'b',
        exerciseType: ExerciseType.letter,
        writeAt: DateTime(2024, 1, 1),
        exercises: [],
      );

      // null đi sau
      expect(state.compareWriteAt(a, b), 1);
      expect(state.compareWriteAt(b, a), -1);
      expect(state.compareWriteAt(a, a), 0);
    });
  });
}
