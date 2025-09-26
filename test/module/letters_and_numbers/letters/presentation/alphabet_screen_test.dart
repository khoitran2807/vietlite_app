import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/res/images.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/module/letters_and_numbers/letters/presentation/alphabet_screen.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart' show WidgetUtils;

void main() {
  group('AlphabetScreen', () {
    late AppRouterMock appRouterMock;

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      appRouterMock = AppRouterMock();

      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    });

    tearDown(() {
      GetIt.instance.reset();
    });

    Widget createWidgetUnderTest() {
      return WidgetUtils.getScopedWidget(
        child: const Scaffold(body: AlphabetScreen()),
      );
    }

    testWidgets('renders title and alphabet image', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Alphabet'), findsOneWidget);

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsOneWidget);

      final Image imageWidget = tester.widget(imageFinder);
      expect((imageWidget.image as AssetImage).assetName, AppImages.alphabet);
    });
  });
}
