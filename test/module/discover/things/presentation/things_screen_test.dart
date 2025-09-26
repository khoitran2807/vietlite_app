import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/application/things_bloc.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/things/presentation/things_screen.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  group('ThingsScreen Widget Tests', () {
    late AppRouterMock appRouterMock;
    late MockThingsBloc mockThingsBloc;
    late MockAuthBloc mockAuthBloc;
    late MockProgressBloc mockProgressBloc;
    final mockThings = [
      Thing.empty().copyWith(
        id: '1',
        name: 'do',
        order: 1,
        type: ThingType.color,
      ),
      Thing.empty().copyWith(
        id: '2',
        name: 'xanh',
        order: 2,
        type: ThingType.color,
      ),
    ];

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      appRouterMock = AppRouterMock();
      mockThingsBloc = MockThingsBloc();
      mockProgressBloc = MockProgressBloc();
      mockAuthBloc = MockAuthBloc();
      GetIt.instance.registerFactory<AuthBloc>(() => mockAuthBloc);
      GetIt.instance.registerFactory<ThingsBloc>(() => mockThingsBloc);
      GetIt.instance.registerFactory<ProgressBloc>(() => mockProgressBloc);
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());
    });

    Widget createWidgetUnderTest() {
      return WidgetUtils.getScopedWidget(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<ThingsBloc>(create: (context) => mockThingsBloc),
          BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
        ],
        child: Scaffold(body: ThingsScreen(type: ThingType.color.name)),
      );
    }

    testWidgets('Shows toast when an error occurs', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      final stateWithFailure = ThingsState(
        failureOrSuccessOption: optionOf(
          Left(AppFailure.otherError(message: 'Error!')),
        ),
        things: [],
        isLoading: false,
      );

      whenListen(
        mockThingsBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: ThingsState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: createWidgetUnderTest())),
      );
      await tester.pump();

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('returns null when getThings success', (
      WidgetTester tester,
    ) async {
      final stateWithSuccess = ThingsState(
        failureOrSuccessOption: optionOf(Right(mockThings)),
        things: mockThings,
        isLoading: false,
      );

      whenListen(
        mockThingsBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: ThingsState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Rebuilds UI only when relevant state changes', (tester) async {
      whenListen(
        mockThingsBloc,
        Stream.fromIterable([ThingsState.initial().copyWith(isLoading: true)]),
        initialState: ThingsState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
    });

    testWidgets('Navigates to ThingDetailScreenRoute when a thing is tapped', (
      WidgetTester tester,
    ) async {
      when(() => mockThingsBloc.state).thenReturn(
        ThingsState(
          things: mockThings,
          isLoading: false,
          failureOrSuccessOption: optionOf(Right(mockThings)),
        ),
      );

      when(
        () => appRouterMock.push(ThingDetailScreenRoute(id: '1')),
      ).thenAnswer((_) async {
        return null;
      });

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('do'), findsOneWidget);

      await tester.tap(find.text('do'));
      await tester.pumpAndSettle();

      verify(
        () => appRouterMock.push(ThingDetailScreenRoute(id: '1')),
      ).called(1);
    });
    testWidgets('falls back to ThingType.animal when type is invalid', (
      tester,
    ) async {
      const screen = ThingsScreen(type: 'invalid_type');

      await tester.pumpWidget(createWidgetUnderTest());

      expect(screen.thingType, ThingType.animal);
    });
  });
}
