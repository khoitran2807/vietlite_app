import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vietlite/common/enum/language_code.dart';
import 'package:vietlite/common/enum/theme_code.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/setting/application/setting_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'app/config/app_config.dart';
import 'common/constant/app_constant.dart';
import 'module/root/application/tab_view_bloc.dart';

final class AppSetup {
  static Future<void> runAppWithFlavor({required AppFlavor flavor}) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: kIsWeb ? flavor.firebaseOptions : null,
    );
    configureDependencies();
    AppLocator.config.changeFlavor(flavor);

    List results = await Future.wait([
      getInitialTheme(),
      getInitialLocale(),
      AppLocator.remoteConfig.init(),
    ]);
    runApp(MyApp(theme: results[0], language: results[1]));
  }

  static Future<ThemeCode> getInitialTheme() async {
    String? theme = await AppLocator.storage.readItem(AppConstant.themeMode);
    if (theme == 'dark') {
      return ThemeCode.dark;
    }
    return ThemeCode.light;
  }

  static Future<LanguageCode> getInitialLocale() async {
    String? languageCode = await AppLocator.storage.readItem(
      AppConstant.languageMode,
    );
    if (languageCode == 'en') {
      return LanguageCode.en;
    }
    return LanguageCode.vi;
  }
}

class MyApp extends StatelessWidget {
  final ThemeCode theme;
  final LanguageCode language;

  const MyApp({super.key, required this.theme, required this.language});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabViewBloc>(create: (context) => locator<TabViewBloc>()),
        BlocProvider<ProgressBloc>(
          create: (context) => locator<ProgressBloc>(),
        ),
        BlocProvider<SettingBloc>(
          create:
              (context) =>
                  locator<SettingBloc>()..add(
                    SettingEvent.initialize(
                      languageCode: language,
                      themeCode: theme,
                    ),
                  ),
        ),
        BlocProvider<AuthBloc>(
          create:
              (context) =>
                  locator<AuthBloc>()..add(const AuthEvent.initialize()),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen:
            (previous, current) =>
                !previous.isLoggedInWithEmail && current.isLoggedInWithEmail,
        listener: (context, state) {
          context.read<ProgressBloc>().add(
            ProgressEvent.getUserProgresses(userId: state.appUser.id),
          );
          context.read<AuthBloc>().add(const AuthEvent.getPremiumConfig());
        },
        child: BlocBuilder<SettingBloc, SettingState>(
          buildWhen:
              (previous, current) =>
                  previous.language != current.language ||
                  previous.theme != current.theme,
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Việt Lite',
              routerConfig: AppLocator.router.config(),
              locale: state.language.locale,
              theme: state.theme.theme,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [Locale('vi'), Locale('en')],
              builder: (context, child) {
                return GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
