import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:vietlite/module/user/login/infrastructure/repository/login_repository.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late LoginRepository repository;
  late MockLoginRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockLoginRemoteDataSource();
    repository = LoginRepository(remoteDataSource: mockRemoteDataSource);
  });

  group('anonymousSignIn', () {
    test(
      'returns Right(unit) when remoteDataSource.anonymousSignIn succeeds',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.anonymousSignIn(),
        ).thenAnswer((_) async {});

        // Act
        final result = await repository.anonymousSignIn();

        // Assert
        expect(result, const Right(unit));
        verify(() => mockRemoteDataSource.anonymousSignIn()).called(1);
      },
    );

    test(
      'returns Left(AppFailure) when remoteDataSource.anonymousSignIn throws an exception',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.anonymousSignIn(),
        ).thenThrow(Exception(''));

        // Act
        final result = await repository.anonymousSignIn();

        // Assert
        expect(result.isLeft(), true);
        verify(() => mockRemoteDataSource.anonymousSignIn()).called(1);
      },
    );
  });

  group('signInWithEmailAndPassword', () {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';

    test(
      'returns Right(unit) when remoteDataSource.signInWithEmailAndPassword succeeds',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).thenAnswer((_) async {});

        // Act
        final result = await repository.signInWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        );

        // Assert
        expect(result, const Right(unit));
        verify(
          () => mockRemoteDataSource.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).called(1);
      },
    );

    test(
      'returns Left(AppFailure) when remoteDataSource.signInWithEmailAndPassword throws an exception',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).thenThrow(Exception());

        // Act
        final result = await repository.signInWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        );

        // Assert
        expect(result.isLeft(), true);
        verify(
          () => mockRemoteDataSource.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).called(1);
      },
    );
  });
  group('signInWithGoogle', () {
    test(
      'returns Right(unit) when remoteDataSource.signInWithGoogle succeeds',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.signInWithGoogle(),
        ).thenAnswer((_) async {});

        // Act
        final result = await repository.signInWithGoogle();

        // Assert
        expect(result, const Right(unit));
        verify(() => mockRemoteDataSource.signInWithGoogle()).called(1);
      },
    );

    test(
      'returns Left(AppFailure) when remoteDataSource.signInWithGoogle throws an exception',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.signInWithGoogle(),
        ).thenThrow(Exception('error'));

        // Act
        final result = await repository.signInWithGoogle();

        // Assert
        expect(result.isLeft(), true);
        verify(() => mockRemoteDataSource.signInWithGoogle()).called(1);
      },
    );
  });
}
