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
import 'package:vietlite/module/user/forget_password/application/forget_password_bloc.dart';
import 'package:vietlite/module/user/forget_password/presentation/forget_password_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late MockForgetPasswordBloc mockForgetPasswordBloc;
  late MockAuthBloc mockAuthBloc;
  late AppRouterMock appRouterMock;

  setUpAll(() {
    appRouterMock = AppRouterMock();
    mockForgetPasswordBloc = MockForgetPasswordBloc();
    mockAuthBloc = MockAuthBloc();
    setupRouterTest();
    GetIt.instance.registerFactory<ForgetPasswordBloc>(
      () => mockForgetPasswordBloc,
    );
    GetIt.instance.registerSingleton(mockAuthBloc);
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [BlocProvider<AuthBloc>(create: (context) => mockAuthBloc)],
      child: const ForgetPasswordScreen(),
    );
  }

  testWidgets('ForgetPasswordScreen displays email input and reset button', (
    tester,
  ) async {
    // Arrange
    when(
      () => mockForgetPasswordBloc.state,
    ).thenReturn(ForgetPasswordState.initial());

    // Act
    await tester.pumpWidget(createWidgetUnderTest());

    // Assert
    expect(find.byKey(WidgetKeys.emailInput), findsOneWidget);
    expect(find.byKey(WidgetKeys.forgetPasswordButton), findsOneWidget);
  });

  testWidgets(
    'ForgetPasswordScreen shows loading indicator when isForgetPassword is true',
    (tester) async {
      // Arrange
      when(() => mockForgetPasswordBloc.state).thenReturn(
        ForgetPasswordState.initial().copyWith(isForgetPassword: true),
      );

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byKey(WidgetKeys.forgetPasswordLoading), findsOneWidget);
      expect(find.byKey(WidgetKeys.forgetPasswordButton), findsNothing);
    },
  );

  testWidgets(
    'ForgetPasswordScreen triggers forgetPassword event on button press',
    (tester) async {
      // Arrange
      when(
        () => mockForgetPasswordBloc.state,
      ).thenReturn(ForgetPasswordState.initial());
      const testEmail = 'test@example.com';

      await tester.pumpWidget(createWidgetUnderTest());

      // Enter valid email
      await tester.enterText(find.byKey(WidgetKeys.emailInput), testEmail);

      // Act: Tap the reset password button
      await tester.tap(find.byKey(WidgetKeys.forgetPasswordButton));
      await tester.pump();

      // Assert: Verify the ForgetPasswordEvent.forgetPassword was added
      verify(
        () => mockForgetPasswordBloc.add(
          ForgetPasswordEvent.forgetPassword(email: EmailAddress(testEmail)),
        ),
      ).called(1);
    },
  );
  testWidgets(
    'ForgetPasswordScreen shows error toast on password reset failure',
    (tester) async {
      // Arrange
      whenListen(
        mockForgetPasswordBloc,
        Stream.fromIterable([
          ForgetPasswordState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              Left(AppFailure.otherError(message: 'Password reset failed')),
            ),
          ),
        ]),
        initialState: ForgetPasswordState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      // Act: Wait for the BlocListener to process the state change
      await tester.pump();

      // Assert
      expect(find.text('Password reset failed'), findsOneWidget);
    },
  );

  testWidgets(
    'ForgetPasswordScreen shows success toast on successful password reset',
    (tester) async {
      final stateWithSuccess = ForgetPasswordState(
        isForgetPassword: false,
        failureOrSuccessOption: some(right(unit)),
      );

      // Register the appRouterMock
      GetIt.instance.unregister<AppRouter>();
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);

      // Mock the navigation action
      when(() => appRouterMock.replaceAll(any())).thenAnswer((_) async {});

      whenListen(
        mockForgetPasswordBloc,
        Stream.fromIterable([ForgetPasswordState.initial(), stateWithSuccess]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      // Act: Wait for the BlocListener to process the state change
      await tester.pumpAndSettle();
      // Assert
      expect(
        find.text('Email sent. please check it to reset your password.'),
        findsOneWidget,
      );
      verify(
        () => appRouterMock.replaceAll([const LoginScreenRoute()]),
      ).called(1);
    },
  );

  testWidgets('Navigates to LoginScreen when back button is pressed', (
    tester,
  ) async {
    await tester.pumpWidget(createWidgetUnderTest());
    final backButtonFinder = find.text('Back');
    expect(backButtonFinder, findsOneWidget);
    await tester.tap(backButtonFinder);
    await tester.pumpAndSettle();

    verify(
      () => appRouterMock.replaceAll([const LoginScreenRoute()]),
    ).called(1);
  });

  testWidgets(
    'ForgetPasswordScreen triggers forgetPassword event on email onFieldSubmitted',
    (tester) async {
      // Arrange
      when(
        () => mockForgetPasswordBloc.state,
      ).thenReturn(ForgetPasswordState.initial());
      const testEmail = 'test@example.com';

      await tester.pumpWidget(createWidgetUnderTest());

      // Enter valid email
      await tester.enterText(find.byKey(WidgetKeys.emailInput), testEmail);

      // Act: simulate pressing "Enter" / submitting the field
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Assert: verify bloc receives the correct event
      verify(
        () => mockForgetPasswordBloc.add(
          ForgetPasswordEvent.forgetPassword(email: EmailAddress(testEmail)),
        ),
      ).called(1);
    },
  );
}
