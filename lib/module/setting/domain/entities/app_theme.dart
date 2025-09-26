import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vietlite/common/enum/theme_code.dart';

part 'app_theme.freezed.dart';

@freezed
class AppTheme with _$AppTheme {
  const AppTheme._();

  const factory AppTheme({required ThemeCode themeCode}) = _ThemeCode;

  factory AppTheme.empty() => const AppTheme(themeCode: ThemeCode.light);

  ThemeData get theme => themeCode.theme;
}
