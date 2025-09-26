import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/infrastructure/datasource/word_match_detail_remote.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/infrastructure/dto/word_match_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/common_mocks.dart';

void main() {
  late MockFirestoreService mockFirestoreService;
  late WordMatchDetailRemoteDataSource dataSource;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = WordMatchDetailRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  group('WordMatchDetailRemoteDataSource Tests', () {
    test('getWordMatchDetail should return a WordMatch object', () async {
      const numberId = 'id1';
      final mockData = {
        'id': 'id1',
        'question': 'test question?',
        'choices': ['A', 'B', 'C', 'D'],
        'answer': 'A',
      };
      when(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'wordMatches',
          document: 'id1',
          subCollection: 'exercises',
        ),
      ).thenAnswer((_) async => mockData);
      final expectedWordMatch = WordMatchDto.fromJson(mockData).toDomain;
      final result = await dataSource.getWordMatchDetail(id: numberId);
      expect(result, equals(expectedWordMatch));
      verify(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'wordMatches',
          document: numberId,
          subCollection: 'exercises',
        ),
      ).called(1);
    });
  });
}
