import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/infrastructure/datasource/word_selection_detail_remote.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/insfrastructure/dto/word_selection_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/common_mocks.dart';

void main() {
  late MockFirestoreService mockFirestoreService;
  late WordSelectionDetailRemoteDataSource dataSource;

  setUp(() {
    mockFirestoreService = MockFirestoreService();
    dataSource = WordSelectionDetailRemoteDataSource(
      firestoreService: mockFirestoreService,
    );
  });

  group('WordSelectionDetailRemoteDataSource Tests', () {
    test(
      'getWordSelectionDetail should return a WordSelection object',
      () async {
        const numberId = 'id1';
        final mockData = {
          'id': 'id1',
          'question': 'test question?',
          'choices': ['A', 'B', 'C', 'D'],
          'answer': 'A',
        };
        when(
          () => mockFirestoreService.getDocumentInCollection(
            collection: 'wordSelections',
            document: 'id1',
            subCollection: 'exercises',
          ),
        ).thenAnswer((_) async => mockData);
        final expectedWordSelection =
            WordSelectionDto.fromJson(mockData).toDomain;
        final result = await dataSource.getWordSelectionDetail(id: numberId);
        expect(result, equals(expectedWordSelection));
        verify(
          () => mockFirestoreService.getDocumentInCollection(
            collection: 'wordSelections',
            document: numberId,
            subCollection: 'exercises',
          ),
        ).called(1);
      },
    );
  });
}
