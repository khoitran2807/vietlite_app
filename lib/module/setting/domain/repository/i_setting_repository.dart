import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';

abstract class ISettingRepository {
  Future<Either<AppFailure, bool>> saveLanguageToStorage({
    required AppLanguage language,
  });

  Future<Either<AppFailure, bool>> saveThemeToStorage({
    required AppTheme theme,
  });
}
