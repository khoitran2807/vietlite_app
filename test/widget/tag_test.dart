import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/enum/theme_code.dart';
import 'package:vietlite/widget/tag.dart';

void main() {
  group('Tag Widget Tests', () {
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });
    testWidgets('Tag displays child widget and background color', (
      WidgetTester tester,
    ) async {
      const childWidget = Text(
        'Test Tag',
        style: TextStyle(color: Colors.white),
      );
      const tagColor = Colors.blue;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeCode.light.theme,
          home: const Scaffold(body: Tag(color: tagColor, child: childWidget)),
        ),
      );
      expect(find.text('Test Tag'), findsOneWidget);
      final container = tester.widget<Container>(find.byType(Container).first);
      expect((container.decoration as BoxDecoration).color, tagColor);
    });
  });
}
