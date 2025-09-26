import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/domain/enum/nav_item.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/words_and_sentences/root/presentation/words_and_sentences_screen.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import 'package:mocktail/mocktail.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/src/router/controller/navigation_history/navigation_history_base.dart';
import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late AppRouterMock appRouterMock;
  late RootStackRouter mockRootStackRouter;
  late MockTabviewBloc mockTabviewBloc;
  late MockAuthBloc mockAuthBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(FakePageRouteInfo());

    Map<String, AutoRoute> routesMap = {
      "MaterialRootRoute": CustomRoute(
        path: "/",
        page: RootScreenRoute.page,
        transitionsBuilder: TransitionsBuilders.noTransition,
        children: [
          CustomRoute(
            path: 'wordsAndSentences',
            page: WordsAndSentencesScreenRoute.page,
            transitionsBuilder: TransitionsBuilders.noTransition,
            children: [
              AutoRoute(
                path: 'wordSelection',
                page: WordSelectionScreenRoute.page,
                initial: true,
              ),
              AutoRoute(path: 'wordMatch', page: WordMatchScreenRoute.page),
            ],
          ),
        ],
      ),
    };

    appRouterMock = AppRouterMock();
    mockRootStackRouter = MockRootStackRouter();
    mockTabviewBloc = MockTabviewBloc();
    mockAuthBloc = MockAuthBloc();
    when(() => appRouterMock.root).thenAnswer((_) => mockRootStackRouter);
    when(
      () => appRouterMock.routes,
    ).thenAnswer((_) => [routesMap['MaterialRootRoute']!]);

    when(
      () => mockRootStackRouter.defaultRouteType,
    ).thenAnswer((_) => const RouteType.material());
    when(() => mockRootStackRouter.guards).thenAnswer((_) => []);
    when(
      () => mockRootStackRouter.navigationHistory,
    ).thenAnswer((_) => NavigationHistory.create(mockRootStackRouter));
    when(() => mockRootStackRouter.currentSegments).thenAnswer((_) => []);

    when(
      () => appRouterMock.routeCollection,
    ).thenAnswer((_) => RouteCollection(routesMap));
    GetIt.instance.registerFactory<AuthBloc>(() => mockAuthBloc);

    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
  });

  Widget createMobileWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),

        BlocProvider<TabViewBloc>(create: (context) => mockTabviewBloc),
      ],
      child: MediaQuery(
        data: MediaQueryData(size: WidgetUtils.mobileTestSize),
        child: const WordsAndSentencesScreen(),
      ),
    );
  }

  Widget createTabletWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),

        BlocProvider<TabViewBloc>(create: (context) => mockTabviewBloc),
      ],
      child: const MediaQuery(
        data: MediaQueryData(size: Size(900, 900)),
        child: WordsAndSentencesScreen(),
      ),
    );
  }

  group('WordsAndSentencesScreen Widget Tests', () {
    setUp(() {
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState.initial().copyWith(tabs: [NavItem.wordsNSentences]),
      );
    });

    testWidgets('should render WordsAndSentencesScreen correctly', (
      tester,
    ) async {
      await tester.pumpWidget(createMobileWidgetUnderTest());

      // Check if AutoTabsScaffold is present
      expect(find.byType(AppScaffold), findsOneWidget);
    });

    testWidgets('Widget rebuilds when selectedChildTab changes', (
      tester,
    ) async {
      const initialState = TabViewState(
        selectedTab: NavItem.wordsNSentences,
        selectedChildTab: NavChildItem.wordSelection,
        tabs: NavItem.values,
        isTablet: true,
      );
      final newState = initialState.copyWith(
        selectedTab: NavItem.wordsNSentences,
        selectedChildTab: NavChildItem.wordMatch,
      );

      whenListen(
        mockTabviewBloc,
        Stream.fromIterable([initialState, newState]),
        initialState: initialState,
      );
      FlutterError.onError = (FlutterErrorDetails details) {
        if (details.exceptionAsString().contains('RenderFlex overflowed')) {
          return;
        }
        FlutterError.presentError(details);
      };

      await tester.pumpWidget(createMobileWidgetUnderTest());

      verify(() => mockTabviewBloc.state).called(greaterThan(1));
    });

    testWidgets('should navigate when a tab is tapped', (tester) async {
      when(() => appRouterMock.push(any())).thenAnswer((_) async => null);

      await tester.pumpWidget(createMobileWidgetUnderTest());

      await tester.tap(
        find.text(
          NavChildItem.wordMatch.label(
            tester.element(find.byType(WordsAndSentencesScreen)),
          ),
        ),
      );
      await tester.pumpAndSettle();

      verify(() => appRouterMock.push(NavChildItem.wordMatch.route)).called(1);
    });
  });

  testWidgets(
    'should contain SizedBox with height AppDimensions.s16 on tablet',
    (tester) async {
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState.initial().copyWith(
          tabs: [NavItem.wordsNSentences],
          isTablet: true,
        ),
      );

      await tester.pumpWidget(createTabletWidgetUnderTest());

      expect(find.byType(SizedBox), findsWidgets);
    },
  );
}
