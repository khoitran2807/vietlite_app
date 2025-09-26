import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/radio_item.dart'; // Adjust the import path if needed
import '../utils/widget_utils.dart';

void main() {
  group('RadioItem Widget Tests', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
    });
    testWidgets('RadioItem is not selectable when onChanged is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: const Scaffold(
            body: Column(
              children: [
                RadioItem<String>(
                  groupValue: 'male',
                  value: 'male',
                  onChanged: null, // No change handler
                ),
                RadioItem<String>(
                  groupValue: 'female',
                  value: 'female',
                  onChanged: null, // No change handler
                ),
              ],
            ),
          ),
        ),
      );

      final maleRadioFinder = find.byWidgetPredicate(
        (widget) => widget is Radio<String> && widget.value == 'male',
      );
      final femaleRadioFinder = find.byWidgetPredicate(
        (widget) => widget is Radio<String> && widget.value == 'female',
      );
      await tester.tap(maleRadioFinder);
      await tester.pumpAndSettle();
      expect(
        tester.widget<Radio<String>>(maleRadioFinder).groupValue,
        equals('male'),
      );

      await tester.tap(femaleRadioFinder);
      await tester.pumpAndSettle();
      expect(
        tester.widget<Radio<String>>(femaleRadioFinder).groupValue,
        equals('female'),
      );
    });
  });
}
