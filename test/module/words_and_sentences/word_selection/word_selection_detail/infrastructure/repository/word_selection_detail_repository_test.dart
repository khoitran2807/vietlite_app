import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/infrastructure/repository/word_selection_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/common_mocks.dart';

void main() {
  late WordSelectionDetailRepository repository;
  late MockWordSelectionDetailRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockWordSelectionDetailRemoteDataSource();
    repository = WordSelectionDetailRepository(
      remoteDataSource: remoteDataSource,
    );
  });

  group('Word Selection Detail Repository Test', () {
    final mockWordSelection = WordSelection.empty().copyWith(
      id: 'id1',
      title: 'A',
    );
    test('should return Letter when remoteDataSource succeeds', () async {
      when(
        () => remoteDataSource.getWordSelectionDetail(id: 'id1'),
      ).thenAnswer((_) async => mockWordSelection);
      final result = await repository.getWordSelectionDetail(id: 'id1');
      expect(result, Right(mockWordSelection));
      verify(
        () => remoteDataSource.getWordSelectionDetail(id: 'id1'),
      ).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => remoteDataSource.getWordSelectionDetail(id: 'id1'),
        ).thenThrow(Exception());

        // Act
        final result = await repository.getWordSelectionDetail(id: 'id1');

        // Assert
        expect(result, isA<Left<AppFailure, WordSelection>>());
        verify(
          () => remoteDataSource.getWordSelectionDetail(id: 'id1'),
        ).called(1);
      },
    );
  });
}
