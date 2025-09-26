import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/module/home/presentation/home_screen.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/presentation/progress_component.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/presentation/widget/header_info.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:mocktail/mocktail.dart';
import '../../../utils/common_mocks.dart';
import '../../../utils/widget_utils.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    late MockTabviewBloc mockTabviewBloc;
    late MockAuthBloc mockAuthBloc;
    late AppRouterMock appRouterMock;
    late MockProgressBloc mockProgressBloc;

    setUpAll(() {
      appRouterMock = AppRouterMock();
      mockTabviewBloc = MockTabviewBloc();
      mockAuthBloc = MockAuthBloc();
      mockProgressBloc = MockProgressBloc();
      GetIt.instance.registerSingleton(mockAuthBloc);
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
      GetIt.instance.registerSingleton<ProgressBloc>(mockProgressBloc);

      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
      when(() => mockTabviewBloc.state).thenReturn(TabViewState.initial());
      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

      when(
        () => appRouterMock.push(const LoginScreenRoute()),
      ).thenAnswer((_) => Future.value());
    });

    Widget createWidgetUnderTest() {
      return WidgetUtils.getScopedWidget(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<TabViewBloc>(create: (context) => mockTabviewBloc),
          BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
        ],
        child: MediaQuery(
          data: MediaQueryData(size: WidgetUtils.mobileTestSize),
          child: const Scaffold(body: HomeScreen()),
        ),
      );
    }

    testWidgets('HomeScreen', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(HeaderInfo), findsOneWidget);
      expect(find.byType(ProgressComponent), findsOneWidget);
    });

    testWidgets('should show login button when not logged in', (
      WidgetTester tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState(
          appUser: const AppUser(
            id: '',
            email: '',
            name: '',
            avatar: '',
            isAnonymous: true,
          ),
          failureOrSuccessOption: none(),
          isLoading: false,
          premiumConfig: PremiumConfig.empty(),
        ),
      );

      // Build the HomeScreen widget
      await tester.pumpWidget(createWidgetUnderTest());
      final loginButton = find.byType(ElevatedButton);
      expect(loginButton, findsOneWidget);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      verify(() => appRouterMock.push(const LoginScreenRoute())).called(1);
    });

    testWidgets('should update UI when appUser changes (login state', (
      tester,
    ) async {
      const loggedInUser = AppUser(
        id: '123',
        email: 'test@example.com',
        name: 'John Doe',
        avatar: 'avatar.png',
        isAnonymous: false,
      );
      // Arrange
      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.initial().copyWith(appUser: AppUser.empty()));
      whenListen(
        mockAuthBloc,
        Stream.fromIterable([
          AuthState.initial().copyWith(appUser: loggedInUser),
        ]),
        initialState: AuthState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
      expect(find.text('Hello, John Doe'), findsOneWidget);
    });
  });
}
