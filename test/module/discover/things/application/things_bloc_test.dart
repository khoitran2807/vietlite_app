import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/application/things_bloc.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late ThingsBloc thingsBloc;
  late MockThingsRepository mockThingsRepository;
  late AppFailure apiError;

  setUp(() {
    mockThingsRepository = MockThingsRepository();
    thingsBloc = ThingsBloc(repository: mockThingsRepository);
    apiError = AppFailure.otherError(message: 'error happend');
  });

  group('getThings', () {
    final mockThings = [
      Thing.empty().copyWith(
        id: '1',
        name: 'do',
        order: 1,
        type: ThingType.color,
      ),
      Thing.empty().copyWith(
        id: '2',
        name: 'xanh',
        order: 2,
        type: ThingType.color,
      ),
    ];
    blocTest<ThingsBloc, ThingsState>(
      'should emit [loading, success] when getThings succeeds',
      setUp: () {
        when(
          () => mockThingsRepository.getThings(type: ThingType.color),
        ).thenAnswer((_) async => Right(mockThings));
      },
      build: () => thingsBloc,
      act:
          (bloc) =>
              bloc.add(const ThingsEvent.getThings(type: ThingType.color)),
      expect:
          () => [
            ThingsState.initial().copyWith(
              isLoading: true,
              failureOrSuccessOption: none(),
            ),
            ThingsState.initial().copyWith(
              things: mockThings,
              isLoading: false,
              failureOrSuccessOption: some(Right(mockThings)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockThingsRepository.getThings(type: ThingType.color),
        ).called(1);
      },
    );

    blocTest<ThingsBloc, ThingsState>(
      'should emit [loading, failure] when getThings fails',
      setUp: () {
        when(
          () => mockThingsRepository.getThings(type: ThingType.color),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => thingsBloc,
      act:
          (bloc) =>
              bloc.add(const ThingsEvent.getThings(type: ThingType.color)),
      expect:
          () => [
            ThingsState.initial().copyWith(
              isLoading: true,
              failureOrSuccessOption: none(),
            ),
            ThingsState.initial().copyWith(
              isLoading: false,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockThingsRepository.getThings(type: ThingType.color),
        ).called(1);
      },
    );
  });
}
