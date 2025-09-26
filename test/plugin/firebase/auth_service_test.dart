import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/plugin/firebase/auth_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/common_mocks.dart';

void main() {
  late MockFirebaseAuth mockAuth;
  late AuthService authService;
  late MockGoogleService mockGoogleService;

  group('AuthService SignIn anonymous', () {
    late MockUser mockUser;
    late MockUserCredential mockUserCredential;
    setUp(() {
      mockAuth = MockFirebaseAuth();
      mockUser = MockUser();
      mockGoogleService = MockGoogleService();
      mockUserCredential = MockUserCredential();
      when(() => mockAuth.currentUser).thenReturn(mockUser);
      authService = AuthService(
        auth: mockAuth,
        googleService: mockGoogleService,
      );
    });
    test('user getter returns current user from FirebaseAuth', () {
      final user = authService.user;
      expect(user, mockUser);
      verify(() => mockAuth.currentUser).called(1);
    });

    test(
      'signInAnonymously completes successfully and returns the user',
      () async {
        when(
          () => mockAuth.signInAnonymously(),
        ).thenAnswer((_) async => mockUserCredential);

        final result = await authService.signInAnonymously();

        expect(result, mockUser);
        verify(() => mockAuth.signInAnonymously()).called(1);
        verify(() => mockAuth.currentUser).called(1);
      },
    );

    test(
      'signInAnonymously throws FirebaseException on FirebaseAuthException',
      () async {
        when(() => mockAuth.signInAnonymously()).thenThrow(
          FirebaseAuthException(
            message: 'Test error message',
            code: 'test-error',
          ),
        );

        expect(
          () => authService.signInAnonymously(),
          throwsA(
            isA<FirebaseException>()
                .having((e) => e.message, 'message', 'Test error message')
                .having((e) => e.code, 'code', 'test-error'),
          ),
        );

        verify(() => mockAuth.signInAnonymously()).called(1);
      },
    );

    test(
      'signInAnonymously throws FirebaseException on other exceptions',
      () async {
        when(
          () => mockAuth.signInAnonymously(),
        ).thenThrow(Exception('Unexpected error'));

        expect(
          () => authService.signInAnonymously(),
          throwsA(
            isA<FirebaseException>().having(
              (e) => e.message,
              'message',
              'An other error happened',
            ),
          ),
        );

        verify(() => mockAuth.signInAnonymously()).called(1);
      },
    );
  });

  group('AuthService.userChanges', () {
    test('emits user changes correctly', () {
      final mockUser = MockUser();
      final mockUser2 = MockUser();

      // Mock the behavior of userChanges stream
      when(
        () => mockAuth.userChanges(),
      ).thenAnswer((_) => Stream.fromIterable([mockUser, mockUser2, null]));

      final userStream = authService.userChanges();

      expect(
        userStream,
        emitsInOrder([
          mockUser, // First event
          mockUser2, // Second event
          null, // Third event
        ]),
      );

      verify(() => mockAuth.userChanges()).called(1);
    });
  });

  group('AuthService.signOut', () {
    test('calls signOut on FirebaseAuth', () async {
      // Arrange
      when(() => mockAuth.signOut()).thenAnswer((_) async {});
      when(() => mockGoogleService.signOut()).thenAnswer((_) async => null);

      // Act
      await authService.signOut();

      // Assert
      verify(() => mockAuth.signOut()).called(1);
      verify(() => mockGoogleService.signOut()).called(1);
    });

    // test('throws an exception if signOut fails', () async {
    //   // Arrange
    //   when(() => mockAuth.signOut()).thenThrow(Exception('Sign out failed'));
    //
    //   // Act & Assert
    //   expect(
    //     () => authService.signOut(),
    //     throwsA(
    //       isA<Exception>().having(
    //         (e) => e.toString(),
    //         'message',
    //         contains('Sign out failed'),
    //       ),
    //     ),
    //   );
    //
    //   verify(() => mockAuth.signOut()).called(1);
    // });
  });

  group('AuthService.signInWithEmailAndPassword', () {
    late MockUser mockAnonymousUser;
    late MockUser mockNormalUser;
    late MockUserCredential mockUserCredential;
    const email = 'test@example.com';
    const password = 'password123';

    setUp(() {
      mockAuth = MockFirebaseAuth();
      mockAnonymousUser = MockUser();
      mockGoogleService = MockGoogleService();
      mockNormalUser = MockUser();
      mockUserCredential = MockUserCredential();
      authService = AuthService(
        auth: mockAuth,
        googleService: mockGoogleService,
      );

      // Register default behaviors
      when(() => mockAuth.currentUser).thenReturn(mockAnonymousUser);
      when(() => mockAnonymousUser.isAnonymous).thenReturn(true);
      when(() => mockAnonymousUser.uid).thenReturn('anonymous');
      when(() => mockNormalUser.isAnonymous).thenReturn(false);
      when(() => mockNormalUser.uid).thenReturn('normal');
      when(() => mockUserCredential.user).thenReturn(mockNormalUser);

      registerFallbackValue(FakeAuthCredential());
    });

    test('successfully links credential when user is anonymous', () async {
      when(
        () => mockAnonymousUser.linkWithCredential(any()),
      ).thenAnswer((_) async => mockUserCredential);

      await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      verify(() => mockAnonymousUser.linkWithCredential(any())).called(1);
    });

    test('signs in directly for non-anonymous user', () async {
      when(() => mockAuth.currentUser).thenReturn(mockNormalUser);
      when(
        () => mockAuth.signInWithCredential(any()),
      ).thenAnswer((_) async => mockUserCredential);

      final result = await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      expect(result, mockNormalUser);
      verify(() => mockAuth.signInWithCredential(any())).called(1);
    });

    test('throws FirebaseException on FirebaseAuthException', () async {
      when(() => mockAuth.currentUser).thenReturn(mockNormalUser);
      when(() => mockAuth.signInWithCredential(any())).thenThrow(
        FirebaseAuthException(
          code: 'wrong-password',
          message: 'Incorrect password',
        ),
      );

      expect(
        () => authService.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
        throwsA(
          isA<FirebaseException>()
              .having((e) => e.code, 'code', 'wrong-password')
              .having((e) => e.message, 'message', 'Incorrect password'),
        ),
      );
    });

    test('wrongly link credential', () async {
      when(() => mockAnonymousUser.linkWithCredential(any())).thenThrow(
        FirebaseAuthException(code: 'some error', message: 'some message'),
      );

      when(
        () => mockAuth.signInWithCredential(any()),
      ).thenAnswer((_) async => mockUserCredential);

      await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      verify(() => mockAnonymousUser.linkWithCredential(any())).called(1);
      verify(() => mockAuth.signInWithCredential(any())).called(1);
    });
    //
    test('throws FirebaseException on other exceptions', () async {
      when(
        () => mockAnonymousUser.linkWithCredential(any()),
      ).thenThrow(Exception('Unexpected error'));

      expect(
        () => authService.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
        throwsA(
          isA<FirebaseException>().having(
            (e) => e.message,
            'message',
            'An other error happened',
          ),
        ),
      );

      verify(() => mockAnonymousUser.linkWithCredential(any())).called(1);
    });
  });

  group('AuthService forgetPassword', () {
    const email = 'test@example.com';
    test('successfully sends password reset email', () async {
      when(
        () => mockAuth.sendPasswordResetEmail(email: email),
      ).thenAnswer((_) async {});
      await authService.forgetPassword(email);
      verify(() => mockAuth.sendPasswordResetEmail(email: email)).called(1);
    });

    test(
      'throws FirebaseException when FirebaseAuthException is thrown',
      () async {
        // Arrange
        when(() => mockAuth.sendPasswordResetEmail(email: email)).thenThrow(
          FirebaseAuthException(
            message: 'Test error message',
            code: 'test-error',
          ),
        );

        // Act & Assert
        expect(
          () => authService.forgetPassword(email),
          throwsA(
            isA<FirebaseException>()
                .having((e) => e.message, 'message', 'Test error message')
                .having((e) => e.code, 'code', 'test-error'),
          ),
        );

        verify(() => mockAuth.sendPasswordResetEmail(email: email)).called(1);
      },
    );
    test('throws FirebaseException on unexpected exceptions', () async {
      // Arrange
      when(
        () => mockAuth.sendPasswordResetEmail(email: email),
      ).thenThrow(Exception('Unexpected error'));
      // Act & Assert
      expect(
        () => authService.forgetPassword(email),
        throwsA(
          isA<FirebaseException>()
              .having(
                (e) => e.message,
                'message',
                'An unexpected error occurred',
              )
              .having((e) => e.plugin, 'plugin', 'FirebaseAuth'),
        ),
      );
      verify(() => mockAuth.sendPasswordResetEmail(email: email)).called(1);
    });
  });

  group('AuthService.registerWithEmailAndPassword', () {
    const email = 'test@gmail.com';
    const password = '123456';
    const name = 'name';
    late MockUserCredential mockUserCredential;
    late MockUser mockUser;

    setUp(() {
      mockAuth = MockFirebaseAuth();
      mockUserCredential = MockUserCredential();
      mockUser = MockUser();
      mockGoogleService = MockGoogleService();
      authService = AuthService(
        auth: mockAuth,
        googleService: mockGoogleService,
      );
      when(() => mockUserCredential.user).thenReturn(mockUser);
      when(() => mockUser.updateDisplayName(name)).thenAnswer((_) async {});
    });
    test('successfully creates a new user', () async {
      when(
        () => mockAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenAnswer((_) async => mockUserCredential);

      final result = await authService.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      expect(result, mockUser);
      verify(
        () => mockAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
    });

    test('throws FirebaseException on FirebaseAuthException', () async {
      when(
        () => mockAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenThrow(
        FirebaseAuthException(
          code: 'email-already-in-use',
          message: 'The email address is already in use',
        ),
      );
      expect(
        () => authService.registerWithEmailAndPassword(
          email: email,
          password: password,
          name: name,
        ),
        throwsA(
          isA<FirebaseException>()
              .having((e) => e.code, 'code', 'email-already-in-use')
              .having(
                (e) => e.message,
                'message',
                'The email address is already in use',
              ),
        ),
      );
      verify(
        () => mockAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
    });

    test('throws FirebaseException on unexpected exceptions', () async {
      when(
        () => mockAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).thenThrow(Exception('Unexpected error'));
      expect(
        () => authService.registerWithEmailAndPassword(
          email: email,
          password: password,
          name: name,
        ),
        throwsA(
          isA<FirebaseException>()
              .having(
                (e) => e.message,
                'message',
                'An unexpected error occurred',
              )
              .having((e) => e.plugin, 'plugin', 'FirebaseAuth'),
        ),
      );

      verify(
        () => mockAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      ).called(1);
    });
  });
  group('AuthService.changePassword', () {
    late MockUser mockUser;

    setUp(() {
      mockAuth = MockFirebaseAuth();
      mockGoogleService = MockGoogleService();
      authService = AuthService(
        auth: mockAuth,
        googleService: mockGoogleService,
      );
      mockUser = MockUser();

      when(() => mockAuth.currentUser).thenReturn(mockUser);
      when(() => mockUser.email).thenReturn('test@example.com');
      registerFallbackValue(FakeAuthCredential());
    });

    test('successfully changes password', () async {
      when(
        () => mockUser.reauthenticateWithCredential(any()),
      ).thenAnswer((_) async => MockUserCredential());
      when(() => mockUser.updatePassword(any())).thenAnswer((_) async {});

      await authService.changePassword(
        currentPassword: 'oldPass123',
        newPassword: 'newPass123',
      );

      verify(() => mockUser.reauthenticateWithCredential(any())).called(1);
      verify(() => mockUser.updatePassword('newPass123')).called(1);
    });

    test(
      'throws FirebaseException when FirebaseAuthException occurs',
      () async {
        when(() => mockUser.reauthenticateWithCredential(any())).thenThrow(
          FirebaseAuthException(
            code: 'wrong-password',
            message: 'Incorrect password',
          ),
        );

        expect(
          () => authService.changePassword(
            currentPassword: 'oldPass123',
            newPassword: 'newPass123',
          ),
          throwsA(
            isA<FirebaseException>()
                .having((e) => e.code, 'code', 'wrong-password')
                .having((e) => e.message, 'message', 'Incorrect password'),
          ),
        );

        verify(() => mockUser.reauthenticateWithCredential(any())).called(1);
      },
    );

    test('throws FirebaseException on unexpected exception', () async {
      when(
        () => mockUser.reauthenticateWithCredential(any()),
      ).thenThrow(Exception('Unexpected error'));

      expect(
        () => authService.changePassword(
          currentPassword: 'oldPass123',
          newPassword: 'newPass123',
        ),
        throwsA(
          isA<FirebaseException>().having(
            (e) => e.message,
            'message',
            'An unexpected error occurred',
          ),
        ),
      );

      verify(() => mockUser.reauthenticateWithCredential(any())).called(1);
    });

    test('throws FirebaseAuthException when user is null', () async {
      when(() => mockAuth.currentUser).thenReturn(null);

      expect(
        () => authService.changePassword(
          currentPassword: 'oldPass123',
          newPassword: 'newPass123',
        ),
        throwsA(
          isA<FirebaseAuthException>().having(
            (e) => e.code,
            'code',
            'user-not-found',
          ),
        ),
      );
    });
  });
  group('AuthService.signInWithGoogle', () {
    late MockUser mockNormalUser;
    late MockUserCredential mockUserCredential;

    setUp(() {
      mockAuth = MockFirebaseAuth();
      mockGoogleService = MockGoogleService();
      mockNormalUser = MockUser();
      mockUserCredential = MockUserCredential();
      authService = AuthService(
        auth: mockAuth,
        googleService: mockGoogleService,
      );

      registerFallbackValue(FakeAuthCredential());
    });

    test(
      'signInWithGoogle successfully links credential when user is anonymous',
      () async {
        final mockAccount = MockGoogleAccount();
        final mockAuthData = MockGoogleAuth();
        final mockUserCredential = MockUserCredential();
        final mockAnonymousUser = MockUser();
        final mockLinkedUser = MockUser();

        when(() => mockAuth.currentUser).thenReturn(mockAnonymousUser);
        when(() => mockAnonymousUser.isAnonymous).thenReturn(true);
        when(() => mockAnonymousUser.uid).thenReturn('anon-uid');

        // Mock Google sign-in
        when(
          () => mockGoogleService.signIn(),
        ).thenAnswer((_) async => mockAccount);
        when(() => mockGoogleService.account).thenReturn(mockAccount);
        when(
          () => mockAccount.authentication,
        ).thenAnswer((_) async => mockAuthData);
        when(() => mockAuthData.accessToken).thenReturn('access-token');
        when(() => mockAuthData.idToken).thenReturn('id-token');

        // Simulate link failure -> fallback signInWithCredential
        when(() => mockAnonymousUser.linkWithCredential(any())).thenThrow(
          FirebaseAuthException(code: 'some-error', message: 'link failed'),
        );

        when(() => mockAuth.signInWithCredential(any())).thenAnswer((_) async {
          when(() => mockAuth.currentUser).thenReturn(mockLinkedUser);
          return mockUserCredential;
        });

        when(() => mockUserCredential.user).thenReturn(mockLinkedUser);

        // Call method
        final result = await authService.signInWithGoogle();

        expect(result, same(mockLinkedUser));
        verify(() => mockAnonymousUser.linkWithCredential(any())).called(1);
        verify(() => mockAuth.signInWithCredential(any())).called(1);
      },
    );
    test('signInWithGoogle signs in directly for non-anonymous user', () async {
      final mockAccount = MockGoogleAccount();
      final mockAuthData = MockGoogleAuth();

      when(() => mockAuth.currentUser).thenReturn(mockNormalUser);
      when(() => mockNormalUser.isAnonymous).thenReturn(false);

      when(
        () => mockGoogleService.signIn(),
      ).thenAnswer((_) async => mockAccount);
      when(() => mockGoogleService.account).thenReturn(mockAccount);
      when(
        () => mockAccount.authentication,
      ).thenAnswer((_) async => mockAuthData);
      when(() => mockAuthData.accessToken).thenReturn('access-token');
      when(() => mockAuthData.idToken).thenReturn('id-token');

      when(
        () => mockAuth.signInWithCredential(any()),
      ).thenAnswer((_) async => mockUserCredential);
      when(() => mockUserCredential.user).thenReturn(mockNormalUser);

      final result = await authService.signInWithGoogle();

      expect(result, mockNormalUser);
      verify(() => mockAuth.signInWithCredential(any())).called(1);
      verifyNever(() => mockNormalUser.linkWithCredential(any()));
    });

    test('throws FirebaseException on FirebaseAuthException', () async {
      when(() => mockGoogleService.signIn()).thenThrow(
        FirebaseAuthException(code: 'error', message: 'Firebase error'),
      );

      expect(
        () => authService.signInWithGoogle(),
        throwsA(
          isA<FirebaseException>()
              .having((e) => e.message, 'message', 'Firebase error')
              .having((e) => e.code, 'code', 'error'),
        ),
      );
    });

    test('throws FirebaseException on other exceptions', () async {
      when(() => mockGoogleService.signIn()).thenThrow(Exception('Unexpected'));

      expect(
        () => authService.signInWithGoogle(),
        throwsA(
          isA<FirebaseException>().having(
            (e) => e.message,
            'message',
            'An other error happened',
          ),
        ),
      );
    });
  });
}
