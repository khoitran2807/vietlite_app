import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final MaterialColor primary;
  final MaterialColor secondary;
  final MaterialColor neutral;
  final MaterialColor yellow;
  final MaterialColor nameColor;
  final Color foreground;
  final Color error;
  final Color background;
  final Color success;
  final MaterialColor redColor;
  final MaterialColor blueColor;
  final MaterialColor purpleColor;
  final MaterialColor oliveColor;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.neutral,
    required this.yellow,
    required this.foreground,
    required this.error,
    required this.background,
    required this.success,
    required this.nameColor,
    required this.redColor,
    required this.blueColor,
    required this.purpleColor,
    required this.oliveColor,
  });

  @override
  AppColors copyWith({
    MaterialColor? primary,
    MaterialColor? secondary,
    MaterialColor? neutral,
    MaterialColor? yellow,
    MaterialColor? foreground,
    MaterialColor? error,
    MaterialColor? background,
    MaterialColor? nameColor,
    MaterialColor? redColor,
    MaterialColor? blueColor,
    MaterialColor? purpleColor,
    MaterialColor? oliveColor,
    Color? success,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      neutral: neutral ?? this.neutral,
      yellow: yellow ?? this.yellow,
      foreground: foreground ?? this.foreground,
      error: error ?? this.error,
      background: background ?? this.background,
      success: success ?? this.success,
      nameColor: nameColor ?? this.nameColor,
      redColor: redColor ?? this.redColor,
      blueColor: blueColor ?? this.blueColor,
      purpleColor: purpleColor ?? this.purpleColor,
      oliveColor: oliveColor ?? this.oliveColor,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    return this;
  }
}
