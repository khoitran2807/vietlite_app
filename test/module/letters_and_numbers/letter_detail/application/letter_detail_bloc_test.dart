import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/application/letter_detail_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late LetterDetailBloc letterDetailBloc;
  late MockLetterDetailRepository mockLetterDetailRepository;
  late AppFailure apiError;
  late MockIProgressRepository mockIProgressRepository;

  setUp(() {
    mockLetterDetailRepository = MockLetterDetailRepository();
    mockIProgressRepository = MockIProgressRepository();
    letterDetailBloc = LetterDetailBloc(
      repository: mockLetterDetailRepository,
      progressRepository: mockIProgressRepository,
    );
    apiError = AppFailure.otherError(message: 'error happend');
    registerFallbackValue(ExerciseType.letter);
    when(
      () => mockIProgressRepository.updateUserProgress(
        userId: any(named: 'userId'),
        progressId: any(named: 'progressId'),
        exerciseType: any(named: 'exerciseType'),
      ),
    ).thenAnswer((_) async => right(unit));
  });

  group('getLetterDetail', () {
    final mockLetter = Letter.empty().copyWith(id: '1', title: 'A');

    blocTest<LetterDetailBloc, LetterDetailState>(
      'should emit [loading, success] when getLetterDetail succeeds',
      setUp: () {
        when(
          () => mockLetterDetailRepository.getLetterDetail(id: '1'),
        ).thenAnswer((_) async => Right(mockLetter));
      },
      build: () => letterDetailBloc,
      act:
          (bloc) => bloc.add(
            const LetterDetailEvent.getLetterDetail(id: '1', userId: 'test'),
          ),
      expect:
          () => [
            LetterDetailState.initial().copyWith(
              isLoading: true,
              failureOrSuccessOption: none(),
            ),
            LetterDetailState.initial().copyWith(
              letter: mockLetter,
              isLoading: false,
              failureOrSuccessOption: some(Right(mockLetter)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockLetterDetailRepository.getLetterDetail(id: '1'),
        ).called(1);
      },
    );

    blocTest<LetterDetailBloc, LetterDetailState>(
      'should emit [loading, failure] when getLetterDetail fails',
      setUp: () {
        when(
          () => mockLetterDetailRepository.getLetterDetail(id: '1'),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => letterDetailBloc,
      act:
          (bloc) => bloc.add(
            const LetterDetailEvent.getLetterDetail(id: '1', userId: 'test'),
          ),
      expect:
          () => [
            LetterDetailState.initial().copyWith(
              isLoading: true,
              failureOrSuccessOption: none(),
            ),
            LetterDetailState.initial().copyWith(
              isLoading: false,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockLetterDetailRepository.getLetterDetail(id: '1'),
        ).called(1);
      },
    );
  });

  group('updateLetterDetailProgress', () {
    blocTest<LetterDetailBloc, LetterDetailState>(
      'calls updateLetterDetailProgress with correct params',
      build: () {
        when(
          () => mockIProgressRepository.updateUserProgress(
            userId: 'u1',
            progressId: 'a',
            exerciseType: ExerciseType.letter,
          ),
        ).thenAnswer((_) async => right(unit));
        return letterDetailBloc;
      },
      act:
          (bloc) => bloc.add(
            const LetterDetailEvent.updateLetterDetailProgress(
              userId: 'u1',
              progressId: 'a',
            ),
          ),
      verify: (_) {
        verify(
          () => mockIProgressRepository.updateUserProgress(
            userId: 'u1',
            progressId: 'a',
            exerciseType: ExerciseType.letter,
          ),
        ).called(1);
      },
    );
  });
}
