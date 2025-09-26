// TODO: write test for app_language entity
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';

void main() {
  group('AppLanguage', () {
    test('should create AppLanguage with provided LanguageCode', () {
      const languageCode = LanguageCode.vi;
      const appLanguage = AppLanguage(languageCode: languageCode);
      expect(appLanguage.languageCode, equals(languageCode));
    });
    test(
      'should return empty AppLanguage with default language code as en',
      () {
        final appLanguage = AppLanguage.empty();
        expect(appLanguage.languageCode, equals(LanguageCode.en));
      },
    );

    test('should return correct Locale for LanguageCode.en', () {
      const appLanguage = AppLanguage(languageCode: LanguageCode.en);
      expect(appLanguage.locale, equals(const Locale('en')));
    });
    test('should return correct Locale for LanguageCode.vi', () {
      const appLanguage = AppLanguage(languageCode: LanguageCode.vi);
      expect(appLanguage.locale, equals(const Locale('vi')));
    });
  });
}
