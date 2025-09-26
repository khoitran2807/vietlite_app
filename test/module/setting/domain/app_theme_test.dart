import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/enum/theme_code.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';

void main() {
  group('AppTheme', () {
    test('should create AppTheme with provided ThemeCode', () {
      const themeCode = ThemeCode.dark; // or use light based on your case

      const appTheme = AppTheme(themeCode: themeCode);

      expect(appTheme.themeCode, equals(themeCode));
    });

    test('should return empty AppTheme with default light theme', () {
      final appTheme = AppTheme.empty();

      expect(appTheme.themeCode, equals(ThemeCode.light));
    });

    test('should return correct ThemeData for light theme', () {
      const appTheme = AppTheme(themeCode: ThemeCode.light);

      expect(appTheme.theme.brightness, equals(Brightness.light));
    });

    test('should return correct ThemeData for dark theme', () {
      const appTheme = AppTheme(themeCode: ThemeCode.dark);

      expect(appTheme.theme.brightness, equals(Brightness.dark));
    });
  });
}
