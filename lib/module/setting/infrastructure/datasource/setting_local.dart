import 'package:injectable/injectable.dart';
import 'package:vietlite/module/setting/domain/entities/app_language.dart';
import 'package:vietlite/module/setting/domain/entities/app_theme.dart';

import '../../../../common/constant/app_constant.dart';
import '../../../../di/locator.shorten.dart';

@injectable
class SettingLocalDataSource {
  const SettingLocalDataSource();

  Future<bool> saveLanguageToStorage(AppLanguage language) async {
    await AppLocator.storage.writeItem(
      AppConstant.languageMode,
      language.languageCode.name,
    );
    return true;
  }

  Future<bool> saveThemeToStorage(AppTheme theme) async {
    await AppLocator.storage.writeItem(
      AppConstant.themeMode,
      theme.themeCode.name,
    );
    return true;
  }
}
