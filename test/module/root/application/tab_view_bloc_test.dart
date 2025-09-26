import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/root/domain/enum/nav_item.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';

void main() {
  late TabViewBloc tabViewBloc;

  setUp(() {
    registerFallbackValue(AppLanguage.empty());
    registerFallbackValue(AppTheme.empty());
    tabViewBloc = TabViewBloc();
  });

  tearDown(() {
    tabViewBloc.close();
  });

  group('TabViewBloc Tests', () {
    test('initial state should be SettingState.initial()', () {
      expect(tabViewBloc.state, TabViewState.initial());
    });

    blocTest<TabViewBloc, TabViewState>(
      'emits correct state when initialize event is added for tablet mode with different route',
      build: () {
        tabViewBloc.emit(tabViewBloc.state.copyWith(isTablet: true));
        return tabViewBloc;
      },
      act:
          (bloc) => bloc.add(
            const TabViewEvent.initialize(
              routeName: '/letters',
              isTablet: true,
            ),
          ),
      expect: () => [],
    );

    blocTest<TabViewBloc, TabViewState>(
      'emits correct state when initialize event is added for tablet',
      build: () => tabViewBloc,
      act:
          (bloc) => bloc.add(
            const TabViewEvent.initialize(routeName: '/home', isTablet: true),
          ),
      expect:
          () => [
            const TabViewState(
              tabs: [
                NavItem.home,
                NavItem.lettersNNumbers,
                NavItem.wordsNSentences,
                NavItem.discover,
                NavItem.setting,
              ],
              isTablet: true,
              selectedTab: NavItem.home,
              selectedChildTab: NavChildItem.letters,
            ),
          ],
    );

    // Test case for the `changeTab` event
    blocTest<TabViewBloc, TabViewState>(
      'emits a new state with updated selectedTab and selectedChildTab when tab is changed',
      build: () => TabViewBloc(),
      act:
          (bloc) => bloc.add(
            const TabViewEvent.changeTab(item: NavItem.lettersNNumbers),
          ),
      expect:
          () => [
            const TabViewState(
              tabs: [
                NavItem.lettersNNumbers,
                NavItem.wordsNSentences,
                NavItem.home,
                NavItem.discover,
                NavItem.setting,
              ],
              isTablet: false,
              selectedTab: NavItem.lettersNNumbers,
              selectedChildTab: NavChildItem.letters,
            ),
          ],
    );

    blocTest<TabViewBloc, TabViewState>(
      'changeTab without children',
      build: () => TabViewBloc(),
      act:
          (bloc) =>
              bloc.add(const TabViewEvent.changeTab(item: NavItem.discover)),
      expect:
          () => [
            const TabViewState(
              tabs: [
                NavItem.lettersNNumbers,
                NavItem.wordsNSentences,
                NavItem.home,
                NavItem.discover,
                NavItem.setting,
              ],
              isTablet: false,
              selectedTab: NavItem.discover,
              selectedChildTab: NavChildItem.letters,
            ),
          ],
    );

    // Test case for the `changeChildTab` event
    blocTest<TabViewBloc, TabViewState>(
      'emits a new state with updated selectedChildTab when child tab is changed',
      build: () => TabViewBloc(),
      act:
          (bloc) => bloc.add(
            const TabViewEvent.changeChildTab(childItem: NavChildItem.numbers),
          ),
      expect:
          () => [
            const TabViewState(
              tabs: [
                NavItem.lettersNNumbers,
                NavItem.wordsNSentences,
                NavItem.home,
                NavItem.discover,
                NavItem.setting,
              ],
              isTablet: false,
              selectedTab: NavItem.home,
              selectedChildTab: NavChildItem.numbers,
            ),
          ],
    );

    blocTest<TabViewBloc, TabViewState>(
      'emits correct state when initializing mobile mode with different tab',
      build: () => tabViewBloc,
      act:
          (bloc) => bloc.add(
            const TabViewEvent.initialize(
              routeName: '/letters',
              isTablet: false,
            ),
          ),
      expect: () => [],
    );
    blocTest<TabViewBloc, TabViewState>(
      'emits correct state when switching from tablet to mobile with new tab and child tab',
      build: () => tabViewBloc,
      act:
          (bloc) => bloc.add(
            const TabViewEvent.initialize(
              routeName: '/discover',
              isTablet: false,
            ),
          ),
      expect:
          () => [
            const TabViewState(
              tabs: [
                NavItem.lettersNNumbers,
                NavItem.wordsNSentences,
                NavItem.home,
                NavItem.discover,
                NavItem.setting,
              ],
              isTablet: false,
              selectedTab: NavItem.discover,
              selectedChildTab: NavChildItem.letters,
            ),
          ],
    );
  });
  test(
    'isLetter returns true when selectedTab is lettersNNumbers and child is letters',
    () {
      const state = TabViewState(
        tabs: [
          NavItem.lettersNNumbers,
          NavItem.wordsNSentences,
          NavItem.home,
          NavItem.discover,
          NavItem.setting,
        ],
        isTablet: false,
        selectedTab: NavItem.lettersNNumbers,
        selectedChildTab: NavChildItem.letters,
      );

      expect(state.isLetter, isTrue);
      expect(state.isNumber, isFalse);
    },
  );
  test(
    'isNumber returns true when selectedTab is lettersNNumbers and child is numbers',
    () {
      const state = TabViewState(
        tabs: [
          NavItem.lettersNNumbers,
          NavItem.wordsNSentences,
          NavItem.home,
          NavItem.discover,
          NavItem.setting,
        ],
        isTablet: false,
        selectedTab: NavItem.lettersNNumbers,
        selectedChildTab: NavChildItem.numbers,
      );

      expect(state.isNumber, isTrue);
      expect(state.isLetter, isFalse);
    },
  );
  test('isLetter and isNumber return false for unrelated tabs', () {
    const state = TabViewState(
      tabs: [
        NavItem.lettersNNumbers,
        NavItem.wordsNSentences,
        NavItem.home,
        NavItem.discover,
        NavItem.setting,
      ],
      isTablet: false,
      selectedTab: NavItem.discover,
      selectedChildTab: NavChildItem.numbers,
    );

    expect(state.isLetter, isFalse);
    expect(state.isNumber, isFalse);
  });
  group('TabViewState getters isWordSelection & isWordMatch', () {
    test(
      'isWordSelection true when selectedTab is wordsNSentences and child is wordSelection',
      () {
        const state = TabViewState(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
          isTablet: false,
          selectedTab: NavItem.wordsNSentences,
          selectedChildTab: NavChildItem.wordSelection,
        );

        expect(state.isWordSelection, isTrue);
        expect(state.isWordMatch, isFalse);
      },
    );

    test(
      'isWordMatch true when selectedTab is wordsNSentences and child is wordMatch',
      () {
        const state = TabViewState(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
          isTablet: false,
          selectedTab: NavItem.wordsNSentences,
          selectedChildTab: NavChildItem.wordMatch,
        );

        expect(state.isWordMatch, isTrue);
        expect(state.isWordSelection, isFalse);
      },
    );

    test('both false when selectedTab is not wordsNSentences', () {
      const state = TabViewState(
        tabs: [
          NavItem.lettersNNumbers,
          NavItem.wordsNSentences,
          NavItem.home,
          NavItem.discover,
          NavItem.setting,
        ],
        isTablet: false,
        selectedTab: NavItem.home,
        selectedChildTab: NavChildItem.wordSelection,
      );

      expect(state.isWordSelection, isFalse);
      expect(state.isWordMatch, isFalse);
    });

    test(
      'both false when selectedTab is wordsNSentences but childTab is unrelated',
      () {
        const state = TabViewState(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
          isTablet: false,
          selectedTab: NavItem.wordsNSentences,
          selectedChildTab: NavChildItem.letters, // unrelated child
        );

        expect(state.isWordSelection, isFalse);
        expect(state.isWordMatch, isFalse);
      },
    );
  });
}
