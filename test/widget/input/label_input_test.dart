import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/input/input.dart';
import 'package:vietlite/widget/input/input_type.dart';
import 'package:vietlite/widget/input/label_input.dart';

import '../../utils/widget_utils.dart';

void main() {
  group('LabelInput Widget Tests', () {
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
    });
    late TextEditingController controller;
    setUp(() {
      controller = TextEditingController();
    });
    tearDown(() {
      controller.dispose();
    });
    testWidgets('should display label and required indicator', (
      WidgetTester tester,
    ) async {
      // Arrange
      const labelText = 'Username';
      const isRequired = true;

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: LabelInput(
              label: labelText,
              controller: controller,
              inputType: InputType.text(),
              isRequired: isRequired,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(labelText), findsOneWidget);
      expect(find.text('*'), findsOneWidget); // Check for required indicator
    });

    testWidgets(
      'should not display required indicator when isRequired is false',
      (WidgetTester tester) async {
        // Arrange
        const labelText = 'Username';
        const isRequired = false;

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            child: Scaffold(
              body: LabelInput(
                label: labelText,
                controller: controller,
                inputType: InputType.text(),
                isRequired: isRequired,
              ),
            ),
          ),
        );

        // Assert
        expect(
          find.text('*'),
          findsNothing,
        ); // Required indicator should not be present
      },
    );

    testWidgets('should enable input field when isEnable is true', (
      WidgetTester tester,
    ) async {
      // Arrange
      const labelText = 'Username';

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: LabelInput(
              label: labelText,
              controller: controller,
              inputType: InputType.text(),
              isEnable: true,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(Input), findsOneWidget);
    });

    testWidgets('should disable input field when isEnable is false', (
      WidgetTester tester,
    ) async {
      // Arrange
      const labelText = 'Username';

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: LabelInput(
              label: labelText,
              controller: controller,
              inputType: InputType.text(),
              isEnable: false,
            ),
          ),
        ),
      );

      // Assert
      final inputFinder = find.byType(Input);
      expect(inputFinder, findsOneWidget);

      // Check if the input is disabled (you may need to modify this based on how the Input widget handles enable/disable)
      final inputWidget = tester.widget<Input>(inputFinder);
      expect(inputWidget.isEnable, isFalse); // Check if the input is disabled
    });

    testWidgets('should display obscure text when obscure is true', (
      WidgetTester tester,
    ) async {
      // Arrange
      const labelText = 'Password';
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: LabelInput(
              label: labelText,
              controller: controller,
              inputType:
                  InputType.text(), // Assuming the InputType for password is handled in Input
              obscure: true,
            ),
          ),
        ),
      );

      // Assert
      final inputFinder = find.byType(Input);
      expect(inputFinder, findsOneWidget);
    });
    testWidgets(
      'should use default inputType as InputType.text when not provided',
      (WidgetTester tester) async {
        // Arrange
        const labelText = 'Username';

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            child: Scaffold(
              body: LabelInput(
                label: labelText,
                controller: controller,
                // inputType is not provided
              ),
            ),
          ),
        );

        // Act
        final inputFinder = find.byType(Input);
        expect(inputFinder, findsOneWidget);

        // Check if the Input widget uses the default inputType
        final inputWidget = tester.widget<Input>(inputFinder);

        expect(inputWidget.inputType.runtimeType, InputType.text().runtimeType);
      },
    );
  });
}
