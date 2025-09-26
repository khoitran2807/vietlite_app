import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/discover/thing_detail/infrastructure/datasource/thing_detail_remote.dart';
import 'package:vietlite/module/discover/things/infrastructure/dto/thing_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late ThingDetailRemoteDataSource dataSource;
  late MockFirestoreService mockFirestoreService;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = ThingDetailRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  const testId = '123';

  final mockData = {
    'id': '123',
    'name': 'do',
    'examples': [
      {'title': 'do1', 'image': 'do1.png', 'audio': 'audio_url'},
      {'title': 'do2', 'image': 'do2.png', 'audio': 'audio_url'},
      {'title': 'do3', 'image': 'do3.png', 'audio': 'audio_url'},
    ],
  };

  final expectedThing = ThingDto.fromJson(mockData).toDomain;

  group('ThingDetailRemoteDataSource', () {
    test(
      'should return Thing when firestoreService returns valid data',
      () async {
        // arrange
        when(
          () => mockFirestoreService.getDocumentInCollection(
            collection: 'things',
            document: testId,
            subCollection: 'exercises',
          ),
        ).thenAnswer((_) async => mockData);

        // act
        final result = await dataSource.getThingDetail(id: testId);

        // assert
        expect(result, expectedThing);
        verify(
          () => mockFirestoreService.getDocumentInCollection(
            collection: 'things',
            document: testId,
            subCollection: 'exercises',
          ),
        ).called(1);
      },
    );

    test('should throw when firestoreService throws', () async {
      // arrange
      when(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'things',
          document: testId,
          subCollection: 'exercises',
        ),
      ).thenThrow(Exception('Firestore error'));

      // act
      expect(() => dataSource.getThingDetail(id: testId), throwsException);

      // assert
      verify(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'things',
          document: testId,
          subCollection: 'exercises',
        ),
      ).called(1);
    });
  });
}
