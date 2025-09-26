import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/button.dart';

import '../utils/widget_utils.dart';

void main() {
  group('Button Widget Tests', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
    });

    testWidgets('Button renders with correct text and responds to tap', (
      WidgetTester tester,
    ) async {
      // Track if the onPressed callback is called
      bool wasPressed = false;

      // Build the widget
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Button.primary(
              buttonName: 'Test Button',
              onPressed: () {
                wasPressed = true;
              },
            ),
          ),
        ),
      );

      // Find the button by text
      final buttonFinder = find.text('Test Button');
      expect(buttonFinder, findsOneWidget);

      // Tap the button
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      // Verify that the onPressed callback was called
      expect(wasPressed, isTrue);
    });

    testWidgets('Button displays prefix and suffix icons when provided', (
      WidgetTester tester,
    ) async {
      // Build the widget with prefix and suffix icons
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Button.primary(
              buttonName: 'Test Button',
              prefixIcon: const Icon(Icons.add),
              suffixIcon: const Icon(Icons.arrow_forward),
              onPressed: () {},
            ),
          ),
        ),
      );

      // Find the button and icons
      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('Button is disabled when onPressed is null', (
      WidgetTester tester,
    ) async {
      // Build the widget with onPressed null
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Button.primary(
              buttonName: 'Disabled Button',
              onPressed: null,
            ),
          ),
        ),
      );

      // Find the button
      final buttonFinder = find.text('Disabled Button');
      expect(buttonFinder, findsOneWidget);

      // Try to tap the button
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
    });

    testWidgets('Button.disabled factory creates a disabled button', (
      WidgetTester tester,
    ) async {
      // Build widget using the disabled factory
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Button.disabled(buttonName: 'Disabled Factory'),
          ),
        ),
      );

      // The button text should be rendered
      expect(find.text('Disabled Factory'), findsOneWidget);

      // The underlying ElevatedButton should have onPressed == null (disabled)
      final elevated = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(elevated.onPressed, isNull);

      // Tapping should not throw and nothing should change
      await tester.tap(find.text('Disabled Factory'));
      await tester.pumpAndSettle();
    });
  });
}
