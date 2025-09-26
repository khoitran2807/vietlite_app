import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/user/login/infrastructure/datasource/login_remote.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late LoginRemoteDataSource remoteDataSource;
  late MockAuthService mockAuthService;
  late MockUser mockUser;

  setUp(() {
    mockAuthService = MockAuthService();
    remoteDataSource = LoginRemoteDataSource(authService: mockAuthService);
    mockUser = MockUser();
  });

  group('LoginRemoteDataSource', () {
    test(
      'calls signInAnonymously on authService when anonymousSignIn is invoked',
      () async {
        // Arrange
        when(
          () => mockAuthService.signInAnonymously(),
        ).thenAnswer((_) async => mockUser);

        // Act
        await remoteDataSource.anonymousSignIn();

        // Assert
        verify(() => mockAuthService.signInAnonymously()).called(1);
      },
    );

    test(
      'calls signInWithEmailAndPassword on authService with correct email and password',
      () async {
        // Arrange
        const testEmail = 'test@example.com';
        const testPassword = 'password123';

        when(
          () => mockAuthService.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).thenAnswer((_) async => mockUser);

        // Act
        await remoteDataSource.signInWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
        );

        // Assert
        verify(
          () => mockAuthService.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).called(1);
      },
    );
    test(
      'calls signInWithGoogle on authService when signInWithGoogle is invoked',
      () async {
        // Arrange
        when(
          () => mockAuthService.signInWithGoogle(),
        ).thenAnswer((_) async => mockUser);

        // Act
        await remoteDataSource.signInWithGoogle();

        // Assert
        verify(() => mockAuthService.signInWithGoogle()).called(1);
      },
    );
  });
}
