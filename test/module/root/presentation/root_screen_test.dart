import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/presentation/root_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/src/router/controller/navigation_history/navigation_history_base.dart';
import '../../../utils/common_mocks.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouterMock appRouterMock;
  late RootStackRouter mockRootStackRouter;
  late MockTabviewBloc mockTabviewBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    Map<String, AutoRoute> routesMap = {
      "MaterialRootRoute": CustomRoute(
        path: "/",
        page: RootScreenRoute.page,
        transitionsBuilder: TransitionsBuilders.noTransition,
        children: [
          AutoRoute(path: "home", page: HomeScreenRoute.page, initial: true),
          AutoRoute(
            path: "lettersAndNumbers",
            page: LettersAndNumbersScreenRoute.page,
          ),
          AutoRoute(
            path: "wordsAndSentences",
            page: WordsAndSentencesScreenRoute.page,
          ),
          AutoRoute(path: "discover", page: DiscoverScreenRoute.page),
          AutoRoute(path: "setting", page: SettingScreenRoute.page),
        ],
      ),
    };

    appRouterMock = AppRouterMock();
    mockRootStackRouter = MockRootStackRouter();
    mockTabviewBloc = MockTabviewBloc();
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

    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
  });

  Widget createMobileWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<TabViewBloc>(create: (context) => mockTabviewBloc),
      ],
      child: MediaQuery(
        data: MediaQueryData(size: WidgetUtils.mobileTestSize),
        child: const RootScreen(),
      ),
    );
  }

  // group('RootScreen Tests Mobile', () {
  //   setUp(() {
  //     when(() => mockTabviewBloc.state).thenReturn(
  //       TabViewState.initial().copyWith(tabs: [
  //         NavItem.lettersNNumbers,
  //         NavItem.wordsNSentences,
  //         NavItem.home,
  //         NavItem.discover,
  //         NavItem.setting
  //       ]),
  //     );
  //   });
  //
  //   testWidgets('renders AutoTabsScaffold and its children', (tester) async {
  //     await tester.pumpWidget(createMobileWidgetUnderTest());
  //
  //     // Check if AutoTabsScaffold is present
  //     expect(find.byType(AutoTabsScaffold), findsOneWidget);
  //
  //     // Verify the BottomNavigationBar renders
  //     expect(find.byType(BottomNavigationBar), findsOneWidget);
  //
  //     // Verify the FloatingActionButton renders
  //     expect(find.byType(InkWell), findsOneWidget);
  //   });
  //   //
  //   testWidgets('tapping BottomNavigationBarItem updates tabsRouter',
  //       (tester) async {
  //     await tester.pumpWidget(createMobileWidgetUnderTest());
  //
  //     // tap the bottom bar item
  //     await tester.tap(find.text('Discover'));
  //     await tester.pumpAndSettle();
  //     verify(() => mockTabviewBloc
  //         .add(const TabViewEvent.changeTab(item: NavItem.discover))).called(1);
  //     await tester.tap(find.text('Words & Sentences'));
  //     await tester.pumpAndSettle();
  //     verify(() => mockTabviewBloc
  //             .add(const TabViewEvent.changeTab(item: NavItem.wordsNSentences)))
  //         .called(1);
  //   });
  //
  //   testWidgets('tapping FloatingActionButton sets active index to 2',
  //       (tester) async {
  //     whenListen(
  //       mockTabviewBloc,
  //       Stream<TabViewState>.fromIterable([
  //         TabViewState.initial(),
  //         TabViewState.initial().copyWith(selectedTab: NavItem.wordsNSentences),
  //         // Should trigger rebuild
  //       ]),
  //     );
  //     await tester.pumpWidget(createMobileWidgetUnderTest());
  //
  //     // Tap the floating action button
  //     await tester.tap(find.byType(InkWell));
  //     await tester.pumpAndSettle();
  //     verify(() => mockTabviewBloc
  //         .add(const TabViewEvent.changeTab(item: NavItem.home))).called(1);
  //   });
  // });
}
