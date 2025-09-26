import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/keys/widget_keys.dart';
import 'package:vietlite/common/value/value_objects.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/register/application/register_bloc.dart';
import 'package:vietlite/module/user/register/presentation/register_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late MockRegisterBloc mockRegisterBloc;
  late MockAuthBloc mockAuthBloc;
  late AppRouterMock appRouterMock;

  setUpAll(() {
    appRouterMock = AppRouterMock();
    mockRegisterBloc = MockRegisterBloc();
    mockAuthBloc = MockAuthBloc();
    GetIt.instance.registerFactory<RegisterBloc>(() => mockRegisterBloc);
    GetIt.instance.registerSingleton(mockAuthBloc);
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    when(
      () => appRouterMock.replaceAll([const RootScreenRoute()]),
    ).thenAnswer((_) => Future.value());
    when(
      () => appRouterMock.replaceAll([const LoginScreenRoute()]),
    ).thenAnswer((_) => Future.value());
  });
  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [BlocProvider<AuthBloc>(create: (context) => mockAuthBloc)],
      child: const RegisterScreen(),
    );
  }

  testWidgets('RegisterScreen shows error toast on register failure', (
    tester,
  ) async {
    // Arrange
    whenListen(
      mockRegisterBloc,
      Stream.fromIterable([
        RegisterState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            Left(AppFailure.otherError(message: 'Register failed')),
          ),
        ),
      ]),
      initialState: RegisterState.initial(),
    );

    await tester.pumpWidget(createWidgetUnderTest());

    // Act: Wait for the BlocListener to process the state change
    await tester.pump();

    // Assert
    expect(find.text('Register failed'), findsOneWidget);
  });

  testWidgets(
    'RegisterScreen displays loading indicator when isRegisterWithEmailAndPassword is true',
    (tester) async {
      // Arrange
      when(
        () => mockRegisterBloc.state,
      ).thenReturn(RegisterState.initial().copyWith(isRegister: true));

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byKey(WidgetKeys.registerLoading), findsOneWidget);
      expect(find.byKey(WidgetKeys.registerButton), findsNothing);
    },
  );

  testWidgets('RegisterScreen shows success toast on successful registration', (
    tester,
  ) async {
    whenListen(
      mockRegisterBloc,
      Stream.fromIterable([
        RegisterState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Right(unit)),
        ),
      ]),
      initialState: RegisterState.initial(),
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();
    expect(find.text('Sign Up Successfully'), findsOneWidget);
    verify(() => appRouterMock.replaceAll([const RootScreenRoute()])).called(1);
  });

  testWidgets(
    'RegisterScreen triggers registerWithEmailAndPassword event on button press',
    (tester) async {
      when(() => mockRegisterBloc.state).thenReturn(RegisterState.initial());
      const testEmail = 'register@example.com';
      const testPassword = 'password123';
      const testName = 'abc';

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byKey(WidgetKeys.emailInput), findsOneWidget);
      expect(find.byKey(WidgetKeys.nameInput), findsOneWidget);
      expect(find.byKey(WidgetKeys.passwordInput), findsOneWidget);

      // Enter valid email and password
      await tester.enterText(find.byKey(WidgetKeys.emailInput), testEmail);
      await tester.enterText(find.byKey(WidgetKeys.nameInput), testName);
      await tester.enterText(
        find.byKey(WidgetKeys.passwordInput),
        testPassword,
      );

      await tester.tap(find.byKey(WidgetKeys.registerButton));
      await tester.pump();

      verify(
        () => mockRegisterBloc.add(
          RegisterEvent.registerWithEmailAndPassword(
            email: EmailAddress(testEmail),
            password: Password(testPassword),
            name: testName,
          ),
        ),
      ).called(1);
    },
  );

  testWidgets('Navigates to LoginScreen when back button is pressed', (
    tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());
    final backButtonFinder = find.text('Back');
    expect(backButtonFinder, findsOneWidget);

    // Nhấn vào nút
    await tester.ensureVisible(backButtonFinder);
    await tester.tap(backButtonFinder);
    await tester.pumpAndSettle();

    verify(
      () => appRouterMock.replaceAll([const LoginScreenRoute()]),
    ).called(1);
  });
  testWidgets(
    'RegisterScreen triggers registerWithEmailAndPassword event on password field submit',
    (tester) async {
      when(() => mockRegisterBloc.state).thenReturn(RegisterState.initial());
      const testEmail = 'register@example.com';
      const testPassword = 'password123';
      const testName = 'abc';

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(WidgetKeys.emailInput), testEmail);
      await tester.enterText(find.byKey(WidgetKeys.nameInput), testName);
      await tester.enterText(
        find.byKey(WidgetKeys.passwordInput),
        testPassword,
      );

      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      verify(
        () => mockRegisterBloc.add(
          RegisterEvent.registerWithEmailAndPassword(
            email: EmailAddress(testEmail),
            password: Password(testPassword),
            name: testName,
          ),
        ),
      ).called(1);
    },
  );
}
