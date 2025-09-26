import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/value/value_objects.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/keys/widget_keys.dart';
import 'package:vietlite/module/user/login/application/login_bloc.dart';
import 'package:vietlite/module/user/login/presentation/login_screen.dart';
import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late MockLoginBloc mockLoginBloc;
  late MockAuthBloc mockAuthBloc;
  late AppRouterMock appRouterMock;

  setUpAll(() {
    appRouterMock = AppRouterMock();
    mockLoginBloc = MockLoginBloc();
    mockAuthBloc = MockAuthBloc();
    GetIt.instance.registerFactory<LoginBloc>(() => mockLoginBloc);
    GetIt.instance.registerSingleton(mockAuthBloc);
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    when(
      () => appRouterMock.replaceAll([const RootScreenRoute()]),
    ).thenAnswer((_) => Future.value());
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [BlocProvider<AuthBloc>(create: (context) => mockAuthBloc)],
      child: const LoginScreen(),
    );
  }

  testWidgets(
    'LoginScreen displays email and password fields and sign in button',
    (tester) async {
      // Arrange
      when(() => mockLoginBloc.state).thenReturn(LoginState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byKey(WidgetKeys.emailInput), findsOneWidget);
      expect(find.byKey(WidgetKeys.passwordInput), findsOneWidget);
      expect(find.byKey(WidgetKeys.signInWithPasswordButton), findsOneWidget);
    },
  );

  testWidgets(
    'LoginScreen displays loading indicator when isSignInWithEmailAndPassword is true',
    (tester) async {
      // Arrange
      when(() => mockLoginBloc.state).thenReturn(
        LoginState.initial().copyWith(isSignInWithEmailAndPassword: true),
      );

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byKey(WidgetKeys.signInWithPasswordLoading), findsOneWidget);
      expect(find.byKey(WidgetKeys.signInWithPasswordButton), findsNothing);
    },
  );

  testWidgets(
    'LoginScreen triggers signInWithEmailAndPassword event on button press',
    (tester) async {
      // Arrange
      when(() => mockLoginBloc.state).thenReturn(LoginState.initial());
      const testEmail = 'test@example.com';
      const testPassword = 'password123';

      await tester.pumpWidget(createWidgetUnderTest());

      // Enter valid email and password
      await tester.enterText(find.byKey(WidgetKeys.emailInput), testEmail);
      await tester.enterText(
        find.byKey(WidgetKeys.passwordInput),
        testPassword,
      );

      // Act: Tap the sign-in button
      await tester.tap(find.byKey(WidgetKeys.signInWithPasswordButton));
      await tester.pump();

      // Assert: Verify the LoginEvent.signInWithEmailAndPassword was added
      verify(
        () => mockLoginBloc.add(
          LoginEvent.signInWithEmailAndPassword(
            email: EmailAddress(testEmail),
            password: Password(testPassword),
          ),
        ),
      ).called(1);
    },
  );

  testWidgets('LoginScreen shows success toast on successful login', (
    tester,
  ) async {
    // Arrange
    when(() => mockAuthBloc.state).thenReturn(
      AuthState.initial().copyWith(
        appUser: AppUser.empty().copyWith(email: 'sample-email'),
      ),
    );
    whenListen(
      mockLoginBloc,
      Stream.fromIterable([
        LoginState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ]),
      initialState: LoginState.initial(),
    );

    await tester.pumpWidget(createWidgetUnderTest());

    // Act: Wait for the BlocListener to process the state change
    await tester.pump();

    // Assert
    // Replace `showToast` verification with proper testing if you mock the behavior
    expect(find.text('Sign In Successfully!'), findsOneWidget);
  });

  testWidgets('LoginScreen shows error toast on login failure', (tester) async {
    // Arrange
    whenListen(
      mockLoginBloc,
      Stream.fromIterable([
        LoginState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            Left(AppFailure.otherError(message: 'Login failed')),
          ),
        ),
      ]),
      initialState: LoginState.initial(),
    );

    await tester.pumpWidget(createWidgetUnderTest());

    // Act: Wait for the BlocListener to process the state change
    await tester.pump();

    // Assert
    expect(find.text('Login failed'), findsOneWidget);
  });

  testWidgets('shows loading indicator when isAnonymousSignIn is true', (
    WidgetTester tester,
  ) async {
    // Arrange
    when(
      () => mockLoginBloc.state,
    ).thenReturn(LoginState.initial().copyWith(isAnonymousSignIn: true));

    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byKey(WidgetKeys.anonymousSignInLoading), findsOneWidget);
    expect(find.byKey(WidgetKeys.skipLoginButton), findsNothing);
  });

  testWidgets('shows Skip button when isAnonymousSignIn is false', (
    WidgetTester tester,
  ) async {
    // Arrange
    when(
      () => mockLoginBloc.state,
    ).thenReturn(LoginState.initial().copyWith(isAnonymousSignIn: false));

    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byKey(WidgetKeys.skipLoginButton), findsOneWidget);
    expect(find.byKey(WidgetKeys.anonymousSignInLoading), findsNothing);
  });

  testWidgets(
    'triggers LoginEvent.anonymousSignIn when Skip button is tapped',
    (WidgetTester tester) async {
      // Arrange
      when(
        () => mockLoginBloc.state,
      ).thenReturn(LoginState.initial().copyWith(isAnonymousSignIn: false));
      when(
        () => mockLoginBloc.add(const LoginEvent.anonymousSignIn()),
      ).thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());

      // Act
      final skipButton = find.byKey(WidgetKeys.skipLoginButton);
      await tester.ensureVisible(skipButton);
      await tester.tap(skipButton);

      await tester.pump();

      // Assert
      verify(
        () => mockLoginBloc.add(const LoginEvent.anonymousSignIn()),
      ).called(1);
    },
  );

  testWidgets(
    'tapping Forget Password button navigates to ForgetPasswordScreen',
    (WidgetTester tester) async {
      GetIt.instance.unregister<AppRouter>();
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
      when(
        () => appRouterMock.push(const ForgetPasswordScreenRoute()),
      ).thenAnswer((_) => Future.value());
      await tester.pumpWidget(createWidgetUnderTest());

      final buttonFinder = find.text('Forget password');

      // Act: Tap the Forget Password button
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
      verify(
        () => appRouterMock.push(const ForgetPasswordScreenRoute()),
      ).called(1);
    },
  );

  testWidgets('tapping Register button navigates to RegisterScreen', (
    WidgetTester tester,
  ) async {
    GetIt.instance.unregister<AppRouter>();
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    when(
      () => appRouterMock.push(const RegisterScreenRoute()),
    ).thenAnswer((_) => Future.value());
    await tester.pumpWidget(createWidgetUnderTest());
    final buttonFinder = find.text('signUp');
    await tester.tap(buttonFinder);
    verify(() => appRouterMock.push(const RegisterScreenRoute())).called(1);
  });

  testWidgets(
    'LoginScreen triggers signInWithEmailAndPassword event on field submitted',
    (tester) async {
      // Arrange
      when(() => mockLoginBloc.state).thenReturn(LoginState.initial());
      const testEmail = 'submitted@example.com';
      const testPassword = 'mypassword';

      await tester.pumpWidget(createWidgetUnderTest());

      // Enter valid email and password
      await tester.enterText(find.byKey(WidgetKeys.emailInput), testEmail);
      await tester.enterText(
        find.byKey(WidgetKeys.passwordInput),
        testPassword,
      );

      // Act: Submit via keyboard (onFieldSubmitted)
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Assert
      verify(
        () => mockLoginBloc.add(
          LoginEvent.signInWithEmailAndPassword(
            email: EmailAddress(testEmail),
            password: Password(testPassword),
          ),
        ),
      ).called(1);
    },
  );
  testWidgets(
    'LoginScreen triggers signInWithGoogle event when Google button tapped',
    (tester) async {
      // Arrange
      when(() => mockLoginBloc.state).thenReturn(LoginState.initial());

      await tester.pumpWidget(createWidgetUnderTest());

      final googleButton = find.byKey(WidgetKeys.signInWithGoogleButton);
      expect(googleButton, findsOneWidget);

      await tester.tap(googleButton);
      await tester.pump();

      // Assert
      verify(
        () => mockLoginBloc.add(const LoginEvent.signInWithGoogle()),
      ).called(1);
    },
  );
}
