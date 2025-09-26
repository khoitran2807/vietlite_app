import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/user/register/infrastructure/repository/register_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late RegisterRepository repository;
  late MockRegisterRemoteDataSource mockRegisterRemoteDataSource;

  setUp(() {
    mockRegisterRemoteDataSource = MockRegisterRemoteDataSource();
    repository = RegisterRepository(
      remoteDataSource: mockRegisterRemoteDataSource,
    );
  });

  group('registerWithEmailAndPassword', () {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    const testName = 'abc';
    test(
      'returns Right(unit) when remoteDataSource.registerWithEmailAndPassword succeeds',
      () async {
        // Arrange
        when(
          () => mockRegisterRemoteDataSource.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).thenAnswer((_) async {});

        // Act
        final result = await repository.registerWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
          name: testName,
        );

        // Assert
        expect(result, const Right(unit));
        verify(
          () => mockRegisterRemoteDataSource.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).called(1);
      },
    );

    test(
      'returns Left(AppFailure) when remoteDataSource.registerWithEmailAndPassword throws an exception',
      () async {
        // Arrange
        when(
          () => mockRegisterRemoteDataSource.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).thenThrow(Exception());

        // Act
        final result = await repository.registerWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
          name: testName,
        );

        // Assert
        expect(result.isLeft(), true);
        verify(
          () => mockRegisterRemoteDataSource.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).called(1);
      },
    );
  });
}
