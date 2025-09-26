import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/infrastructure/datasource/letter_detail_remote.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/dto/letter_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late MockFirestoreService mockFirestoreService;
  late LetterDetailRemoteDataSource dataSource;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = LetterDetailRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  group('LetterDetailRemoteDataSource Tests', () {
    test('getLetterDetail should return a Letter object', () async {
      const letterId = 'id1';
      final mockData = {
        'id': 'id1',
        'title': 'A',
        'mainExample': {
          'title': 'Apple',
          'image': 'apple.png',
          'audio': 'audio_url',
        },
        'examples': [
          {'title': 'apple', 'image': 'avatar1.png', 'audio': 'audio_url'},
          {'title': 'vvv', 'image': 'image1.png', 'audio': 'audio_url'},
        ],
      };
      when(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'letters',
          document: 'id1',
        ),
      ).thenAnswer((_) async => mockData);
      final expectedLetter = LetterDto.fromJson(mockData).toDomain;
      final result = await dataSource.getLetterDetail(id: letterId);
      expect(result, equals(expectedLetter));
      verify(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'letters',
          document: letterId,
        ),
      ).called(1);
    });
  });
}
