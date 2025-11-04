import 'package:vietlite/app/config/app_config.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/plugin/firebase/auth_service.dart';
import 'package:vietlite/plugin/firebase/remote_config_service.dart';
import 'package:vietlite/plugin/storage/local_storage.dart';

import 'locator.dart';

class AppLocator {
  static AppRouter get router => locator<AppRouter>();

  static LocalStorage storage = locator<LocalStorage>();

  static AppConfig config = locator<AppConfig>();

  static RemoteConfigService remoteConfig = locator<RemoteConfigService>();

  static AuthService auth = locator<AuthService>();
}
