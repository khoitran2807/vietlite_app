import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/di/locator.shorten.dart';

import 'common_mocks.dart';
import 'frame_wrapper.dart';

class WidgetUtils {
  static getScopedWidget({
    required Widget child,
    final List<BlocProvider>? providers,
  }) {
    return RouteDataScope(
      routeData: RouteData(
        stackKey: const Key(''),
        type: const RouteType.adaptive(),
        router: AppLocator.router,
        route: RouteMatch(
          segments: const [''],
          config: AutoRoute(
            page: PageInfo(
              'MaterialRootRoute',
              builder: (_) => const SizedBox(),
            ),
            path: '',
          ),
          stringMatch: '',
          key: const ValueKey('MaterialRootRoute'),
        ),
        pendingChildren: [],
      ),
      child: RouterScope(
        controller: AppLocator.router,
        inheritableObserversBuilder: () => [],
        navigatorObservers: const [],
        stateHash: 0,
        child: StackRouterScope(
          controller: AppLocator.router,
          stateHash: 0,
          child:
              (providers != null)
                  ? MultiBlocProviderFrameWrapper(
                    providers: providers,
                    child: child,
                  )
                  : AppFrameWrapper(child: child),
        ),
      ),
    );
  }

  static Size get mobileTestSize => const Size(400, 800);
  static Size get tabletTestSize => const Size(800, 800);
}

void setupRouterTest() {
  late AppRouter appRouterMock;
  appRouterMock = AppRouterMock();
  when(() => appRouterMock.maybePop()).thenAnswer((invocation) async => true);
  GetIt.instance.registerSingleton(appRouterMock);
}
