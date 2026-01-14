import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/things/infrastructure/repository/things_repository.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late MockThingsRemoteDataSource mockRemoteDataSource;
  late ThingsRepository repository;

  setUp(() {
    mockRemoteDataSource = MockThingsRemoteDataSource();
    repository = ThingsRepository(remoteDataSource: mockRemoteDataSource);
  });

  group('ThingsRepository.getThings', () {
    const thingType = ThingType.vehicle;
    final mockThings = [
      const Thing(
        id: '1',
        name: 'Xe máy',
        audio: 'audio_url',
        examples: [],
        order: 1,
        type: ThingType.vehicle,
        image: 'xemay.',
        exercises: [],
        totalExercises: 2,
      ),
    ];

    test('should return list of Thing on success', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.getThings(thingType),
      ).thenAnswer((_) async => mockThings);

      // Act
      final result = await repository.getThings(type: thingType);

      // Assert
      expect(result, Right(mockThings));
      verify(() => mockRemoteDataSource.getThings(thingType)).called(1);
    });

    test('should return AppFailure on exception', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.getThings(thingType),
      ).thenThrow(Exception('error'));

      // Act
      final result = await repository.getThings(type: thingType);

      // Assert
      expect(result.isLeft(), true);
      expect(result.fold((l) => l, (_) => null), isA<AppFailure>());
      verify(() => mockRemoteDataSource.getThings(thingType)).called(1);
    });
  });
}
