import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/app/res/themes.dart';
import 'package:vietlite/widget/input/time_input.dart';

import '../../utils/widget_utils.dart';

void main() {
  group('TimeInput Widget Tests', () {
    late TimeOfDay initialTime;
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
      initialTime = const TimeOfDay(hour: 12, minute: 30);
    });

    testWidgets(
      'TimeInput renders with initial time and responds to time selection',
      (WidgetTester tester) async {
        // Build the TimeInput widget wrapped in MaterialApp
        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            child: Scaffold(
              body: TimeInput(dateTime: initialTime, onChanged: (_) {}),
            ),
          ),
        );

        // Verify the initial value is displayed
        expect(find.text('12:30'), findsOneWidget);
      },
    );
    testWidgets('TimeInput is disabled when isEnable is false', (
      WidgetTester tester,
    ) async {
      // Build the TimeInput widget with isEnable set to false
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: TimeInput(
              dateTime: initialTime,
              onChanged: (time) {},
              isEnable: false,
            ),
          ),
        ),
      );

      // Find the TimeInput widget
      final timeInputFinder = find.byType(GestureDetector);
      expect(timeInputFinder, findsOneWidget);

      // Try to tap the widget to open the time picker
      await tester.tap(timeInputFinder);
      await tester.pumpAndSettle(); // Wait for animations to finish

      // Verify that the time picker is not displayed
      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('TimeInput selects a new time', (WidgetTester tester) async {
      TimeOfDay? selectedTime;
      TimeOfDay now = TimeOfDay.now();
      await tester.pumpWidget(
        MaterialApp(
          theme: lightTheme,
          home: Scaffold(
            body: TimeInput(
              dateTime: selectedTime,
              onChanged: (time) {
                selectedTime = time;
              },
            ),
          ),
        ),
      );

      // Open the time picker
      await tester.tap(find.byType(TimeInput));
      await tester.pumpAndSettle(); // Wait for the dialog to appear

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle(); // Wait for the dialog to close

      expect(selectedTime?.hour, equals(now.hour));
      expect(selectedTime?.minute, equals(now.minute));
    });
  });
}
