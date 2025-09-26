import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';
import 'package:vietlite/module/setting/domain/repository/i_setting_repository.dart';
import 'package:vietlite/module/setting/infrastructure/datasource/setting_local.dart';

@Injectable(as: ISettingRepository)
class SettingRepository extends ISettingRepository {
  final SettingLocalDataSource localDataSource;

  SettingRepository({required this.localDataSource});

  @override
  Future<Either<AppFailure, bool>> saveLanguageToStorage({
    required AppLanguage language,
  }) async {
    try {
      bool result = await localDataSource.saveLanguageToStorage(language);
      return Right(result);
    } catch (ex) {
      debugPrint(ex.toString());
      return Left(
        AppFailure.storageError(
          message: 'error when saving language to storage',
        ),
      );
    }
  }

  @override
  Future<Either<AppFailure, bool>> saveThemeToStorage({
    required AppTheme theme,
  }) async {
    try {
      bool result = await localDataSource.saveThemeToStorage(theme);
      return Right(result);
    } catch (ex) {
      debugPrint(ex.toString());
      return Left(
        AppFailure.storageError(message: 'error when saving theme to storage'),
      );
    }
  }
}
