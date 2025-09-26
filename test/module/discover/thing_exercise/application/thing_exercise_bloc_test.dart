import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/thing_exercise/application/thing_exercise_bloc.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late ThingExerciseBloc bloc;
  late MockProgressRepository mockProgressRepository;
  late AppFailure apiError;

  setUp(() {
    mockProgressRepository = MockProgressRepository();
    bloc = ThingExerciseBloc(repository: mockProgressRepository);
    apiError = AppFailure.otherError(message: 'error happend');
  });

  setUpAll(() {
    registerFallbackValue(ExerciseType.things);
  });

  group('ThingExerciseBloc', () {
    final mockThingExercise = ThingExercise.empty().copyWith(
      id: 't1',
      image: 'apple.png',
      question: 'What color is the apple?',
      choices: ['red', 'green'],
      answer: 'red',
    );

    blocTest<ThingExerciseBloc, ThingExerciseState>(
      'emits updated state when initialize is called',
      build: () => bloc,
      act:
          (bloc) => bloc.add(
            ThingExerciseEvent.initialize(
              exercise: mockThingExercise,
              lastAnswer: 'red',
            ),
          ),
      expect:
          () => [
            ThingExerciseState.initial().copyWith(
              exercise: mockThingExercise,
              selectedAnswer: 'red',
              isAnswered: true,
            ),
          ],
    );

    blocTest<ThingExerciseBloc, ThingExerciseState>(
      'updates selectedAnswer when selectAnswer is called with different value',
      build: () => bloc,
      seed:
          () => ThingExerciseState.initial().copyWith(
            exercise: mockThingExercise,
            selectedAnswer: 'green',
            isAnswered: true,
          ),
      act:
          (bloc) => bloc.add(
            const ThingExerciseEvent.selectAnswer(selectedAnswer: 'red'),
          ),
      expect:
          () => [
            ThingExerciseState.initial().copyWith(
              exercise: mockThingExercise,
              selectedAnswer: 'red',
              isAnswered: false,
            ),
          ],
    );

    blocTest<ThingExerciseBloc, ThingExerciseState>(
      'sets isAnswered to true when checkAnswer is called',
      build: () => bloc,
      seed:
          () => ThingExerciseState.initial().copyWith(
            exercise: mockThingExercise,
            selectedAnswer: 'red',
            isAnswered: false,
          ),
      act: (bloc) => bloc.add(const ThingExerciseEvent.checkAnswer()),
      expect:
          () => [
            ThingExerciseState.initial().copyWith(
              exercise: mockThingExercise,
              selectedAnswer: 'red',
              isAnswered: true,
            ),
          ],
    );

    blocTest<ThingExerciseBloc, ThingExerciseState>(
      'emits loading then success when updateAnswerProgress succeeds',
      build: () {
        when(
          () => mockProgressRepository.updateUserProgress(
            userId: any(named: 'userId'),
            progressId: any(named: 'progressId'),
            exerciseType: any(named: 'exerciseType'),
            exerciseId: any(named: 'exerciseId'),
            lastAnswer: any(named: 'lastAnswer'),
            isCorrect: any(named: 'isCorrect'),
            totalExercises: any(named: 'totalExercises'),
          ),
        ).thenAnswer((_) async => right(unit));
        return bloc;
      },
      seed:
          () => ThingExerciseState.initial().copyWith(
            exercise: mockThingExercise,
            selectedAnswer: 'red',
          ),
      act:
          (bloc) => bloc.add(
            const ThingExerciseEvent.updateAnswerProgress(
              userId: 'u1',
              progressId: 'p1',
              totalExercises: 5,
            ),
          ),
      expect:
          () => [
            ThingExerciseState.initial().copyWith(
              exercise: mockThingExercise,
              selectedAnswer: 'red',
              isLoading: true,
              failureOrSuccessOption: none(),
            ),
            ThingExerciseState.initial().copyWith(
              exercise: mockThingExercise,
              selectedAnswer: 'red',
              isLoading: false,
              failureOrSuccessOption: some(right(unit)),
            ),
          ],
    );

    blocTest<ThingExerciseBloc, ThingExerciseState>(
      'emits loading then failure when updateAnswerProgress fails',
      build: () {
        when(
          () => mockProgressRepository.updateUserProgress(
            userId: any(named: 'userId'),
            progressId: any(named: 'progressId'),
            exerciseType: any(named: 'exerciseType'),
            exerciseId: any(named: 'exerciseId'),
            lastAnswer: any(named: 'lastAnswer'),
            isCorrect: any(named: 'isCorrect'),
            totalExercises: any(named: 'totalExercises'),
          ),
        ).thenAnswer((_) async => left(apiError));
        return bloc;
      },
      seed:
          () => ThingExerciseState.initial().copyWith(
            exercise: mockThingExercise,
            selectedAnswer: 'green',
          ),
      act:
          (bloc) => bloc.add(
            const ThingExerciseEvent.updateAnswerProgress(
              userId: 'u1',
              progressId: 'p1',
              totalExercises: 5,
            ),
          ),
      expect:
          () => [
            ThingExerciseState.initial().copyWith(
              exercise: mockThingExercise,
              selectedAnswer: 'green',
              isLoading: true,
              failureOrSuccessOption: none(),
            ),
            ThingExerciseState.initial().copyWith(
              exercise: mockThingExercise,
              selectedAnswer: 'green',
              isLoading: false,
              failureOrSuccessOption: some(left(apiError)),
            ),
          ],
    );
  });
}
