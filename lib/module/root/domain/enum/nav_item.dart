import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:vietlite/app/res/res.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/extension.dart';

enum NavItem {
  home,
  discover,
  setting,
  wordsNSentences,
  lettersNNumbers;

  double get size {
    switch (this) {
      case NavItem.home:
        return 44;
      default:
        return 26;
    }
  }

  double get labelPadding {
    switch (this) {
      case NavItem.home:
        return 0;
      default:
        return 4;
    }
  }

  String get icon {
    switch (this) {
      case NavItem.home:
        return AppIcons.homeInactive;
      case NavItem.discover:
        return AppIcons.discoverInactive;
      case NavItem.setting:
        return AppIcons.settingInactive;
      case NavItem.wordsNSentences:
        return AppIcons.wordsAndSentencesInactive;
      case NavItem.lettersNNumbers:
        return AppIcons.lettersAndNumbersInactive;
    }
  }

  String get activeIcon {
    switch (this) {
      case NavItem.home:
        return AppIcons.homeActive;
      case NavItem.discover:
        return AppIcons.discoverActive;
      case NavItem.setting:
        return AppIcons.settingActive;
      case NavItem.wordsNSentences:
        return AppIcons.wordsAndSentencesActive;
      case NavItem.lettersNNumbers:
        return AppIcons.lettersAndNumbersActive;
    }
  }

  String label(BuildContext context) {
    switch (this) {
      case NavItem.home:
        return context.lang.home;
      case NavItem.discover:
        return context.lang.discover;
      case NavItem.setting:
        return context.lang.setting;
      case NavItem.wordsNSentences:
        return context.lang.wordsAndSentences;
      case NavItem.lettersNNumbers:
        return context.lang.lettersAndNumbers;
    }
  }

  String shortLabel(BuildContext context) {
    switch (this) {
      case NavItem.home:
        return context.lang.home;
      case NavItem.discover:
        return context.lang.discover;
      case NavItem.setting:
        return context.lang.setting;
      case NavItem.wordsNSentences:
        return context.lang.wordsBottomBar;
      case NavItem.lettersNNumbers:
        return context.lang.lettersBottomBar;
    }
  }

  PageRouteInfo get route {
    switch (this) {
      case NavItem.home:
        return const HomeScreenRoute();
      case NavItem.discover:
        return const DiscoverScreenRoute();
      case NavItem.setting:
        return const SettingScreenRoute();
      case NavItem.wordsNSentences:
        return const WordsAndSentencesScreenRoute();
      case NavItem.lettersNNumbers:
        return const LettersAndNumbersScreenRoute();
    }
  }

  String get routeName {
    switch (this) {
      case NavItem.home:
        return '/home';
      case NavItem.discover:
        return '/discover';
      case NavItem.setting:
        return '/setting';
      case NavItem.wordsNSentences:
        return '/wordsAndSentences';
      case NavItem.lettersNNumbers:
        return '/lettersAndNumbers';
    }
  }

  List<NavChildItem> get children {
    switch (this) {
      case NavItem.lettersNNumbers:
        return [NavChildItem.letters, NavChildItem.numbers];
      case NavItem.wordsNSentences:
        return [NavChildItem.wordSelection, NavChildItem.wordMatch];
      default:
        return [];
    }
  }
}

enum NavChildItem {
  letters,
  numbers,
  wordSelection,
  wordMatch;

  String label(BuildContext context) {
    switch (this) {
      case NavChildItem.letters:
        return context.lang.letters;
      case NavChildItem.numbers:
        return context.lang.numbers;
      case NavChildItem.wordSelection:
        return context.lang.chooseAppropriateWord;
      case NavChildItem.wordMatch:
        return context.lang.matchWordToPicture;
    }
  }

  PageRouteInfo get route {
    switch (this) {
      case NavChildItem.letters:
        return const LettersScreenRoute();
      case NavChildItem.numbers:
        return const NumbersScreenRoute();
      case NavChildItem.wordSelection:
        return const WordSelectionScreenRoute();
      case NavChildItem.wordMatch:
        return const WordMatchScreenRoute();
    }
  }

  String get routeName {
    switch (this) {
      case NavChildItem.letters:
        return '/lettersAndNumbers/letters';
      case NavChildItem.numbers:
        return '/lettersAndNumbers/numbers';
      case NavChildItem.wordSelection:
        return '/wordsAndSentences/wordSelection';
      case NavChildItem.wordMatch:
        return '/wordsAndSentences/wordMatch';
    }
  }
}
