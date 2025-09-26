import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/application/discover_bloc.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/root/presentation/discover_screen.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    late AppRouterMock appRouterMock;
    late MockDiscoverBloc mockDiscoverBloc;
    late MockProgressBloc mockProgressBloc;
    late MockAuthBloc mockAuthBloc;

    final things = [
      Thing.empty().copyWith(id: 'id1', name: 'title1'),
      Thing.empty().copyWith(id: 'id2', name: 'title2'),
    ];
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      appRouterMock = AppRouterMock();
      mockDiscoverBloc = MockDiscoverBloc();
      mockProgressBloc = MockProgressBloc();
      mockAuthBloc = MockAuthBloc();
      GetIt.instance.registerFactory<AuthBloc>(() => mockAuthBloc);
      GetIt.instance.registerFactory<DiscoverBloc>(() => mockDiscoverBloc);
      GetIt.instance.registerFactory<ProgressBloc>(() => mockProgressBloc);
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    });

    Widget createWidgetUnderTest() {
      return WidgetUtils.getScopedWidget(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<DiscoverBloc>(create: (context) => mockDiscoverBloc),
          BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
        ],
        child: const Scaffold(body: DiscoverScreen()),
      );
    }

    testWidgets('Shows toast when an error occurs', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      final stateWithFailure = DiscoverState(
        fetchFailure: optionOf(Left(AppFailure.otherError(message: 'Error!'))),
        things: [],
        isLoading: false,
      );

      whenListen(
        mockDiscoverBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: DiscoverState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: ScaffoldMessenger(child: createWidgetUnderTest())),
      );

      await tester.pump();

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('returns null when getThings success', (
      WidgetTester tester,
    ) async {
      whenListen(
        mockAuthBloc,
        Stream.fromIterable([
          AuthState.initial(),
          AuthState.initial().copyWith(
            appUser: AppUser.empty().copyWith(id: 'user_id'),
          ),
        ]),
        initialState: AuthState.initial(),
      );
      final stateWithSuccess = DiscoverState(
        fetchFailure: optionOf(Right(things)),
        things: things,
        isLoading: false,
      );

      whenListen(
        mockDiscoverBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: DiscoverState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('DiscoverScreen Test', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      final appScaffoldFinder = find.byType(AppScaffold);
      expect(appScaffoldFinder, findsOneWidget);
    });

    testWidgets('Navigates to ThingsScreenRoute when card is tapped', (
      WidgetTester tester,
    ) async {
      final item = ThingType.values.first;
      when(
        () => appRouterMock.push(ThingsScreenRoute(type: item.name)),
      ).thenAnswer((_) async => null);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      verify(
        () => appRouterMock.push(ThingsScreenRoute(type: item.name)),
      ).called(1);
    });
  });
}
