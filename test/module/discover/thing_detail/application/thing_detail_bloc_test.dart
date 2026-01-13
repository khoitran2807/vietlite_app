import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/thing_detail/application/thing_detail_bloc.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late ThingDetailBloc bloc;
  late MockThingDetailRepository mockThingDetailRepository;
  late MockProgressRepository mockProgressRepository;
  late AppFailure apiError;

  setUp(() {
    mockThingDetailRepository = MockThingDetailRepository();
    mockProgressRepository = MockProgressRepository();
    bloc = ThingDetailBloc(
      repository: mockThingDetailRepository,
      progressRepository: mockProgressRepository,
    );
    apiError = AppFailure.otherError(message: 'error happend');
  });

  group('ThingDetailBloc', () {
    const testId = 'thing-1';
    const testUserId = 'user_1';

    final testThing = Thing.empty().copyWith(
      id: testId,
      name: 'maudo',
      order: 1,
      type: ThingType.color,
    );

    final userExercises = [
      UserExercise.empty().copyWith(id: 'ex-1'),
      UserExercise.empty().copyWith(id: 'ex-2'),
    ];

    blocTest<ThingDetailBloc, ThingDetailState>(
      'emits [loading, success] when getThingDetail succeeds',
      setUp: () {
        when(
          () => mockThingDetailRepository.getThingDetail(id: testId),
        ).thenAnswer((_) async => right(testThing));
        when(
          () => mockProgressRepository.getUserExercises(
            userId: testUserId,
            progressId: testId,
          ),
        ).thenAnswer((_) async => right(userExercises));
      },
      build: () => bloc,
      act:
          (bloc) => bloc.add(
            const ThingDetailEvent.getThingDetail(
              id: testId,
              userId: testUserId,
            ),
          ),
      expect:
          () => [
            ThingDetailState.initial().copyWith(
              isLoading: false,
              thing: testThing,
              exercises: userExercises,
              failureOrSuccessOption: none(),
            ),
          ],
      verify: (_) {
        verify(
          () => mockThingDetailRepository.getThingDetail(id: testId),
        ).called(1);
        verify(
          () => mockProgressRepository.getUserExercises(
            userId: testUserId,
            progressId: testId,
          ),
        ).called(1);
      },
    );

    blocTest<ThingDetailBloc, ThingDetailState>(
      'emits [loading, failure] when exercises fetch fails',
      setUp: () {
        when(
          () => mockThingDetailRepository.getThingDetail(id: testId),
        ).thenAnswer((_) async => right(testThing));
        when(
          () => mockProgressRepository.getUserExercises(
            userId: testUserId,
            progressId: testId,
          ),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => bloc,
      act:
          (bloc) => bloc.add(
            const ThingDetailEvent.getThingDetail(
              id: testId,
              userId: testUserId,
            ),
          ),
      expect:
          () => [
            ThingDetailState.initial().copyWith(
              isLoading: false,
              thing: testThing,
              exercises: [],
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockThingDetailRepository.getThingDetail(id: testId),
        ).called(1);
        verify(
          () => mockProgressRepository.getUserExercises(
            userId: testUserId,
            progressId: testId,
          ),
        ).called(1);
      },
    );

    blocTest<ThingDetailBloc, ThingDetailState>(
      'emits only [loading] when getThingDetail fails',
      setUp: () {
        when(
          () => mockThingDetailRepository.getThingDetail(id: testId),
        ).thenAnswer((_) async => Left(apiError));
        when(
          () => mockProgressRepository.getUserExercises(
            userId: testUserId,
            progressId: testId,
          ),
        ).thenAnswer((_) async => right(userExercises));
      },
      build: () => bloc,
      act:
          (bloc) => bloc.add(
            const ThingDetailEvent.getThingDetail(
              id: testId,
              userId: testUserId,
            ),
          ),
      expect: () => [],
      verify: (_) {
        verify(
          () => mockThingDetailRepository.getThingDetail(id: testId),
        ).called(1);
      },
    );
  });
}
