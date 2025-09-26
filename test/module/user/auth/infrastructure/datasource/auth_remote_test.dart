import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/user/auth/infrastructure/datasource/auth_remote.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../utils/common_mocks.dart';

class MockUser extends Mock implements User {}

void main() {
  late AuthRemoteDataSource authRemoteDataSource;
  late MockAuthService mockAuthService;
  late MockFirestoreService mockFirestoreService;
  late MockUser mockUser;

  setUp(() {
    mockAuthService = MockAuthService();
    mockFirestoreService = MockFirestoreService();
    authRemoteDataSource = AuthRemoteDataSource(
      authService: mockAuthService,
      firestoreService: mockFirestoreService,
    );
    mockUser = MockUser();
  });

  group('userChanges', () {
    test('emits AppUser when a non-null user is returned', () {
      // Arrange
      when(() => mockUser.uid).thenReturn('Test id');
      when(() => mockUser.displayName).thenReturn('Test User');
      when(() => mockUser.email).thenReturn('test@example.com');
      when(() => mockUser.photoURL).thenReturn('avatar_url');
      when(() => mockUser.isAnonymous).thenReturn(false);

      when(
        () => mockAuthService.userChanges(),
      ).thenAnswer((_) => Stream.value(mockUser));

      // Act
      final stream = authRemoteDataSource.userChanges();

      // Assert
      expect(
        stream,
        emits(
          const AppUser(
            id: 'Test id',
            email: 'test@example.com',
            name: 'Test User',
            avatar: 'avatar_url',
            isAnonymous: false,
          ),
        ),
      );
      verify(() => mockAuthService.userChanges()).called(1);
    });

    test('emits AppUser.empty when null user is returned', () {
      // Arrange
      when(
        () => mockAuthService.userChanges(),
      ).thenAnswer((_) => Stream.value(null));

      // Act
      final stream = authRemoteDataSource.userChanges();

      // Assert
      expect(stream, emits(AppUser.empty()));
      verify(() => mockAuthService.userChanges()).called(1);
    });
  });

  group('signOut', () {
    test('calls authService.signOut', () async {
      // Arrange
      when(() => mockAuthService.signOut()).thenAnswer((_) async {});

      // Act
      await authRemoteDataSource.signOut();

      // Assert
      verify(() => mockAuthService.signOut()).called(1);
    });
  });
  group('upsertUser', () {
    test('calls firestoreService.upsertUser with correct parameters', () async {
      const appUser = AppUser(
        id: 'testId',
        email: 'test@example.com',
        name: 'Test User',
        avatar: 'avatar_url',
        isAnonymous: false,
      );

      when(
        () => mockFirestoreService.upsertUser(
          userId: any(named: 'userId'),
          userData: any(named: 'userData'),
        ),
      ).thenAnswer((_) async {});

      await authRemoteDataSource.upsertUser(appUser: appUser);

      verify(
        () => mockFirestoreService.upsertUser(
          userId: appUser.id,
          userData: appUser.toJson(),
        ),
      ).called(1);
    });
  });
  group('changePassword', () {
    const currentPassword = 'oldPassword';
    const newPassword = 'newPassword123';

    test('calls authService.changePassword with correct parameters', () async {
      // Arrange
      when(
        () => mockAuthService.changePassword(
          currentPassword: any(named: 'currentPassword'),
          newPassword: any(named: 'newPassword'),
        ),
      ).thenAnswer((_) async {});

      // Act
      await authRemoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      // Assert
      verify(
        () => mockAuthService.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ),
      ).called(1);
    });

    test('throws when authService.changePassword throws', () async {
      // Arrange
      when(
        () => mockAuthService.changePassword(
          currentPassword: any(named: 'currentPassword'),
          newPassword: any(named: 'newPassword'),
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: 'wrong-password',
          message: 'Incorrect password',
        ),
      );

      // Act & Assert
      expect(
        () => authRemoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ),
        throwsA(isA<FirebaseAuthException>()),
      );

      verify(
        () => mockAuthService.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ),
      ).called(1);
    });
  });
  group('getPremiumConfig', () {
    const testUserId = 'user123';

    test('returns empty PremiumConfig when data is empty', () async {
      // Arrange
      when(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'users',
          document: testUserId,
        ),
      ).thenAnswer((_) async => {});

      // Act
      final result = await authRemoteDataSource.getPremiumConfig(
        userId: testUserId,
      );

      // Assert
      expect(result, PremiumConfig.empty());
      verify(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'users',
          document: testUserId,
        ),
      ).called(1);
    });

    test(
      'returns empty PremiumConfig when data does not contain "premium" key',
      () async {
        // Arrange
        when(
          () => mockFirestoreService.getDocumentInCollection(
            collection: 'users',
            document: testUserId,
          ),
        ).thenAnswer((_) async => {'name': 'Test User'});

        // Act
        final result = await authRemoteDataSource.getPremiumConfig(
          userId: testUserId,
        );

        // Assert
        expect(result, PremiumConfig.empty());
        verify(
          () => mockFirestoreService.getDocumentInCollection(
            collection: 'users',
            document: testUserId,
          ),
        ).called(1);
      },
    );

    test('returns PremiumConfig from JSON when "premium" key exists', () async {
      // Arrange
      final premiumJson = {'level': 'gold', 'expiryDate': '2025-12-31'};
      when(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'users',
          document: testUserId,
        ),
      ).thenAnswer((_) async => {'premium': premiumJson});

      // Act
      final result = await authRemoteDataSource.getPremiumConfig(
        userId: testUserId,
      );

      // Assert
      expect(result, PremiumConfig.fromJson(premiumJson));
      verify(
        () => mockFirestoreService.getDocumentInCollection(
          collection: 'users',
          document: testUserId,
        ),
      ).called(1);
    });
  });
}
