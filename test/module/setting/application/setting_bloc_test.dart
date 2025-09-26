import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/setting/application/setting_bloc.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';
import 'package:vietlite/module/setting/domain/repository/i_setting_repository.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:vietlite/common/enum/theme_code.dart';

// Mock repository
class MockSettingRepository extends Mock implements ISettingRepository {}

void main() {
  late SettingBloc settingBloc;
  late MockSettingRepository mockRepository;
  late AppFailure apiError;

  setUp(() {
    registerFallbackValue(AppLanguage.empty());
    registerFallbackValue(AppTheme.empty());
    mockRepository = MockSettingRepository();
    settingBloc = SettingBloc(repository: mockRepository);
    apiError = AppFailure.storageError(message: 'storage error occurred');
  });

  tearDown(() {
    settingBloc.close();
  });

  group('SettingBloc Tests', () {
    test('initial state should be SettingState.initial()', () {
      expect(settingBloc.state, SettingState.initial());
    });

    blocTest<SettingBloc, SettingState>(
      'emits updated language and theme when initialize is called',
      build: () => settingBloc,
      act:
          (bloc) => bloc.add(
            const SettingEvent.initialize(
              languageCode: LanguageCode.en,
              themeCode: ThemeCode.light,
            ),
          ),
      expect:
          () => [
            SettingState.initial().copyWith(
              language: AppLanguage.empty().copyWith(
                languageCode: LanguageCode.en,
              ),
              theme: AppTheme.empty().copyWith(themeCode: ThemeCode.light),
            ),
          ],
    );

    blocTest<SettingBloc, SettingState>(
      'emits success when changeLocale is called and repository succeeds',
      build: () {
        when(
          () => mockRepository.saveLanguageToStorage(
            language: any(named: 'language'),
          ),
        ).thenAnswer((_) async => right(true));
        return settingBloc;
      },
      act:
          (bloc) => bloc.add(
            const SettingEvent.changeLocale(
              language: AppLanguage(languageCode: LanguageCode.vi),
            ),
          ),
      expect:
          () => [
            SettingState.initial().copyWith(failureOrSuccessOption: none()),
            SettingState.initial().copyWith(
              language: const AppLanguage(languageCode: LanguageCode.vi),
              failureOrSuccessOption: some(right(true)),
            ),
          ],
    );
    blocTest<SettingBloc, SettingState>(
      'emits failure when changeLocale is called and repository fails',
      build: () {
        when(
          () => mockRepository.saveLanguageToStorage(
            language: any(named: 'language'),
          ),
        ).thenAnswer((_) async => left(apiError));
        return settingBloc;
      },
      act:
          (bloc) => bloc.add(
            const SettingEvent.changeLocale(
              language: AppLanguage(languageCode: LanguageCode.vi),
            ),
          ),
      expect:
          () => [
            SettingState.initial().copyWith(failureOrSuccessOption: none()),
            SettingState.initial().copyWith(
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockRepository.saveLanguageToStorage(
            language: any(named: 'language'),
          ),
        ).called(1);
      },
    );

    blocTest<SettingBloc, SettingState>(
      'emits success when changeTheme is called and repository succeeds',
      build: () {
        when(
          () => mockRepository.saveThemeToStorage(theme: any(named: 'theme')),
        ).thenAnswer((_) async => right(true));
        return settingBloc;
      },
      act:
          (bloc) => bloc.add(
            const SettingEvent.changeTheme(
              theme: AppTheme(themeCode: ThemeCode.dark),
            ),
          ),
      expect:
          () => [
            SettingState.initial().copyWith(failureOrSuccessOption: none()),
            SettingState.initial().copyWith(
              theme: const AppTheme(themeCode: ThemeCode.dark),
              failureOrSuccessOption: some(right(true)),
            ),
          ],
    );

    blocTest<SettingBloc, SettingState>(
      'emits failure when changeTheme is called and repository fails',
      build: () {
        when(
          () => mockRepository.saveThemeToStorage(theme: any(named: 'theme')),
        ).thenAnswer((_) async => left(apiError));
        return settingBloc;
      },
      act:
          (bloc) => bloc.add(
            const SettingEvent.changeTheme(
              theme: AppTheme(themeCode: ThemeCode.dark),
            ),
          ),
      expect:
          () => [
            SettingState.initial().copyWith(failureOrSuccessOption: none()),
            SettingState.initial().copyWith(
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockRepository.saveThemeToStorage(theme: any(named: 'theme')),
        ).called(1);
      },
    );
  });
}
