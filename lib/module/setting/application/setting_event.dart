part of 'setting_bloc.dart';

@freezed
class SettingEvent with _$SettingEvent {
  const factory SettingEvent.initialize({
    required LanguageCode languageCode,
    required ThemeCode themeCode,
  }) = _Initialize;

  const factory SettingEvent.changeLocale({required AppLanguage language}) =
      _ChangeLocale;

  const factory SettingEvent.changeTheme({required AppTheme theme}) =
      _ChangeTheme;
}
