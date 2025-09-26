import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:vietlite/common/enum/theme_code.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';
import 'package:vietlite/module/setting/domain/repository/i_setting_repository.dart';

part 'setting_event.dart';

part 'setting_state.dart';

part 'setting_bloc.freezed.dart';

@singleton
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final ISettingRepository repository;

  SettingBloc({required this.repository}) : super(SettingState.initial()) {
    on<SettingEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(
            state.copyWith(
              language: AppLanguage.empty().copyWith(
                languageCode: value.languageCode,
              ),
              theme: AppTheme.empty().copyWith(themeCode: value.themeCode),
            ),
          );
        },
        changeLocale: (_ChangeLocale value) async {
          emit(state.copyWith(failureOrSuccessOption: none()));
          final failureOrSuccess = await repository.saveLanguageToStorage(
            language: value.language,
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) {
              emit(
                state.copyWith(
                  language: value.language,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        },
        changeTheme: (_ChangeTheme value) async {
          emit(state.copyWith(failureOrSuccessOption: none()));
          final failureOrSuccess = await repository.saveThemeToStorage(
            theme: value.theme,
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) {
              emit(
                state.copyWith(
                  theme: value.theme,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
          );
        },
      );
    });
  }
}
