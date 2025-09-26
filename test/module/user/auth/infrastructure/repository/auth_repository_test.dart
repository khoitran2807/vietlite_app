import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/user/auth/infrastructure/repository/auth_repository.dart';
import '../../../../../utils/common_mocks.dart';

void main() {
  late AuthRepository authRepository;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    authRepository = AuthRepository(remoteDataSource: mockRemoteDataSource);
  });

  group('signOut', () {
    test('returns Right(Unit) when signOut succeeds', () async {
      // Arrange
      when(() => mockRemoteDataSource.signOut()).thenAnswer((_) async {});

      // Act
      final result = await authRepository.signOut();

      // Assert
      expect(result, const Right(unit));
      verify(() => mockRemoteDataSource.signOut()).called(1);
    });

    test('returns Left(AppFailure) when signOut throws an exception', () async {
      // Arrange
      when(() => mockRemoteDataSource.signOut()).thenThrow(Exception());

      // Act
      final result = await authRepository.signOut();

      // Assert
      expect(result.isLeft(), true);
      verify(() => mockRemoteDataSource.signOut()).called(1);
    });

    test(
      'verify error message when signOut throws an Firebase Exception',
      () async {
        // Arrange
        when(() => mockRemoteDataSource.signOut()).thenThrow(
          FirebaseException(
            plugin: 'FirebaseAuth',
            message: 'Failed to sign out',
          ),
        );

        // Act
        final result = await authRepository.signOut();

        // Assert
        expect(result.isLeft(), true);
        result.fold((failure) {
          expect(failure.message, 'Failed to sign out');
        }, (_) {});
        verify(() => mockRemoteDataSource.signOut()).called(1);
      },
    );
  });

  group('userChanges', () {
    test('forwards stream from remoteDataSource', () {
      // Arrange
      final userStream = Stream.value(AppUser.empty());
      when(
        () => mockRemoteDataSource.userChanges(),
      ).thenAnswer((_) => userStream);

      // Act
      final resultStream = authRepository.userChanges();

      // Assert
      expect(resultStream, emits(AppUser.empty()));
      verify(() => mockRemoteDataSource.userChanges()).called(1);
    });
  });

  group('upsertUser', () {
    final testUser = AppUser.empty().copyWith(
      id: '123',
      email: 'test@example.com',
    );

    test('returns Right(Unit) when upsertUser succeeds', () async {
      when(
        () => mockRemoteDataSource.upsertUser(appUser: testUser),
      ).thenAnswer((_) async {});
      final result = await authRepository.upsertUser(appUser: testUser);
      expect(result, const Right(unit));
      verify(
        () => mockRemoteDataSource.upsertUser(appUser: testUser),
      ).called(1);
    });

    test('returns Left(AppFailure) when upsertUser fails', () async {
      when(
        () => mockRemoteDataSource.upsertUser(appUser: testUser),
      ).thenThrow(Exception());
      final result = await authRepository.upsertUser(appUser: testUser);
      expect(result.isLeft(), true);
      verify(
        () => mockRemoteDataSource.upsertUser(appUser: testUser),
      ).called(1);
    });

    test(
      'verify error message when upsertUser throws a FirebaseException',
      () async {
        when(
          () => mockRemoteDataSource.upsertUser(appUser: testUser),
        ).thenThrow(
          FirebaseException(
            plugin: 'FirebaseAuth',
            message: 'Failed to update user',
          ),
        );
        final result = await authRepository.upsertUser(appUser: testUser);
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure.message, 'Failed to update user'),
          (_) {},
        );
        verify(
          () => mockRemoteDataSource.upsertUser(appUser: testUser),
        ).called(1);
      },
    );
  });
  group('changePassword', () {
    const currentPassword = 'oldPassword';
    const newPassword = 'newPassword123';

    test('returns Right(Unit) when changePassword succeeds', () async {
      // Arrange
      when(
        () => mockRemoteDataSource.changePassword(
          currentPassword: any(named: 'currentPassword'),
          newPassword: any(named: 'newPassword'),
        ),
      ).thenAnswer((_) async {});

      // Act
      final result = await authRepository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      // Assert
      expect(result, const Right(unit));
      verify(
        () => mockRemoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ),
      ).called(1);
    });

    test(
      'returns Left(AppFailure) when changePassword throws a generic exception',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.changePassword(
            currentPassword: any(named: 'currentPassword'),
            newPassword: any(named: 'newPassword'),
          ),
        ).thenThrow(Exception('Unexpected error'));

        // Act
        final result = await authRepository.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        // Assert
        expect(result.isLeft(), true);
        verify(
          () => mockRemoteDataSource.changePassword(
            currentPassword: currentPassword,
            newPassword: newPassword,
          ),
        ).called(1);
      },
    );

    test(
      'returns Left(AppFailure) when changePassword throws FirebaseException',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.changePassword(
            currentPassword: any(named: 'currentPassword'),
            newPassword: any(named: 'newPassword'),
          ),
        ).thenThrow(
          FirebaseException(
            plugin: 'FirebaseAuth',
            message: 'Failed to change password',
          ),
        );

        // Act
        final result = await authRepository.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        // Assert
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure.message, 'Failed to change password'),
          (_) {},
        );
        verify(
          () => mockRemoteDataSource.changePassword(
            currentPassword: currentPassword,
            newPassword: newPassword,
          ),
        ).called(1);
      },
    );
  });

  group('getPremiumConfig', () {
    const testUserId = 'user123';
    const mockPremiumConfig = PremiumConfig(
      wordSelection: true,
      wordMatch: true,
      things: false,
    );
    test(
      'returns Right(PremiumConfig) when remoteDataSource succeeds',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.getPremiumConfig(userId: testUserId),
        ).thenAnswer((_) async => mockPremiumConfig);

        // Act
        final result = await authRepository.getPremiumConfig(
          userId: testUserId,
        );

        // Assert
        expect(result, const Right(mockPremiumConfig));
        verify(
          () => mockRemoteDataSource.getPremiumConfig(userId: testUserId),
        ).called(1);
      },
    );

    test(
      'returns Left(AppFailure) when remoteDataSource throws an exception',
      () async {
        // Arrange
        when(
          () => mockRemoteDataSource.getPremiumConfig(userId: testUserId),
        ).thenThrow(Exception('Unexpected error'));

        // Act
        final result = await authRepository.getPremiumConfig(
          userId: testUserId,
        );

        // Assert
        expect(result.isLeft(), true);
        verify(
          () => mockRemoteDataSource.getPremiumConfig(userId: testUserId),
        ).called(1);
      },
    );
  });
}
