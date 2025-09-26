import 'package:flutter/cupertino.dart';
import 'package:vietlite/app/res/images.dart';

enum LanguageCode {
  vi,
  en;

  Locale get locale {
    return Locale(name);
  }

  String get flag {
    switch (this) {
      case LanguageCode.en:
        return AppImages.england;
      case LanguageCode.vi:
        return AppImages.vietnam;
    }
  }
}
