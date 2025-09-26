import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/thing_detail/infrastructure/repository/thing_detail_repository.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late ThingDetailRepository thingDetailRepository;
  late MockThingDetailRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockThingDetailRemoteDataSource();
    thingDetailRepository = ThingDetailRepository(
      remoteDataSource: remoteDataSource,
    );
  });

  group('Thing Detail Repository Test', () {
    final mockThing = Thing.empty().copyWith(
      id: 'id1',
      name: 'do',
      order: 1,
      type: ThingType.color,
    );
    test('should return Thing when remoteDataSource succeeds', () async {
      when(
        () => remoteDataSource.getThingDetail(id: 'id1'),
      ).thenAnswer((_) async => mockThing);
      final result = await thingDetailRepository.getThingDetail(id: 'id1');
      expect(result, Right(mockThing));
      verify(() => remoteDataSource.getThingDetail(id: 'id1')).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => remoteDataSource.getThingDetail(id: 'id1'),
        ).thenThrow(Exception());

        // Act
        final result = await thingDetailRepository.getThingDetail(id: 'id1');

        // Assert
        expect(result, isA<Left<AppFailure, Thing>>());
        verify(() => remoteDataSource.getThingDetail(id: 'id1')).called(1);
      },
    );
  });
}
