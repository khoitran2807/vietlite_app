import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/domain/enum/nav_item.dart';
import 'package:vietlite/module/root/presentation/widget/mobile_bottom_bar.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late AppRouterMock appRouterMock;
  late MockTabviewBloc mockTabviewBloc;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(FakePageRouteInfo());

    appRouterMock = AppRouterMock();
    mockTabviewBloc = MockTabviewBloc();
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
  });

  Widget createTabletWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<TabViewBloc>(create: (context) => mockTabviewBloc),
          ],
          child: MediaQuery(
            data: MediaQueryData(size: WidgetUtils.mobileTestSize),
            child: const MobileBottomBar(),
          ),
        ),
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
      expect(find.byType(InkWell), findsWidgets);
      expect(find.byType(SvgPicture), findsWidgets);
    });
    testWidgets('Widget rebuilds when selectedChildTab changes', (
      tester,
    ) async {
      const initialState = TabViewState(
        selectedTab: NavItem.lettersNNumbers,
        selectedChildTab: NavChildItem.letters,
        tabs: NavItem.values,
        isTablet: true,
      );
      final newState = initialState.copyWith(selectedTab: NavItem.discover);
      whenListen(
        mockTabviewBloc,
        Stream.fromIterable([initialState, newState]),
        initialState: initialState,
      );
      await tester.pumpWidget(createTabletWidgetUnderTest());
      verify(() => mockTabviewBloc.state).called(greaterThan(1));
    });

    testWidgets('Selecting a tab updates selectedTab and navigates', (
      tester,
    ) async {
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState(
          selectedTab: NavItem.setting,
          selectedChildTab: NavItem.lettersNNumbers.children.first,
          tabs: NavItem.values,
          isTablet: true,
        ),
      );
      when(() => appRouterMock.navigate(any())).thenAnswer((_) async {});
      await tester.pumpWidget(createTabletWidgetUnderTest());

      await tester.tap(
        find.text(
          NavItem.setting.label(tester.element(find.byType(MobileBottomBar))),
        ),
      );
      await tester.pumpAndSettle();

      verify(() => appRouterMock.navigate(NavItem.setting.route)).called(1);
      verify(
        () => mockTabviewBloc.add(
          const TabViewEvent.changeTab(item: NavItem.setting),
        ),
      ).called(1);
    });

    testWidgets('Selecting a tab updates selectedTab and navigates', (
      tester,
    ) async {
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState(
          selectedTab: NavItem.wordsNSentences,
          selectedChildTab: NavItem.lettersNNumbers.children.first,
          tabs: NavItem.values,
          isTablet: true,
        ),
      );
      when(() => appRouterMock.navigate(any())).thenAnswer((_) async {});
      await tester.pumpWidget(createTabletWidgetUnderTest());
      await tester.pump();
      final contextElement = tester.element(find.byType(MobileBottomBar));
      final textFinder = find.text(
        NavItem.wordsNSentences.shortLabel(contextElement),
      );

      await tester.tap(textFinder);
      await tester.pumpAndSettle();
      verify(
        () => appRouterMock.navigate(NavItem.wordsNSentences.route),
      ).called(1);
      verify(
        () => mockTabviewBloc.add(
          const TabViewEvent.changeTab(item: NavItem.wordsNSentences),
        ),
      ).called(1);
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
      await tester.pump();

      final contextElement = tester.element(find.byType(MobileBottomBar));
      final textFinder = find.text(
        NavItem.lettersNNumbers.shortLabel(contextElement),
      );

      // Tap on the tab
      await tester.tap(textFinder);
      await tester.pumpAndSettle();
      verify(
        () => appRouterMock.navigate(NavItem.lettersNNumbers.route),
      ).called(1);
      verify(
        () => mockTabviewBloc.add(
          const TabViewEvent.changeTab(item: NavItem.lettersNNumbers),
        ),
      ).called(1);
    });

    testWidgets('Selecting a tab updates selectedTab and navigates', (
      tester,
    ) async {
      when(() => mockTabviewBloc.state).thenReturn(
        TabViewState(
          selectedTab: NavItem.discover,
          selectedChildTab: NavItem.lettersNNumbers.children.first,
          tabs: NavItem.values,
          isTablet: true,
        ),
      );
      when(() => appRouterMock.navigate(any())).thenAnswer((_) async {});
      await tester.pumpWidget(createTabletWidgetUnderTest());

      await tester.tap(
        find.text(
          NavItem.discover.label(tester.element(find.byType(MobileBottomBar))),
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
  });
}
