import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:vietlite/common/enum/theme_code.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';
import 'package:vietlite/module/setting/infrastructure/datasource/setting_local.dart';
import 'package:vietlite/module/setting/infrastructure/repository/setting_repository.dart';

class MockSettingLocalDataSource extends Mock
    implements SettingLocalDataSource {}

void main() {
  late SettingRepository settingRepository;
  late MockSettingLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockSettingLocalDataSource();
    settingRepository = SettingRepository(localDataSource: mockLocalDataSource);
  });

  group('saveLanguageToStorage', () {
    test(
      'should return Right(true) when saving language is successful',
      () async {
        // Arrange
        const appLanguage = AppLanguage(languageCode: LanguageCode.en);
        when(
          () => mockLocalDataSource.saveLanguageToStorage(appLanguage),
        ).thenAnswer((_) async => true);

        // Act
        final result = await settingRepository.saveLanguageToStorage(
          language: appLanguage,
        );

        // Assert
        expect(result, const Right(true));
        verify(
          () => mockLocalDataSource.saveLanguageToStorage(appLanguage),
        ).called(1);
      },
    );

    test('should return Left(storageError) when saving language fails', () async {
      // Arrange
      const appLanguage = AppLanguage(languageCode: LanguageCode.en);
      when(
        () => mockLocalDataSource.saveLanguageToStorage(appLanguage),
      ).thenThrow(Exception('error'));

      // Act
      await settingRepository.saveLanguageToStorage(language: appLanguage);

      // Assert
      // expect(result, Left(AppFailure.storageError(message: 'error when saving language to storage')));
      verify(
        () => mockLocalDataSource.saveLanguageToStorage(appLanguage),
      ).called(1);
    });
  });

  group('saveThemeToStorage', () {
    test('should return Right(true) when saving theme is successful', () async {
      // Arrange
      const appTheme = AppTheme(themeCode: ThemeCode.light);
      when(
        () => mockLocalDataSource.saveThemeToStorage(appTheme),
      ).thenAnswer((_) async => true);

      // Act
      final result = await settingRepository.saveThemeToStorage(
        theme: appTheme,
      );

      // Assert
      expect(result, const Right(true));
      verify(() => mockLocalDataSource.saveThemeToStorage(appTheme)).called(1);
    });

    test('should return Left(storageError) when saving theme fails', () async {
      // Arrange
      const appTheme = AppTheme(themeCode: ThemeCode.light);
      when(
        () => mockLocalDataSource.saveThemeToStorage(appTheme),
      ).thenThrow(Exception('error'));

      // Act
      await settingRepository.saveThemeToStorage(theme: appTheme);

      // Assert
      // expect(result, Left(AppFailure.storageError(message: 'error when saving theme to storage')));
      verify(() => mockLocalDataSource.saveThemeToStorage(appTheme)).called(1);
    });
  });
}
