import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/application/number_detail_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late NumberDetailBloc numberDetailBloc;
  late MockNumberDetailRepository mockNumberDetailRepository;
  late MockIProgressRepository mockIProgressRepository;
  late AppFailure apiError;

  setUp(() {
    mockNumberDetailRepository = MockNumberDetailRepository();
    mockIProgressRepository = MockIProgressRepository();
    numberDetailBloc = NumberDetailBloc(
      repository: mockNumberDetailRepository,
      progressRepository: mockIProgressRepository,
    );
    apiError = AppFailure.otherError(message: 'error happend');
    registerFallbackValue(ExerciseType.number);
    when(
      () => mockIProgressRepository.updateUserProgress(
        userId: any(named: 'userId'),
        progressId: any(named: 'progressId'),
        exerciseType: any(named: 'exerciseType'),
      ),
    ).thenAnswer((_) async => right(unit));
  });

  group('getNumberDetail', () {
    final mockNumber = Number.empty().copyWith(id: '1', title: 'A');

    blocTest<NumberDetailBloc, NumberDetailState>(
      'should emit [loading, success] when getNumberDetail succeeds',
      setUp: () {
        when(
          () => mockNumberDetailRepository.getNumberDetail(id: '1'),
        ).thenAnswer((_) async => Right(mockNumber));
      },
      build: () => numberDetailBloc,
      act:
          (bloc) => bloc.add(
            const NumberDetailEvent.getNumberDetail(id: '1', userId: 'test'),
          ),
      expect:
          () => [
            NumberDetailState.initial().copyWith(
              isLoading: true,
              failureOrSuccessOption: none(),
            ),
            NumberDetailState.initial().copyWith(
              number: mockNumber,
              isLoading: false,
              failureOrSuccessOption: some(Right(mockNumber)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockNumberDetailRepository.getNumberDetail(id: '1'),
        ).called(1);
      },
    );
    blocTest<NumberDetailBloc, NumberDetailState>(
      'should emit [loading, failure] when getNumberDetail fails',
      setUp: () {
        when(
          () => mockNumberDetailRepository.getNumberDetail(id: '1'),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => numberDetailBloc,
      act:
          (bloc) => bloc.add(
            const NumberDetailEvent.getNumberDetail(id: '1', userId: 'test'),
          ),
      expect:
          () => [
            NumberDetailState.initial().copyWith(
              isLoading: true,
              failureOrSuccessOption: none(),
            ),
            NumberDetailState.initial().copyWith(
              isLoading: false,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockNumberDetailRepository.getNumberDetail(id: '1'),
        ).called(1);
      },
    );
  });

  group('updateNumberDetailProgress', () {
    blocTest<NumberDetailBloc, NumberDetailState>(
      'calls updateNumberDetailProgress with correct params',
      build: () {
        when(
          () => mockIProgressRepository.updateUserProgress(
            userId: 'u1',
            progressId: 'a',
            exerciseType: ExerciseType.number,
          ),
        ).thenAnswer((_) async => right(unit));
        return numberDetailBloc;
      },
      act:
          (bloc) => bloc.add(
            const NumberDetailEvent.updateNumberDetailProgress(
              userId: 'u1',
              progressId: 'a',
            ),
          ),
      verify: (_) {
        verify(
          () => mockIProgressRepository.updateUserProgress(
            userId: 'u1',
            progressId: 'a',
            exerciseType: ExerciseType.number,
          ),
        ).called(1);
      },
    );
  });
}
