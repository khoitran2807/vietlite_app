import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/widget/input/input.dart';
import '../../utils/widget_utils.dart';

void main() {
  group('Input Widget Tests', () {
    late TextEditingController controller;
    setUpAll(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      setupRouterTest();
      controller = TextEditingController();
    });

    testWidgets('Input shows prefix and suffix icons when provided', (
      WidgetTester tester,
    ) async {
      // Build the widget with prefix and suffix icons
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Input.text(
              fieldKey: UniqueKey(),
              controller: controller,
              prefixIcon: const Icon(Icons.person),
              suffixIcon: const Icon(Icons.clear),
            ),
          ),
        ),
      );

      // Verify the icons are displayed
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.clear), findsOneWidget);
    });

    testWidgets('does not show suffix icon when suffixIcon is null', (
      WidgetTester tester,
    ) async {
      // Build the widget without a suffix icon
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Input.text(
              fieldKey: UniqueKey(),
              controller: controller,
              hintText: 'Enter text',
              suffixIcon: null, // Explicitly set suffixIcon to null
            ),
          ),
        ),
      );

      // Verify that no suffix icon is displayed
      expect(find.byIcon(Icons.clear), findsNothing);
      expect(find.byType(SvgPicture), findsNothing);
    });

    testWidgets('Input is disabled when isEnable is false', (
      WidgetTester tester,
    ) async {
      // Create a controller to test the input changes
      final controller = TextEditingController();

      // Build the widget with isEnable set to false
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Input.text(
              fieldKey: UniqueKey(),
              controller: controller,
              isEnable: false,
            ),
          ),
        ),
      );

      // Verify that the TextFormField is disabled
      final textField = find.byType(TextFormField);
      final textFieldWidget = tester.widget<TextFormField>(textField);
      expect(textFieldWidget.enabled, isFalse);
    });

    testWidgets('shows password visibility toggle icon when obscure is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Input.password(
              fieldKey: UniqueKey(),
              controller: controller,
              hintText: 'Enter password',
            ),
          ),
        ),
      );

      // Initially, the eye icon should be visible
      expect(find.byType(SvgPicture), findsOneWidget);
      expect(
        find.byKey(const ValueKey('eyeIcon')),
        findsOneWidget,
      ); // Check for the eye icon

      // Tap the toggle to reveal the password
      await tester.tap(find.byType(SvgPicture));
      await tester.pumpAndSettle(); // Let the UI settle

      // Now, the eyeSlash icon should be visible
      expect(
        find.byKey(const ValueKey('eyeSlashIcon')),
        findsOneWidget,
      ); // Check for the eye slash icon
    });

    testWidgets('renders input.email with correct hint text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Input.email(
              fieldKey: UniqueKey(),
              controller: controller,
              hintText: 'Enter your email',
            ),
          ),
        ),
      );
      expect(find.text('Enter your email'), findsOneWidget);
    });

    testWidgets('renders input.number with correct hint text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Input.number(
              fieldKey: UniqueKey(),
              controller: controller,
              hintText: 'Enter a number',
            ),
          ),
        ),
      );
      expect(find.text('Enter a number'), findsOneWidget);
    });

    testWidgets('renders input.double with correct hint text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          child: Scaffold(
            body: Input.double(
              fieldKey: UniqueKey(),
              controller: controller,
              hintText: 'Enter a double value',
            ),
          ),
        ),
      );
      expect(find.text('Enter a double value'), findsOneWidget);
    });

    testWidgets(
      'shows InkWell when suffixIcon is null and clears text on tap',
      (WidgetTester tester) async {
        // Mock onChanged callback
        bool onChangedCalled = false;
        void mockOnChanged(String value) {
          onChangedCalled = true;
        }

        // Build the widget with initial text and the mock onChanged
        controller.text = 'Some text';
        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            child: Scaffold(
              body: Input.text(
                fieldKey: UniqueKey(),
                controller: controller,
                hintText: 'Enter text',
                suffixIcon: null, // Set suffixIcon to null
                onChanged: mockOnChanged, // Set the mock onChanged
              ),
            ),
          ),
        );
        // Ensure that an InkWell is present in the widget tree
        expect(find.byType(InkWell), findsOneWidget);
        // Ensure the text is initially present
        expect(controller.text, 'Some text');
        // Ensure that the InkWell can clear the text field
        final inkWell = tester.widget<InkWell>(find.byType(InkWell));
        expect(inkWell.onTap, isNotNull);
        // Tap the InkWell to clear the text field
        await tester.tap(find.byType(InkWell));
        await tester.pumpAndSettle(); // Wait for all animations and updates
        // Verify that the text field is cleared
        expect(controller.text, isEmpty);
        // Verify that the onChanged callback was called
        expect(onChangedCalled, isTrue);
      },
    );

    testWidgets('changes text inside TextFormField and invokes onChanged', (
      WidgetTester tester,
    ) async {
      String? updatedValue;

      // Create the input widget
      await tester.pumpWidget(
        MaterialApp(
          home: WidgetUtils.getScopedWidget(
            child: Scaffold(
              body: Input.text(
                fieldKey: UniqueKey(),
                controller: controller,
                onChanged: (value) {
                  updatedValue = value;
                },
              ),
            ),
          ),
        ),
      );

      // Find the TextFormField in the widget tree
      final textFieldFinder = find.byType(TextFormField);

      // Ensure the TextFormField is present
      expect(textFieldFinder, findsOneWidget);

      await tester.tap(textFieldFinder);
      await tester.pumpAndSettle();

      // Enter some text into the TextFormField
      await tester.enterText(textFieldFinder, 'Test Input');
      await tester.pumpAndSettle();

      // Verify that the onChanged callback was called with the correct value
      expect(updatedValue, 'Test Input');
    });
  });
}
