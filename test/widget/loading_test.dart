import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/loading.dart';

import '../utils/widget_utils.dart';

void main() {
  group('Loading Widget Tests', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
    });

    testWidgets('Loading.small() renders correctly', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(child: Scaffold(body: Loading.small())),
      );
      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('Loading.medium() renders correctly', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(child: Scaffold(body: Loading.medium())),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('Loading.large() renders correctly', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(child: Scaffold(body: Loading.large())),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
    });
    testWidgets('Loading widget size is correct', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Column(
              children: [Loading.small(), Loading.medium(), Loading.large()],
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(SizedBox).at(0), findsOneWidget);
      expect(tester.widget<SizedBox>(find.byType(SizedBox).at(0)).height, 24);
      expect(tester.widget<SizedBox>(find.byType(SizedBox).at(0)).width, 24);

      expect(find.byType(SizedBox).at(1), findsOneWidget);
      expect(tester.widget<SizedBox>(find.byType(SizedBox).at(1)).height, 36);
      expect(tester.widget<SizedBox>(find.byType(SizedBox).at(1)).width, 36);

      expect(find.byType(SizedBox).at(2), findsOneWidget);
      expect(tester.widget<SizedBox>(find.byType(SizedBox).at(2)).height, 50);
      expect(tester.widget<SizedBox>(find.byType(SizedBox).at(2)).width, 50);
    });
  });

  group('StackLoading Widget Tests', () {
    testWidgets('Hides loading when processing is false', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StackLoading.small(
              processing: false,
              child: const Text('Child widget'),
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Child widget'), findsOneWidget);
    });

    testWidgets('Hides loading when processing is false', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StackLoading.medium(
              processing: false,
              loading: Loading.medium(),
              child: const Text('Child widget'),
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Child widget'), findsOneWidget);
    });

    testWidgets('Hides loading when processing is false', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StackLoading.large(
              processing: false,
              child: const Text('Child widget'),
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Child widget'), findsOneWidget);
    });

    testWidgets('SteckLoading show loading when processing changes to true', (
      WidgetTester tester,
    ) async {
      bool processing = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return StackLoading.small(
                  processing: processing,
                  child: const Text('Child widget'),
                );
              },
            ),
          ),
        ),
      );

      // Assert after state change
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Child widget'), findsOneWidget);
    });

    testWidgets('StackLoading hide loading when processing changes to false', (
      WidgetTester tester,
    ) async {
      bool processing = true;

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return StackLoading.small(
                  processing: processing,
                  child: const Text('Child widget'),
                );
              },
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Child widget'), findsOneWidget);
    });
  });
}
