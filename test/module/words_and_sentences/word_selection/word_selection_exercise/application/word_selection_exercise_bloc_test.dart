import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_exercise/application/word_selection_exercise_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late WordSelectionExerciseBloc bloc;
  late MockIProgressRepository mockIProgressRepository;
  late AppFailure apiError;

  setUpAll(() {
    registerFallbackValue(ExerciseType.wordSelection); // Register a fallback
  });

  setUp(() {
    mockIProgressRepository = MockIProgressRepository();
    bloc = WordSelectionExerciseBloc(repository: mockIProgressRepository);
    apiError = AppFailure.otherError(message: 'error happend');
  });

  const mockExercise = WordSelection(
    id: '1',
    title: 'Test Title',
    exercises: [
      WordSelectionExercise(
        id: 'ex1',
        choices: ['A', 'B', 'C', 'D'],
        question: 'What is the correct answer?',
        answer: 'A',
      ),
    ],
    totalExercises: 1,
    order: 1,
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'emits updated state when initialize event is added',
    build: () => bloc,
    act:
        (bloc) => bloc.add(
          WordSelectionExerciseEvent.initialize(
            exercise: mockExercise.exercises.first,
            lastAnswer: null,
          ),
        ),
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
        ],
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'emits updated state when selectAnswer event is added',
    build: () => bloc,
    act:
        (bloc) => bloc.add(
          const WordSelectionExerciseEvent.selectAnswer(selectedAnswer: 'A'),
        ),
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
          ),
        ],
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'emits success state when confirmAnswer succeeds',
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
      bloc.add(
        const WordSelectionExerciseEvent.selectAnswer(selectedAnswer: 'A'),
      );
      bloc.add(
        const WordSelectionExerciseEvent.updateAnswerProgress(
          userId: 'user1',
          progressId: 'progress1',
          totalExercises: 10,
        ),
      );
    },
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
          ),
          WordSelectionExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
          WordSelectionExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
          ),
        ],
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
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
      bloc.add(
        const WordSelectionExerciseEvent.selectAnswer(selectedAnswer: 'A'),
      );
      bloc.add(
        const WordSelectionExerciseEvent.updateAnswerProgress(
          userId: 'user1',
          progressId: 'progress1',
          totalExercises: 10,
        ),
      );
    },
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            selectedAnswer: 'A',
            isAnswered: false,
          ),
          WordSelectionExerciseState.initial().copyWith(
            isLoading: true,
            selectedAnswer: 'A',
          ),
          WordSelectionExerciseState.initial().copyWith(
            isAnswered: false,
            isLoading: false,
            selectedAnswer: 'A',
            failureOrSuccessOption: Some(Left(apiError)),
          ),
        ],
  );
  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'sets isCorrect correctly when the selected answer is correct',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordSelectionExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(
        const WordSelectionExerciseEvent.selectAnswer(selectedAnswer: 'A'),
      ); // Correct Answer
    },
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            selectedAnswer: 'A',
            isAnswered: false,
          ),
        ],
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'sets isCorrect correctly when the selected answer is incorrect',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordSelectionExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(
        const WordSelectionExerciseEvent.selectAnswer(selectedAnswer: 'B'),
      ); // Wrong Answer
    },
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            selectedAnswer: 'B',
            isAnswered: false,
          ),
        ],
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'sets isCorrect to true when the selected answer matches the correct answer',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordSelectionExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(
        const WordSelectionExerciseEvent.selectAnswer(selectedAnswer: 'A'),
      ); // Correct answer
    },
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            selectedAnswer: 'A',
            isAnswered: false,
          ),
        ],
    verify: (bloc) {
      expect(bloc.state.isCorrect, isTrue);
    },
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'sets isCorrect to false when the selected answer does not match the correct answer',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordSelectionExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(
        const WordSelectionExerciseEvent.selectAnswer(selectedAnswer: 'B'),
      ); // Incorrect answer
    },
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            selectedAnswer: 'B',
            isAnswered: false,
          ),
        ],
    verify: (bloc) {
      expect(bloc.state.isCorrect, isFalse);
    },
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'isCorrect remains false when no answer is selected',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordSelectionExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
    },
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
        ],
    verify: (bloc) {
      expect(bloc.state.isCorrect, isFalse);
    },
  );

  blocTest<WordSelectionExerciseBloc, WordSelectionExerciseState>(
    'emits isAnswered = true when checkAnswerOnly is triggered without selectedAnswer',
    build: () => bloc,
    act: (bloc) {
      bloc.add(
        WordSelectionExerciseEvent.initialize(
          exercise: mockExercise.exercises.first,
          lastAnswer: null,
        ),
      );
      bloc.add(const WordSelectionExerciseEvent.checkAnswer());
    },
    expect:
        () => [
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
          ),
          WordSelectionExerciseState.initial().copyWith(
            exercise: mockExercise.exercises.first,
            isAnswered: true,
          ),
        ],
  );
}
