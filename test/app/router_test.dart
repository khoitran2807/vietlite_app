import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';

void main() {
  late AppRouter appRouter;

  setUp(() {
    appRouter = AppRouter();
  });

  test('AppRouter has correct routes', () {
    final routes = appRouter.routes;

    // Ensure the routes contain expected paths and pages
    expect(routes.length, 4);

    // RootScreen Route with children
    expect(routes[0], isA<CustomRoute>());
    expect((routes[0] as CustomRoute).path, '/');
    expect((routes[0] as CustomRoute).page, RootScreenRoute.page);
    expect((routes[0] as CustomRoute).children!.routes.length, 13);
  });
}
