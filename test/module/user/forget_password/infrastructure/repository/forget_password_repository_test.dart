import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/user/forget_password/infrastructure/repository/forget_password_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late ForgetPasswordRepository repository;
  late MockForgetPasswordRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockForgetPasswordRemoteDataSource();
    repository = ForgetPasswordRepository(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('forgetPassword', () {
    const testEmail = 'test@gmail.com';

    test(
      'returns Right(unit) when remoteDataSource.forgetPassword succeeds',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.forgetPassword(email: testEmail),
        ).thenAnswer((_) async {});

        // Act
        final result = await repository.forgetPassword(email: testEmail);

        // Assert
        expect(result, const Right(unit));
        verify(
          () => mockRemoteDataSource.forgetPassword(email: testEmail),
        ).called(1);
      },
    );

    test(
      'returns Left(AppFailure) when remoteDataSource.forgetPassword throws an exception',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.forgetPassword(email: testEmail),
        ).thenThrow(Exception('Some error'));

        // Act
        final result = await repository.forgetPassword(email: testEmail);

        // Assert
        expect(result.isLeft(), true);
        verify(
          () => mockRemoteDataSource.forgetPassword(email: testEmail),
        ).called(1);
      },
    );
  });
}
