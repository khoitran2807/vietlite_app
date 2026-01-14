import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_exercise/application/word_match_exercise_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late WordMatchExerciseBloc bloc;
  late MockIProgressRepository mockIProgressRepository;
  late AppFailure apiError;

  setUpAll(() {
    registerFallbackValue(ExerciseType.wordMatch); // Register a fallback
  });

  setUp(() {
    mockIProgressRepository = MockIProgressRepository();
    bloc = WordMatchExerciseBloc(repository: mockIProgressRepository);
    apiError = AppFailure.otherError(message: 'error happend');
  });

  const mockExercise = WordMatch(
    id: '1',
    title: 'Test Title',
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
  );

  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'emits updated state when initialize event is added',
    build: () => bloc,
    act:
        (bloc) => bloc.add(
          WordMatchExerciseEvent.initialize(
            exercise: mockExercise.exercises.first,
            lastAnswer: null,
          ),
        ),
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
        ],
  );

  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'emits updated state when selectAnswer event is added',
    build: () => bloc,
    act:
        (bloc) => bloc.add(
          const WordMatchExerciseEvent.selectAnswer(selectedAnswer: 'A'),
        ),
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
          ),
        ],
  );

  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'emits success state when updateUserProgress succeeds',
    build: () {
      when(
        () => mockIProgressRepository.updateUserProgress(
          userId: any(named: 'userId'),
          progressId: any(named: 'progressId'),
          exerciseType: any(named: 'exerciseType'),
          exerciseId: any(named: 'exerciseId'),
          lastAnswer: any(named: 'lastAnswer'),
          isCorrect: any(named: 'isCorrect'),
          totalExercises: any(named: 'totalExercises'),
        ),
      ).thenAnswer((_) async => const Right(unit));
      return bloc;
    },
    act: (bloc) {
      bloc.add(const WordMatchExerciseEvent.selectAnswer(selectedAnswer: 'A'));
      bloc.add(
        const WordMatchExerciseEvent.updateAnswerProgress(
          userId: 'user1',
          progressId: 'progress1',
          totalExercises: 10,
        ),
      );
    },
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
          ),
          WordMatchExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
          WordMatchExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
          ),
        ],
  );

  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'emits failure state when confirmAnswer fails',
    build: () {
      when(
        () => mockIProgressRepository.updateUserProgress(
          userId: any(named: 'userId'),
          progressId: any(named: 'progressId'),
          exerciseType: any(named: 'exerciseType'),
          exerciseId: any(named: 'exerciseId'),
          lastAnswer: any(named: 'lastAnswer'),
          isCorrect: any(named: 'isCorrect'),
          totalExercises: any(named: 'totalExercises'),
        ),
      ).thenAnswer((_) async => Left(apiError));
      return bloc;
    },
    act: (bloc) {
      bloc.add(const WordMatchExerciseEvent.selectAnswer(selectedAnswer: 'A'));
      bloc.add(
        const WordMatchExerciseEvent.updateAnswerProgress(
          userId: 'user1',
          progressId: 'progress1',
          totalExercises: 10,
        ),
      );
    },
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
          ),
          WordMatchExerciseState.initial().copyWith(
            isLoading: true,
            selectedAnswer: 'A',
          ),
          WordMatchExerciseState.initial().copyWith(
            isAnswered: false,
            isLoading: false,
            selectedAnswer: 'A',
            failureOrSuccessOption: Some(Left(apiError)),
          ),
        ],
  );
  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'sets isCorrect correctly when the selected answer is correct',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordMatchExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(
        const WordMatchExerciseEvent.selectAnswer(selectedAnswer: 'A'),
      ); // Correct Answer
    },
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            selectedAnswer: 'A',
            isAnswered: false,
          ),
        ],
  );

  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'sets isCorrect correctly when the selected answer is incorrect',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordMatchExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(
        const WordMatchExerciseEvent.selectAnswer(selectedAnswer: 'B'),
      ); // Wrong Answer
    },
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            selectedAnswer: 'B',
            isAnswered: false,
          ),
        ],
  );

  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'sets isCorrect to true when the selected answer matches the correct answer',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordMatchExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(
        const WordMatchExerciseEvent.selectAnswer(selectedAnswer: 'A'),
      ); // Correct answer
    },
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            selectedAnswer: 'A',
            isAnswered: false,
          ),
        ],
    verify: (bloc) {
      expect(bloc.state.isCorrect, isTrue);
    },
  );

  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'sets isCorrect to false when the selected answer does not match the correct answer',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordMatchExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(
        const WordMatchExerciseEvent.selectAnswer(selectedAnswer: 'B'),
      ); // Incorrect answer
    },
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            selectedAnswer: 'B',
            isAnswered: false,
          ),
        ],
    verify: (bloc) {
      expect(bloc.state.isCorrect, isFalse);
    },
  );

  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'isCorrect remains false when no answer is selected',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordMatchExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
    },
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
        ],
    verify: (bloc) {
      expect(bloc.state.isCorrect, isFalse);
    },
  );
  blocTest<WordMatchExerciseBloc, WordMatchExerciseState>(
    'emits isAnswered = true when checkAnswerOnly is triggered without selectedAnswer',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordMatchExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(const WordMatchExerciseEvent.checkAnswer());
    },
    expect:
        () => [
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordMatchExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            isAnswered: true,
          ),
        ],
  );
}
