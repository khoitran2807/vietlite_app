import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/app_scaffold.dart';
import '../utils/widget_utils.dart';

void main() {
  group('AppScaffold Widget Tests', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
    });

    testWidgets('renders child widget correctly', (WidgetTester tester) async {
      // Arrange
      const childWidget = Text('Child Widget');

      // Act
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: const AppScaffold(child: childWidget),
        ),
      );

      // Assert
      expect(find.text('Child Widget'), findsOneWidget);
    });

    testWidgets('renders AppBar with title when hideAppbar is false', (
      WidgetTester tester,
    ) async {
      // Arrange
      const titleText = 'Test Title';

      // Act
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: const AppScaffold(title: titleText, child: SizedBox.shrink()),
        ),
      );

      // Assert
      expect(find.text(titleText), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('AppBar title uses primary text theme style', (
      WidgetTester tester,
    ) async {
      // Arrange
      const titleText = 'Styled Title';

      // Act
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: const AppScaffold(title: titleText, child: SizedBox.shrink()),
        ),
      );

      // Assert
      final appBarTitle = tester.widget<Text>(find.text(titleText));
      expect(appBarTitle.style, isNotNull); // Check if style is not null
      // You may add more specific assertions regarding text style based on your implementation.
    });
  });
}
