import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:flutter/material.dart';

part 'app_language.freezed.dart';

@freezed
class AppLanguage with _$AppLanguage {
  const AppLanguage._();

  const factory AppLanguage({required LanguageCode languageCode}) =
      _AppLanguage;

  factory AppLanguage.empty() =>
      const AppLanguage(languageCode: LanguageCode.en);

  Locale get locale => languageCode.locale;
}
