import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/extension/build_context.dart';

import 'package:vietlite/app/res/images.dart';

enum HomeGridItem {
  letters,
  numbers,
  wordsAndSentences,
  discover;

  String get image {
    switch (this) {
      case HomeGridItem.letters:
        return AppImages.letter;
      case HomeGridItem.numbers:
        return AppImages.number;
      case HomeGridItem.wordsAndSentences:
        return AppImages.wordsAndSentences;
      case HomeGridItem.discover:
        return AppImages.discover;
    }
  }

  String title(BuildContext context) {
    switch (this) {
      case HomeGridItem.letters:
        return context.lang.letters;
      case HomeGridItem.numbers:
        return context.lang.numbers;
      case HomeGridItem.wordsAndSentences:
        return context.lang.wordsAndSentences;
      case HomeGridItem.discover:
        return context.lang.discover;
    }
  }

  String description(BuildContext context) {
    switch (this) {
      case HomeGridItem.letters:
        return context.lang.letterDescription;
      case HomeGridItem.numbers:
        return context.lang.numberDescription;
      case HomeGridItem.wordsAndSentences:
        return context.lang.wordsAndSentencesDescription;
      case HomeGridItem.discover:
        return context.lang.discoverDescription;
    }
  }

  PageRouteInfo get route {
    switch (this) {
      case HomeGridItem.letters:
        return const LettersScreenRoute();
      case HomeGridItem.numbers:
        return const NumbersScreenRoute();
      case HomeGridItem.wordsAndSentences:
        return const WordSelectionScreenRoute();
      case HomeGridItem.discover:
        return const DiscoverScreenRoute();
    }
  }
}
