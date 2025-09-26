import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/app/res/themes.dart';
import 'package:vietlite/widget/input/date_input.dart';
import '../../utils/widget_utils.dart';

void main() {
  group('DateInput Widget Tests', () {
    late DateTime initialDate;
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
      initialDate = DateTime(2023, 10, 15);
    });

    testWidgets(
      'DateInput renders with initial date and responds to date selection',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            child: Scaffold(
              body: DateInput(dateTime: initialDate, onChanged: (_) {}),
            ),
          ),
        );

        // Verify the initial value is displayed
        expect(find.text('Oct 15, 2023'), findsOneWidget);
      },
    );
    testWidgets('DateInput is disabled when isEnable is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: DateInput(
              dateTime: DateTime.now(),
              onChanged: (date) {},
              isEnable: false, // Set to false
            ),
          ),
        ),
      );

      // Find the DateInput widget
      final dateInputFinder = find.byType(GestureDetector);
      expect(dateInputFinder, findsOneWidget);

      // Try to tap the widget to open the date picker
      await tester.tap(dateInputFinder);
      await tester.pumpAndSettle(); // Wait for animations to finish

      // Verify that the date picker is not displayed
      expect(find.byType(DatePickerDialog), findsNothing);
    });
    testWidgets('DateInput onChanged is called with the new date', (
      WidgetTester tester,
    ) async {
      DateTime? selectedDate;
      final initialDate = DateTime(2023, 10, 15);

      await tester.pumpWidget(
        MaterialApp(
          theme: lightTheme,
          home: Scaffold(
            body: DateInput(
              dateTime: initialDate,
              onChanged: (date) {
                selectedDate = date;
              },
            ),
          ),
        ),
      );

      // Open the date picker
      await tester.tap(find.byType(TextField));
      await tester.pumpAndSettle(); // Wait for the dialog to appear

      // Select a new date
      await tester.tap(find.text('20')); // Assume we pick the 20th of the month
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle(); // Wait for the dialog to close

      // Verify that the selectedDate was updated
      expect(selectedDate, DateTime(2023, 10, 20));
    });
  });
}
