import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/discover/things/infrastructure/datasource/things_remote.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import '../../../../../utils/common_mocks.dart';

void main() {
  late ThingsRemoteDataSource dataSource;
  late MockFirestoreService mockFirestoreService;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = ThingsRemoteDataSource(firestoreService: mockFirestoreService);
  });

  group('ThingsRemoteDataSource.getThings', () {
    test('returns a list of Thing from Firestore data', () async {
      // Arrange
      final thingJson = {
        'id': '1',
        'name': 'Apple',
        'audio': 'audio_url',
        'examples': [],
        'order': 1,
        'type': 'color',
      };

      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'things',
          filterKey: 'type',
          filterValue: ThingType.color.name,
          orderBy: 'order',
        ),
      ).thenAnswer((_) async => [thingJson]);

      // Act
      final result = await dataSource.getThings(ThingType.color);

      // Assert
      expect(result, isA<List<Thing>>());
      expect(result.first.id, '1');
      expect(result.first.name, 'Apple');
    });

    test('returns empty list when Firestore returns no documents', () async {
      when(
        () => mockFirestoreService.getDocumentsInCollection(
          collection: 'things',
          filterKey: 'type',
          filterValue: ThingType.vehicle.name,
          orderBy: 'order',
        ),
      ).thenAnswer((_) async => []);

      final result = await dataSource.getThings(ThingType.vehicle);

      expect(result, isEmpty);
    });
  });
}
