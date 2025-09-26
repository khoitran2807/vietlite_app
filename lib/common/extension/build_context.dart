import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vietlite/app/res/dimensions.dart';
import '../../app/res/colors.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get lang => AppLocalizations.of(this)!;

  AppColors get color => Theme.of(this).extension<AppColors>()!;

  TextTheme get theme => Theme.of(this).textTheme;

  TextStyle get defaultStyle => theme.bodyMedium!;

  TextStyle get primaryStyle => defaultStyle.copyWith(color: color.primary);

  TextStyle get secondaryStyle => defaultStyle.copyWith(color: color.secondary);

  TextStyle get neutralStyle =>
      defaultStyle.copyWith(color: color.neutral.shade400);

  bool get isTablet =>
      MediaQuery.of(this).size.width > AppDimensions.tabletWidth;

  bool get isWebsite =>
      isTablet && MediaQuery.of(this).size.width > AppDimensions.midTableWidth;

  double get exampleSectionHeight {
    if (isTablet) return AppDimensions.s130;
    return AppDimensions.s92;
  }
}
