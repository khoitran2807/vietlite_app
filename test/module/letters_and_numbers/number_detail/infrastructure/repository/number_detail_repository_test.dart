import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/infrastructure/repository/letter_detail_repository.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late NumberDetailRepository numberDetailRepository;
  late MockNumberDetailRemoteDataSource remoteDataSource;

  setUp(() {
    remoteDataSource = MockNumberDetailRemoteDataSource();
    numberDetailRepository = NumberDetailRepository(
      remoteDataSource: remoteDataSource,
    );
  });

  group('Number Detail Repository Test', () {
    final mockNumber = Number.empty().copyWith(id: 'id1', title: 'A');
    test('should return Letter when remoteDataSource succeeds', () async {
      when(
        () => remoteDataSource.getNumberDetail(id: 'id1'),
      ).thenAnswer((_) async => mockNumber);
      final result = await numberDetailRepository.getNumberDetail(id: 'id1');
      expect(result, Right(mockNumber));
      verify(() => remoteDataSource.getNumberDetail(id: 'id1')).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });

    test(
      'should return AppFailure when remoteDataSource throws an error',
      () async {
        // Arrange
        when(
          () => remoteDataSource.getNumberDetail(id: 'id1'),
        ).thenThrow(Exception());

        // Act
        final result = await numberDetailRepository.getNumberDetail(id: 'id1');

        // Assert
        expect(result, isA<Left<AppFailure, Number>>());
        verify(() => remoteDataSource.getNumberDetail(id: 'id1')).called(1);
      },
    );
  });
}
