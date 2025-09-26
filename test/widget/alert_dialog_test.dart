import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/res/themes.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/widget/alert_dialog.dart';
import 'package:mocktail/mocktail.dart';
import '../utils/common_mocks.dart';
import '../utils/widget_utils.dart';

void main() {
  late AppRouter appRouterMock;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    appRouterMock = AppRouterMock();
    GetIt.instance.registerSingleton(appRouterMock);
  });

  tearDown(() {
    reset(appRouterMock);
  });

  group('DialogBody Widget Tests', () {
    testWidgets('renders title, content, and buttons correctly', (
      WidgetTester tester,
    ) async {
      const testTitle = 'Test Title';
      const testContent = 'This is test content';
      const testButtonName = 'OK';
      const testButton2 = 'Cancel';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetUtils.getScopedWidget(
              child: const DialogBody(
                title: testTitle,
                content: testContent,
                buttonName: testButtonName,
                buttonName2: testButton2,
              ),
            ),
          ),
        ),
      );

      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testContent), findsOneWidget);
      expect(find.text(testButtonName), findsOneWidget);
      expect(find.text(testButton2), findsOneWidget);
    });

    testWidgets('calls onTap when primary button is pressed', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetUtils.getScopedWidget(
              child: DialogBody(
                title: 'Test Title',
                content: 'This is test content',
                buttonName: 'OK',
                onTap: () {
                  wasPressed = true;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(wasPressed, isTrue);
    });

    testWidgets('calls onTap2 when secondary button is pressed', (
      WidgetTester tester,
    ) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WidgetUtils.getScopedWidget(
              child: DialogBody(
                title: 'Test Title',
                content: 'This is test content',
                buttonName: 'OK',
                buttonName2: 'Cancel',
                onTap2: () {
                  wasPressed = true;
                },
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(wasPressed, isTrue);
    });

    testWidgets(
      'does not throw when onTap is null and fallback maybePop is used',
      (tester) async {
        when(() => appRouterMock.maybePop()).thenAnswer((_) async => true);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetUtils.getScopedWidget(
                child: const DialogBody(
                  title: 'Test Title',
                  content: 'This is test content',
                  buttonName: 'OK',
                  onTap: null, // fallback -> maybePop()
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        verify(() => appRouterMock.maybePop()).called(1);
      },
    );

    testWidgets(
      'does not call onTap2 when onTap is null and fallback maybePop is used',
      (WidgetTester tester) async {
        when(() => appRouterMock.maybePop()).thenAnswer((_) async => true);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetUtils.getScopedWidget(
                child: const DialogBody(
                  title: 'Test Title',
                  content: 'This is test content',
                  buttonName: 'OK',
                  buttonName2: 'Cancel',
                  onTap2: null, // Set onTap2 to null
                ),
              ),
            ),
          ),
        );
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();

        verify(() => appRouterMock.maybePop()).called(1);
      },
    );

    testWidgets(
      'does not throw when onTap2 is null and fallback maybePop is used',
      (tester) async {
        // Stub fallback
        when(() => appRouterMock.maybePop()).thenAnswer((_) async => true);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetUtils.getScopedWidget(
                child: const DialogBody(
                  title: 'Test Title',
                  content: 'This is test content',
                  buttonName: 'OK',
                  buttonName2: 'Cancel',
                  onTap2: null, // fallback -> maybePop()
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();

        verify(() => appRouterMock.maybePop()).called(1);
      },
    );

    testWidgets(
      'does not close dialog when tapped outside if barrierDismissible is true',
      (WidgetTester tester) async {
        when(() => appRouterMock.maybePop()).thenAnswer((_) async => true);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetUtils.getScopedWidget(
                child: const DialogBody(
                  title: 'Test Title',
                  content: 'This is test content',
                  buttonName: 'OK',
                  barrierDismissible: true,
                ),
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.close), findsOneWidget);

        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();

        // ✅ Verify fallback called
        verify(() => appRouterMock.maybePop()).called(1);
      },
    );

    testWidgets(
      'should display the dialog with correct title, content, and buttons',
      (WidgetTester tester) async {
        const testTitle = 'Test Title';
        const testContent = 'This is test content';
        const testButtonName = 'OK';
        const testButton2 = 'Cancel';

        await tester.pumpWidget(
          MaterialApp(
            theme: darkTheme,
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showAppDialog(
                          context: context,
                          titleName: testTitle,
                          content: testContent,
                          buttonName: testButtonName,
                          buttonName2: testButton2,
                        );
                      },
                      child: const Text('Show Dialog'),
                    ),
                  );
                },
              ),
            ),
          ),
        );
        // Tap the button to show the dialog
        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle(); // Wait for the dialog to appear

        // Verify dialog title and content
        expect(find.text(testTitle), findsOneWidget);
        expect(find.text(testContent), findsOneWidget);
        expect(find.text(testButtonName), findsOneWidget);
        expect(find.text(testButton2), findsOneWidget);
      },
    );

    testWidgets(
      'closes dialog when close icon is tapped and barrierDismissible is true',
      (WidgetTester tester) async {
        when(() => appRouterMock.maybePop()).thenAnswer((_) async => true);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetUtils.getScopedWidget(
                child: const DialogBody(
                  title: 'Test Title',
                  content: 'This is test content',
                  buttonName: 'OK',
                  barrierDismissible: true,
                ),
              ),
            ),
          ),
        );

        final closeButton = find.byIcon(Icons.close);
        expect(closeButton, findsOneWidget);

        // Tap icon close
        await tester.tap(closeButton);
        await tester.pumpAndSettle();

        verify(() => appRouterMock.maybePop()).called(1);
      },
    );

    testWidgets(
      'taps close icon inside body (CircleAvatar) triggers maybePop',
      (WidgetTester tester) async {
        when(() => appRouterMock.maybePop()).thenAnswer((_) async => true);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetUtils.getScopedWidget(
                child: DialogBody(
                  body: Container(width: 100, height: 100, color: Colors.red),
                  barrierDismissible: true,
                ),
              ),
            ),
          ),
        );

        // Tìm CircleAvatar close icon inside body
        final closeCircle = find.byType(CircleAvatar);
        expect(closeCircle, findsOneWidget);

        await tester.tap(closeCircle);
        await tester.pumpAndSettle();

        verify(() => appRouterMock.maybePop()).called(1);
      },
    );
    testWidgets(
      'calls maybePop when primary button is pressed and onTap is null (with 2 buttons)',
      (WidgetTester tester) async {
        // Stub cho maybePop
        when(() => appRouterMock.maybePop()).thenAnswer((_) async => true);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WidgetUtils.getScopedWidget(
                child: const DialogBody(
                  title: 'Test Title',
                  content: 'This is test content',
                  buttonName: 'OK',
                  buttonName2: 'Cancel',
                  onTap: null, // Fallback -> maybePop()
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        verify(() => appRouterMock.maybePop()).called(1);
      },
    );
  });
}
