import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/checkbox_item.dart';
import '../utils/widget_utils.dart';

void main() {
  group('CheckboxItem Tests', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
    });

    testWidgets('displays the correct text and responds to taps', (
      WidgetTester tester,
    ) async {
      // Arrange
      bool checkboxValue = false;

      // Create the onChanged callback
      void onChanged(bool value) {
        checkboxValue = value;
      }

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: CheckboxItem(
              onChanged: onChanged,
              value: checkboxValue,
              text: 'Test Checkbox',
            ),
          ),
        ),
      );

      // Act & Assert
      // Verify the initial state
      expect(find.text('Test Checkbox'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
      expect((tester.widget(find.byType(Checkbox)) as Checkbox).value, isFalse);

      // Tap the checkbox to change its state
      await tester.tap(find.byType(Checkbox));
      await tester.pump(); // Rebuild the widget

      // Verify that the onChanged callback was called with the correct value
      expect(checkboxValue, isTrue); // checkboxValue should now be true
    });

    testWidgets('does not change value when onChanged is a no-op', (
      WidgetTester tester,
    ) async {
      // Arrange
      bool checkboxValue = false;

      // Create a no-op onChanged callback
      void onChanged(bool value) {
        // Do nothing
      }

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: CheckboxItem(
              onChanged: onChanged,
              value: checkboxValue,
              text: 'Test Checkbox',
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Verify that the checkbox value has not changed
      expect(
        (tester.widget(find.byType(Checkbox)) as Checkbox).value,
        isFalse,
      ); // Should remain unchecked
    });
  });
}
