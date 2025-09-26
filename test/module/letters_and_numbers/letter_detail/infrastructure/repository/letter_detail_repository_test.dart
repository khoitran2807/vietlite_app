import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/infrastructure/repository/letter_detail_repository.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late LetterDetailRepository letterDetailRepository;
  late MockLetterDetailRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockLetterDetailRemoteDataSource();
    letterDetailRepository = LetterDetailRepository(
      remoteDataSource: remoteDataSource,
    );
  });

  group('Letter Detail Repository Test', () {
    final mockLetter = Letter.empty().copyWith(id: 'id1', title: 'A');
    test('should return Letter when remoteDataSource succeeds', () async {
      when(
        () => remoteDataSource.getLetterDetail(id: 'id1'),
      ).thenAnswer((_) async => mockLetter);
      final result = await letterDetailRepository.getLetterDetail(id: 'id1');
      expect(result, Right(mockLetter));
      verify(() => remoteDataSource.getLetterDetail(id: 'id1')).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => remoteDataSource.getLetterDetail(id: 'id1'),
        ).thenThrow(Exception());

        // Act
        final result = await letterDetailRepository.getLetterDetail(id: 'id1');

        // Assert
        expect(result, isA<Left<AppFailure, Letter>>());
        verify(() => remoteDataSource.getLetterDetail(id: 'id1')).called(1);
      },
    );
  });
}
