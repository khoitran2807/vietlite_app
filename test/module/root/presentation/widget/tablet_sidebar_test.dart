import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/domain/enum/nav_item.dart';
import 'package:vietlite/module/root/presentation/widget/tablet_sidebar.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late AppRouterMock appRouterMock;
  late MockTabviewBloc mockTabviewBloc;
  late MockAuthBloc mockAuthBloc;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(FakePageRouteInfo());

    appRouterMock = AppRouterMock();
    mockTabviewBloc = MockTabviewBloc();
    mockAuthBloc = MockAuthBloc();
    GetIt.instance.registerSingleton(mockAuthBloc);
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);

    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
  });

  Widget createTabletWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<TabViewBloc>(create: (context) => mockTabviewBloc),
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
      ],
      child: MediaQuery(
        data: MediaQueryData(size: WidgetUtils.tabletTestSize),
        child: const Scaffold(body: TabletSidebar()),
      ),
    );
  }

  group('TabletSidebar Widget Tests', () {
    setUp(() {
      // Ensure TabViewBloc has a valid state
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState.initial().copyWith(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
        ),
      );
    });
    testWidgets('should render TabletSidebar correctly', (tester) async {
      await tester.pumpWidget(createTabletWidgetUnderTest());

      expect(find.byType(TabletSidebar), findsOneWidget);
    });

    testWidgets('TabletSidebar rebuilds when selectedTab changes', (
      WidgetTester tester,
    ) async {
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState(
          selectedTab: NavItem.lettersNNumbers,
          selectedChildTab: NavItem.lettersNNumbers.children.first,
          tabs: NavItem.values,
          isTablet: true,
        ),
      );

      await tester.pumpWidget(createTabletWidgetUnderTest());
      // Simulate a state change where the selected tab changes
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState(
          selectedTab: NavItem.lettersNNumbers,
          selectedChildTab: NavItem.lettersNNumbers.children.last,
          // Provide a valid child tab
          tabs: NavItem.values,
          isTablet: true,
        ),
      );
      await tester.pumpAndSettle();

      // Verify that the new selected tab is now displayed
      expect(
        find.text(
          NavItem.discover.label(tester.element(find.byType(TabletSidebar))),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Selecting a tab updates selectedTab and navigates', (
      tester,
    ) async {
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState(
          selectedTab: NavItem.lettersNNumbers,
          selectedChildTab: NavItem.lettersNNumbers.children.first,
          tabs: NavItem.values,
          isTablet: true,
        ),
      );
      when(() => appRouterMock.navigate(any())).thenAnswer((_) async {});
      await tester.pumpWidget(createTabletWidgetUnderTest());

      await tester.tap(
        find.text(
          NavItem.discover.label(tester.element(find.byType(TabletSidebar))),
        ),
      );
      await tester.pumpAndSettle();

      verify(() => appRouterMock.navigate(NavItem.discover.route)).called(1);
      verify(
        () => mockTabviewBloc.add(
          const TabViewEvent.changeTab(item: NavItem.discover),
        ),
      ).called(1);
    });

    testWidgets(
      'Selecting a child tab updates selectedChildTab and navigates',
      (tester) async {
        when(() => mockTabviewBloc.state).thenReturn(
          const TabViewState(
            selectedTab: NavItem.lettersNNumbers,
            selectedChildTab: NavChildItem.letters,
            tabs: NavItem.values,
            isTablet: true,
          ),
        );
        when(() => appRouterMock.navigate(any())).thenAnswer((_) async {});

        await tester.pumpWidget(createTabletWidgetUnderTest());
        await tester.pumpAndSettle(); // Ensure all widgets are built

        final labelText = NavItem.lettersNNumbers.label(
          tester.element(find.byType(TabletSidebar)),
        );

        expect(find.text(labelText), findsOneWidget); // Ensure text exists

        await tester.ensureVisible(find.text(labelText));
        await tester.pumpAndSettle();

        await tester.tap(
          find.text(
            NavChildItem.numbers.label(
              tester.element(find.byType(TabletSidebar)),
            ),
          ),
        );
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.navigate(NavChildItem.numbers.route),
        ).called(1);
        verify(
          () => mockTabviewBloc.add(
            const TabViewEvent.changeChildTab(childItem: NavChildItem.numbers),
          ),
        ).called(1);
      },
    );

    testWidgets('Widget rebuilds when selectedChildTab changes', (
      tester,
    ) async {
      const initialState = TabViewState(
        selectedTab: NavItem.lettersNNumbers,
        selectedChildTab: NavChildItem.letters,
        tabs: NavItem.values,
        isTablet: true,
      );

      final newState = initialState.copyWith(
        selectedChildTab: NavChildItem.numbers,
      );

      whenListen(
        mockTabviewBloc,
        Stream.fromIterable([initialState, newState]),
        initialState: initialState,
      );

      await tester.pumpWidget(createTabletWidgetUnderTest());

      verify(() => mockTabviewBloc.state).called(greaterThan(1));
    });
  });
}
