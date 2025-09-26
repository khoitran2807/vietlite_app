part of 'setting_bloc.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    required AppLanguage language,
    required AppTheme theme,
    required Option<Either<AppFailure, dynamic>> failureOrSuccessOption,
  }) = _SettingState;

  factory SettingState.initial() => SettingState(
    language: AppLanguage.empty(),
    theme: AppTheme.empty(),
    failureOrSuccessOption: none(),
  );
}
