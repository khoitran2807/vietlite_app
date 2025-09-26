import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/config/app_config.dart';
import 'package:vietlite/app/res/images.dart';
import 'package:vietlite/common/keys/widget_keys.dart';
import 'package:vietlite/module/setting/presentation/widget/change_password_form.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:vietlite/common/enum/theme_code.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';
import 'package:vietlite/module/setting/presentation/setting_screen.dart';
import 'package:vietlite/module/setting/application/setting_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import '../../../utils/common_mocks.dart';
import '../../../utils/widget_utils.dart';

class FakeAuthEvent extends Fake implements AuthEvent {}

void main() {
  late AppRouter appRouterMock;
  late AppConfig appConfig;
  late MockSettingBloc mockSettingBloc;
  late MockAuthBloc mockAuthBloc;
  setUpAll(() {
    registerFallbackValue(FakeAuthEvent());
  });
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    appRouterMock = AppRouterMock();
    mockSettingBloc = MockSettingBloc();
    mockAuthBloc = MockAuthBloc();
    appConfig = AppConfig();
    GetIt.instance.reset();
    GetIt.instance.registerSingleton(appRouterMock);
    GetIt.instance.registerSingleton(mockSettingBloc);
    GetIt.instance.registerSingleton(mockAuthBloc);
    GetIt.instance.registerSingleton(appConfig);
    appConfig.changeFlavor(AppFlavor.dev);

    // Set an initial state for the bloc
    when(() => mockSettingBloc.state).thenReturn(SettingState.initial());
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());

    registerFallbackValue(
      const SettingEvent.initialize(
        languageCode: LanguageCode.en,
        themeCode: ThemeCode.light,
      ),
    );
  });

  Future<void> commonPumpWidget(tester) async {
    await tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        providers: [
          BlocProvider<SettingBloc>(create: (context) => mockSettingBloc),
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
        ],
        child: const SettingScreen(),
      ),
    );
  }

  group('SettingScreen', () {
    testWidgets('shows failure dialog when update success', (
      WidgetTester tester,
    ) async {
      // Mock the bloc's state to simulate a successful update
      final stateWithSuccess = SettingState(
        failureOrSuccessOption: some(right(unit)),
        language: const AppLanguage(languageCode: LanguageCode.en),
        theme: const AppTheme(themeCode: ThemeCode.light),
      );
      whenListen(
        mockSettingBloc,
        Stream.fromIterable([SettingState.initial(), stateWithSuccess]),
      );
      // Build the widget
      await commonPumpWidget(tester);

      // Verify that the success toast is shown
      await tester.pumpAndSettle(); // Wait for UI updates
      expect(find.text('Setting Changed successfully!'), findsOneWidget);
    });

    testWidgets('shows failure toast when setting update fails', (
      WidgetTester tester,
    ) async {
      // Create a failure state with an error message
      String errorMessage = 'Something went wrong';
      final failureState = SettingState(
        failureOrSuccessOption: some(left(AppFailure(message: errorMessage))),
        language: const AppLanguage(languageCode: LanguageCode.en),
        theme: const AppTheme(themeCode: ThemeCode.light),
      );
      whenListen(
        mockSettingBloc,
        Stream.fromIterable([SettingState.initial(), failureState]),
      );
      // Build the widget
      await commonPumpWidget(tester);

      // Verify that the success toast is shown
      await tester.pumpAndSettle(); // Wait for UI updates
      expect(find.text('Something went wrong'), findsOneWidget);
    });

    testWidgets('executes empty callback for failureOrSuccessOption.fold', (
      WidgetTester tester,
    ) async {
      whenListen(
        mockSettingBloc,
        Stream.fromIterable([
          SettingState.initial(),
          SettingState.initial().copyWith(failureOrSuccessOption: none()),
        ]),
      );
      // Build the widget
      await commonPumpWidget(tester);

      // Verify that the success toast is shown
      await tester.pumpAndSettle(); // Wait for UI updates
      expect(find.text('Setting Changed successfully!'), findsNothing);
    });

    testWidgets('Show Sign In Button if logged in anonymously', (
      WidgetTester tester,
    ) async {
      when(
        () => appRouterMock.replaceAll([const LoginScreenRoute()]),
      ).thenAnswer((_) => Future.value());
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(isAnonymous: true),
        ),
      );
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(800, 1200)),
          child: WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<SettingBloc>(create: (_) => mockSettingBloc),
              BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
            ],
            child: const Scaffold(body: SettingScreen()),
          ),
        ),
      );

      // Find the button and tap it
      final buttonFinder = find.text('Sign In');
      await tester.ensureVisible(buttonFinder);
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
      verify(
        () => appRouterMock.replaceAll([const LoginScreenRoute()]),
      ).called(1);
    });

    testWidgets('Tap logout InkWell calls AuthEvent.signOut', (
      WidgetTester tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(
            isAnonymous: false,
            email: 'test@example.com',
          ),
        ),
      );

      when(() => mockAuthBloc.add(any())).thenAnswer((_) async {});
      when(
        () => appRouterMock.replaceAll([const LoginScreenRoute()]),
      ).thenAnswer((_) async {});

      await commonPumpWidget(tester);
      await tester.pumpAndSettle();

      final logoutFinder = find.widgetWithIcon(InkWell, Icons.logout);
      expect(logoutFinder, findsOneWidget);
      await tester.ensureVisible(logoutFinder);
      await tester.tap(logoutFinder);
      await tester.pumpAndSettle();
      verify(() => mockAuthBloc.add(const AuthEvent.signOut())).called(1);
      verify(
        () => appRouterMock.replaceAll([const LoginScreenRoute()]),
      ).called(1);
    });
    testWidgets('tapping "Change Password" opens ChangePasswordForm dialog', (
      WidgetTester tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(
            isAnonymous: false,
            email: 'test@example.com',
          ),
        ),
      );

      when(() => mockAuthBloc.add(any())).thenAnswer((_) async {});

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1400, 2000)),
          child: WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<SettingBloc>(create: (_) => mockSettingBloc),
              BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
            ],
            child: const Scaffold(body: SettingScreen()),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tap on 'Change Password' ListTile
      final changePasswordTile = find.text('Change Password');
      expect(changePasswordTile, findsOneWidget);
      await tester.ensureVisible(changePasswordTile);
      await tester.tap(changePasswordTile);
      await tester.pumpAndSettle();

      // Expect ChangePasswordForm to appear
      expect(find.byType(ChangePasswordForm), findsOneWidget);
    });

    testWidgets('tapping language flag dispatches SettingEvent.changeLocale', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
      when(() => mockSettingBloc.add(any())).thenReturn(null);

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<SettingBloc>.value(value: mockSettingBloc),
            BlocProvider<AuthBloc>.value(value: mockAuthBloc),
          ],
          child: const SettingScreen(),
        ),
      );

      await tester.pumpAndSettle();

      final flagFinder = find.byWidgetPredicate((widget) {
        if (widget is Image && widget.image is AssetImage) {
          final asset = (widget.image as AssetImage).assetName;
          return asset == AppImages.vietnam;
        }
        return false;
      });

      expect(flagFinder, findsOneWidget);

      await tester.tap(flagFinder);
      await tester.pumpAndSettle();

      final captured =
          verify(() => mockSettingBloc.add(captureAny())).captured.single
              as SettingEvent;

      captured.maybeMap(
        changeLocale: (evt) {
          expect(evt.language.languageCode, LanguageCode.vi);
        },
        orElse: () => fail('Expected a changeLocale event'),
      );
    });
  });

  group('ChangePasswordForm', () {
    testWidgets('dispatches AuthEvent.changePassword for valid input', (
      tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1400, 2000)),
          child: WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<SettingBloc>(create: (_) => mockSettingBloc),
              BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
            ],
            child: const Scaffold(body: ChangePasswordForm()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(WidgetKeys.currentPasswordInput),
        'oldPass',
      );
      await tester.enterText(
        find.byKey(WidgetKeys.newPasswordInput),
        'newPass123',
      );
      await tester.enterText(
        find.byKey(WidgetKeys.confirmPasswordInput),
        'newPass123',
      );

      await tester.tap(find.byKey(WidgetKeys.changePasswordButton));
      await tester.pumpAndSettle();

      verify(
        () => mockAuthBloc.add(
          const AuthEvent.changePassword(
            currentPassword: 'oldPass',
            newPassword: 'newPass123',
          ),
        ),
      ).called(1);
    });
    testWidgets('tapping cancel closes the form', (tester) async {
      when(() => appRouterMock.maybePop()).thenAnswer((_) async => true);

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1400, 2000)),
          child: WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<SettingBloc>(create: (_) => mockSettingBloc),
              BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
            ],
            child: const Scaffold(body: ChangePasswordForm()),
          ),
        ),
      );
      expect(find.byType(ChangePasswordForm), findsOneWidget);

      await tester.tap(find.byKey(WidgetKeys.cancelChangePassword));
      await tester.pumpAndSettle();

      verify(() => appRouterMock.maybePop()).called(1);
    });

    testWidgets('shows error toast when change password fails', (tester) async {
      final stateWithFailure = AuthState(
        failureOrSuccessOption: optionOf(
          Left(AppFailure.otherError(message: 'Error!')),
        ),
        appUser: AppUser.empty().copyWith(
          isAnonymous: false,
          email: 'test@example.com',
        ),
        isLoading: false,
        premiumConfig: PremiumConfig.empty(),
      );
      whenListen(
        mockAuthBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: AuthState.initial(),
      );
      // Build form
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1400, 2000)),
          child: WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<SettingBloc>(create: (_) => mockSettingBloc),
              BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
            ],
            child: const Scaffold(body: ChangePasswordForm()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('shows success toast and closes form on successful change', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(
            isAnonymous: false,
            email: 'test@example.com',
          ),
        ),
      );
      whenListen(
        mockAuthBloc,
        Stream.fromIterable([
          AuthState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(unit)),
          ),
        ]),
        initialState: AuthState.initial(),
      );

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1400, 2000)),
          child: WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<SettingBloc>(create: (_) => mockSettingBloc),
              BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
            ],
            child: const Scaffold(body: ChangePasswordForm()),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(ChangePasswordForm), findsNothing);
    });
    testWidgets('shows loading indicator when isLoading is true', (
      tester,
    ) async {
      whenListen(
        mockAuthBloc,
        Stream.fromIterable([
          AuthState.initial(),
          AuthState.initial().copyWith(isLoading: true),
        ]),
        initialState: AuthState.initial(),
      );

      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(size: Size(1400, 2000)),
          child: WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<SettingBloc>(create: (_) => mockSettingBloc),
              BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
            ],
            child: const Scaffold(body: ChangePasswordForm()),
          ),
        ),
      );

      await tester.pump();

      expect(find.byKey(WidgetKeys.changePasswordLoading), findsOneWidget);
      expect(find.byKey(WidgetKeys.changePasswordButton), findsNothing);
    });
  });
}
