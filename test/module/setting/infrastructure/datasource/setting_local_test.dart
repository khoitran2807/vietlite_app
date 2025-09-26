import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:vietlite/common/enum/theme_code.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';
import 'package:vietlite/common/constant/app_constant.dart';
import 'package:vietlite/module/setting/infrastructure/datasource/setting_local.dart';
import '../../../../utils/common_mocks.dart';

void main() {
  late SettingLocalDataSource settingLocalDataSource;
  late MockStorage mockStorage;

  setUp(() {
    // Initialize mock storage and setting local data source
    mockStorage = MockStorage();
    // Mock AppLocator.storage to return the mockStorage
    AppLocator.storage = mockStorage;
    settingLocalDataSource = const SettingLocalDataSource();
  });

  group('SettingLocalDataSource', () {
    test('should save language to storage', () async {
      // Arrange
      const language = AppLanguage(languageCode: LanguageCode.en);
      // Mock the behavior of writeItem
      when(
        () => mockStorage.writeItem(AppConstant.languageMode, 'en'),
      ).thenAnswer((_) async {});

      // Act
      final result = await settingLocalDataSource.saveLanguageToStorage(
        language,
      );

      // Assert
      expect(result, isTrue);
      verify(
        () => mockStorage.writeItem(AppConstant.languageMode, 'en'),
      ).called(1);
    });

    test('should save theme to storage', () async {
      // Arrange
      const theme = AppTheme(themeCode: ThemeCode.light);
      // Mock the behavior of writeItem
      when(
        () => mockStorage.writeItem(AppConstant.themeMode, 'light'),
      ).thenAnswer((_) async {});

      // Act
      final result = await settingLocalDataSource.saveThemeToStorage(theme);

      // Assert
      expect(result, isTrue);
      verify(
        () => mockStorage.writeItem(AppConstant.themeMode, 'light'),
      ).called(1);
    });
  });
}
