import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/infrastructure/datasource/number_detail_remote.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/dto/number_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late MockFirestoreService mockFirestoreService;
  late NumberDetailRemoteDataSource dataSource;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = NumberDetailRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  group('LetterDetailRemoteDataSource Tests', () {
    test('getLetterDetail should return a Letter object', () async {
      const numberId = 'id1';
      final mockData = {
        'id': 'id1',
        'title': 'A',
        'examples': [
          {'title': 'apple', 'image': 'avatar1.png', 'audio': 'audio_url'},
          {'title': 'vvv', 'image': 'image1.png', 'audio': 'audio_url'},
        ],
      };
      when(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'numbers',
          document: 'id1',
        ),
      ).thenAnswer((_) async => mockData);
      final expectedLetter = NumberDto.fromJson(mockData).toDomain;
      final result = await dataSource.getNumberDetail(id: numberId);
      expect(result, equals(expectedLetter));
      verify(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'numbers',
          document: numberId,
        ),
      ).called(1);
    });
  });
}
