import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/toast.dart';
import '../utils/widget_utils.dart';

void main() {
  group('ShowToast Widget Tests', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
    });
    testWidgets('ShowToast displays message in SnackBar', (
      WidgetTester tester,
    ) async {
      const message = 'Test Toast Message';

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Builder(
              builder: (context) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showToast(
                        context,
                        message,
                      ); // Call the showToast function
                    },
                    child: const Text('Show Toast'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      // Verify the button is present
      expect(find.text('Show Toast'), findsOneWidget);

      // Tap the button to trigger the showToast
      await tester.tap(find.text('Show Toast'));
      await tester.pump(); // Trigger a frame to show the SnackBar

      // Verify the SnackBar appears with the message
      expect(find.text(message), findsOneWidget);

      // Wait for the duration of the SnackBar (2 seconds)
      await tester.pump(const Duration(seconds: 2));
      expect(find.text(message), findsOneWidget);
    });
  });
}
