import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/module/user/widget/onboarding_layout.dart';

import '../utils/common_mocks.dart';
import '../utils/widget_utils.dart';

void main() {
  late AppRouterMock appRouterMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    appRouterMock = AppRouterMock();
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
  });

  Widget createMobileWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      child: MediaQuery(
        data: MediaQueryData(size: WidgetUtils.mobileTestSize),
        child: const OnboardingLayout(child: Text('Test Child')),
      ),
    );
  }

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      child: const OnboardingLayout(child: Text('Test Child')),
    );
  }

  group('OnboardingLayout Tests', () {
    testWidgets('displays correctly on mobile', (tester) async {
      await tester.pumpWidget(createMobileWidgetUnderTest());

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('displays correctly on tablet', (tester) async {
      tester.view.physicalSize = const Size(900, 800);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('displays correctly on desktop', (tester) async {
      tester.view.physicalSize = const Size(1400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createWidgetUnderTest());

      final onboardingLayoutFinder = find.byType(OnboardingLayout);
      expect(onboardingLayoutFinder, findsOneWidget);

      final container = tester.widget<Container>(
        find
            .descendant(
              of: onboardingLayoutFinder,
              matching: find.byType(Container),
            )
            .last,
      );
      const expectedWidth = 1194 * 0.44;

      expect(container.constraints!.maxWidth, closeTo(expectedWidth, 10));
    });
  });
}
