import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/infrastructure/repository/word_match_detail_repository.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../utils/common_mocks.dart';

void main() {
  late WordMatchDetailRepository repository;
  late MockWordMatchDetailRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockWordMatchDetailRemoteDataSource();
    repository = WordMatchDetailRepository(remoteDataSource: remoteDataSource);
  });

  group('Word Match Detail Repository Test', () {
    final mockWordMatch = WordMatch.empty().copyWith(id: 'id1', title: 'A');
    test('should return Letter when remoteDataSource succeeds', () async {
      when(
        () => remoteDataSource.getWordMatchDetail(id: 'id1'),
      ).thenAnswer((_) async => mockWordMatch);
      final result = await repository.getWordMatchDetail(id: 'id1');
      expect(result, Right(mockWordMatch));
      verify(() => remoteDataSource.getWordMatchDetail(id: 'id1')).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => remoteDataSource.getWordMatchDetail(id: 'id1'),
        ).thenThrow(Exception());

        // Act
        final result = await repository.getWordMatchDetail(id: 'id1');

        // Assert
        expect(result, isA<Left<AppFailure, WordMatch>>());
        verify(() => remoteDataSource.getWordMatchDetail(id: 'id1')).called(1);
      },
    );
  });
}
