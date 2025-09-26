part of 'tab_view_bloc.dart';

@freezed
class TabViewState with _$TabViewState {
  const factory TabViewState({
    required List<NavItem> tabs,
    required bool isTablet,
    required NavItem selectedTab,
    required NavChildItem selectedChildTab,
  }) = _TabViewState;

  bool get isHome => selectedTab == NavItem.home;

  bool get isSetting => selectedTab == NavItem.setting;

  bool get isLetter =>
      selectedTab == NavItem.lettersNNumbers &&
      selectedChildTab == NavChildItem.letters;

  bool get isNumber =>
      selectedTab == NavItem.lettersNNumbers &&
      selectedChildTab == NavChildItem.numbers;

  bool get isDiscover => selectedTab == NavItem.discover;

  bool get isWordSelection =>
      selectedTab == NavItem.wordsNSentences &&
      selectedChildTab == NavChildItem.wordSelection;

  bool get isWordMatch =>
      selectedTab == NavItem.wordsNSentences &&
      selectedChildTab == NavChildItem.wordMatch;

  factory TabViewState.initial() => const TabViewState(
    tabs: [
      NavItem.lettersNNumbers,
      NavItem.wordsNSentences,
      NavItem.home,
      NavItem.discover,
      NavItem.setting,
    ],
    selectedTab: NavItem.home,
    selectedChildTab: NavChildItem.letters,
    isTablet: false,
  );

  const TabViewState._();
}
