import 'package:auto_route/auto_route.dart';
import 'package:vietlite/di/locator.dart';
import 'package:vietlite/plugin/firebase/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'app_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route,Screen')
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRouteGuard> guards = [
    AutoRouteGuard.simple((resolver, router) {
      if (locator<AuthService>().user != null ||
          resolver.routeName == LoginScreenRoute.name ||
          resolver.routeName == ForgetPasswordScreenRoute.name ||
          resolver.routeName == RegisterScreenRoute.name ||
          resolver.routeName == PrivacyPolicyScreenRoute.name ||
          resolver.routeName == TermsScreenRoute.name) {
        // we continue navigation
        resolver.next();
      } else {
        // else we navigate to the Login page so we get authenticated
        resolver.redirect(const LoginScreenRoute());
      }
    }),
    // add more guards here
  ];

  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      path: '/',
      page: RootScreenRoute.page,
      transitionsBuilder: TransitionsBuilders.noTransition,
      children: [
        AutoRoute(path: 'home', page: HomeScreenRoute.page, initial: true),
        CustomRoute(
          path: 'lettersAndNumbers',
          page: LettersAndNumbersScreenRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            AutoRoute(
              path: 'letters',
              page: LettersScreenRoute.page,
              initial: true,
            ),
            AutoRoute(path: 'numbers', page: NumbersScreenRoute.page),
          ],
        ),
        AutoRoute(path: 'alphabet', page: AlphabetScreenRoute.page),
        AutoRoute(
          path: 'lettersAndNumbers/letters/:id',
          page: LetterDetailScreenRoute.page,
        ),
        AutoRoute(
          path: 'lettersAndNumbers/numbers/:id',
          page: NumberDetailScreenRoute.page,
        ),
        CustomRoute(
          path: 'wordsAndSentences',
          page: WordsAndSentencesScreenRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            AutoRoute(
              path: 'wordSelection',
              page: WordSelectionScreenRoute.page,
              initial: true,
            ),
            AutoRoute(path: 'wordMatch', page: WordMatchScreenRoute.page),
          ],
        ),
        AutoRoute(
          path: 'wordsAndSentences/wordSelection/:id',
          page: WordSelectionDetailScreenRoute.page,
        ),
        AutoRoute(
          path: 'wordsAndSentences/wordMatch/:id',
          page: WordMatchDetailScreenRoute.page,
        ),
        AutoRoute(path: 'discover', page: DiscoverScreenRoute.page),
        AutoRoute(path: 'discover/things/:type', page: ThingsScreenRoute.page),
        AutoRoute(
          path: 'discover/thing-list/:id',
          page: ThingDetailScreenRoute.page,
        ),
        AutoRoute(path: 'setting', page: SettingScreenRoute.page),
      ],
    ),
    AutoRoute(path: '/login', page: LoginScreenRoute.page),
    AutoRoute(path: '/forget-password', page: ForgetPasswordScreenRoute.page),
    AutoRoute(path: '/register', page: RegisterScreenRoute.page),
    AutoRoute(path: '/privacyPolicy', page: PrivacyPolicyScreenRoute.page),
    AutoRoute(path: '/terms', page: TermsScreenRoute.page),
  ];
}
