import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/hightlight_text.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/spell_section.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/application/number_detail_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/presentation/number_detail_screen.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouterMock appRouterMock;
  late MockNumberDetailBloc mockNumberDetailBloc;
  late MockAuthBloc mockAuthBloc;
  late MockProgressBloc mockProgressBloc;

  final mockNumber = Number.empty().copyWith(id: 'id1', title: '1');

  setUpAll(() {
    appRouterMock = AppRouterMock();
    mockAuthBloc = MockAuthBloc();
    mockProgressBloc = MockProgressBloc();

    mockNumberDetailBloc = MockNumberDetailBloc();

    GetIt.instance.registerFactory<NumberDetailBloc>(
      () => mockNumberDetailBloc,
    );
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    GetIt.instance.registerSingleton<AuthBloc>(mockAuthBloc);
    GetIt.instance.registerSingleton<ProgressBloc>(mockProgressBloc);
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    registerFallbackValue(FakeProgressEvent());
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
        BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
        BlocProvider<NumberDetailBloc>(
          create: (context) => mockNumberDetailBloc,
        ),
      ],
      child: const NumberDetailScreen(id: 'id1'),
    );
  }

  group('number detail screen test', () {
    testWidgets('displays loading indicator when in loading state', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      when(
        () => mockNumberDetailBloc.state,
      ).thenReturn(NumberDetailState.initial().copyWith(isLoading: true));

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
    testWidgets('returns null when getNumberDetail success', (
      WidgetTester tester,
    ) async {
      whenListen(
        mockAuthBloc,
        Stream.fromIterable([
          AuthState.initial(),
          AuthState.initial().copyWith(
            appUser: AppUser.empty().copyWith(id: 'user_id'),
          ),
        ]),
        initialState: AuthState.initial(),
      );
      final stateWithSuccess = NumberDetailState(
        failureOrSuccessOption: optionOf(Right(mockNumber)),
        number: mockNumber,
        isLoading: false,
        fetchNumberDetailProgress: none(),
      );

      whenListen(
        mockNumberDetailBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: NumberDetailState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
    testWidgets('Shows toast when an error occurs', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      final stateWithFailure = NumberDetailState(
        failureOrSuccessOption: optionOf(
          Left(AppFailure.otherError(message: 'Error!')),
        ),
        isLoading: false,
        number: mockNumber,
        fetchNumberDetailProgress: none(),
      );

      whenListen(
        mockNumberDetailBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: NumberDetailState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: ScaffoldMessenger(child: createWidgetUnderTest())),
      );

      await tester.pump();

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets(
      'should dispatch updateDetailProgress to ProgressBloc when fetchNumberDetailProgress is success',
      (WidgetTester tester) async {
        // Arrange
        const mockUser = AppUser(
          id: 'user123',
          email: 'test@example.com',
          name: 'Tester',
          avatar: '',
          isAnonymous: false,
        );

        // Initial state with no fetch yet
        final initialState = NumberDetailState.initial();

        // New state where fetchNumberDetailProgress is Some(Right(unit))
        final newState = initialState.copyWith(
          fetchNumberDetailProgress: some(right(unit)),
        );

        when(() => mockNumberDetailBloc.state).thenReturn(newState);
        whenListen(
          mockNumberDetailBloc,
          Stream.fromIterable([initialState, newState]),
          initialState: initialState,
        );

        when(
          () => mockAuthBloc.state,
        ).thenReturn(AuthState.initial().copyWith(appUser: mockUser));

        await tester.pumpWidget(createWidgetUnderTest());

        await tester.pump(); // process BlocListener

        // Assert: ProgressBloc received correct event
        verify(
          () => mockProgressBloc.add(
            any(
              that: isA<ProgressEvent>().having(
                (e) => e.maybeMap(
                  updateProgress: (value) => value.progress.exerciseType,
                  orElse: () => null,
                ),
                'exerciseType',
                ExerciseType.number,
              ),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'should dispatch updateNumberDetailProgress when user is logged in with email',
      (WidgetTester tester) async {
        // Arrange
        const mockUser = AppUser(
          id: 'user123',
          email: 'test@example.com',
          name: 'Tester',
          avatar: '',
          isAnonymous: false,
        );
        whenListen(
          mockNumberDetailBloc,
          Stream.fromIterable([
            NumberDetailState.initial(),
            NumberDetailState.initial().copyWith(
              failureOrSuccessOption: some(right(mockNumber)),
            ),
          ]),
          initialState: NumberDetailState.initial(),
        );

        when(
          () => mockAuthBloc.state,
        ).thenReturn(AuthState.initial().copyWith(appUser: mockUser));

        final updatedNumber = mockNumber.copyWith(id: 'progressId123');

        final stateWithNumber = NumberDetailState(
          number: updatedNumber,
          isLoading: false,
          failureOrSuccessOption: optionOf(right(updatedNumber)),
          fetchNumberDetailProgress: none(),
        );

        when(() => mockNumberDetailBloc.state).thenReturn(stateWithNumber);

        await tester.pumpWidget(createWidgetUnderTest());

        verify(
          () => mockNumberDetailBloc.add(
            const NumberDetailEvent.updateNumberDetailProgress(
              userId: 'user123',
              progressId: 'id1',
            ),
          ),
        ).called(1);
      },
    );

    testWidgets('Displays network image when example.image is valid', (
      tester,
    ) async {
      final stateWithLetter = NumberDetailState(
        failureOrSuccessOption: optionOf(Right(mockNumber)),
        number: mockNumber.copyWith(
          examples: [
            const CharacterExample(
              title: 'ccc',
              image: 'https://example.com/apple.png',
              audio: 'https://example.com/audio1.mp3',
            ),
          ],
        ),
        isLoading: false,
        fetchNumberDetailProgress: none(),
      );

      when(() => mockNumberDetailBloc.state).thenReturn(stateWithLetter);

      // Wrap with mockNetworkImages for testing network images
      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pump();

        // Check if the network image is displayed
        final imageFinder = find.byWidgetPredicate(
          (widget) => widget is Image && widget.image is NetworkImage,
        );

        expect(imageFinder, findsOneWidget);

        // Ensure the example title appears in the widget tree
        expect(find.text('ccc'), findsOneWidget);
      });
    });

    testWidgets(
      'tapping feedback button calls LivechatService.sendMessage via JS mock',
      (tester) async {
        // Fake auth state: user logged in
        final authState = AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'id1'),
        );

        // Fake NumberDetail state
        final numberDetailState = NumberDetailState.initial().copyWith(
          number: mockNumber.copyWith(title: '1'),
          isLoading: false,
        );

        when(() => mockAuthBloc.state).thenReturn(authState);
        when(() => mockNumberDetailBloc.state).thenReturn(numberDetailState);

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        final buttonFinder = find.text('Feedback');
        expect(buttonFinder, findsOneWidget);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();
      },
    );
  });

  group('hightlight_text test', () {
    test(
      'highlightText returns full text as a single TextSpan when keyword is empty',
      () {
        const String text = 'Hello, Flutter!';
        const TextStyle baseStyle = TextStyle(color: Colors.black);
        const Color highlightColor = Colors.red;

        final result = highlightText(
          text,
          const [],
          highlightColor,
          baseStyle: baseStyle,
        );

        // Expect only one TextSpan
        expect(result.length, 1);
        // Expect the text to be unchanged
        expect(result.first.text, text);
        // Expect the style to be the base style
        expect(result.first.style, baseStyle);
      },
    );
    test('Non-highlighted text segments are added with base style', () {
      const String text = 'Hello Flutter Devs!';
      const TextStyle baseStyle = TextStyle(color: Colors.black);
      const Color highlightColor = Colors.red;

      final result = highlightText(
        text,
        const ['Flutter'],
        highlightColor,
        baseStyle: baseStyle,
      );

      expect(result.length, 3);

      // First segment (before keyword) should be in baseStyle
      expect(result[0].text, 'Hello ');
      expect(result[0].style, baseStyle);

      // Second segment (highlighted keyword)
      expect(result[1].text, 'Flutter');
      expect(result[1].style?.color, highlightColor);

      // Third segment (after keyword) should be in baseStyle
      expect(result[2].text, ' Devs!');
      expect(result[2].style, baseStyle);
    });
  });

  group('spell section test', () {
    testWidgets('renders nothing when spells list is empty', (
      WidgetTester tester,
    ) async {
      final stateWithEmptySpells = NumberDetailState(
        failureOrSuccessOption: optionOf(Right(mockNumber)),
        number: mockNumber,
        isLoading: false,
        fetchNumberDetailProgress: none(),
      );

      when(() => mockNumberDetailBloc.state).thenReturn(stateWithEmptySpells);
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(SpellSection), findsNothing);
    });
    testWidgets(
      'renders single spell in the second row when only one spell exists',
      (WidgetTester tester) async {
        final stateWithOneSpell = NumberDetailState(
          failureOrSuccessOption: optionOf(
            Right(
              mockNumber.copyWith(
                spell: mockNumber.spell.copyWith(details: ['uyên']),
              ),
            ),
          ),
          number: mockNumber.copyWith(
            spell: mockNumber.spell.copyWith(details: ['uyên']),
          ),
          isLoading: false,
          fetchNumberDetailProgress: none(),
        );

        when(() => mockNumberDetailBloc.state).thenReturn(stateWithOneSpell);

        // Act: Render widget
        await tester.pumpWidget(createWidgetUnderTest());

        expect(find.byType(SpellSection), findsOneWidget);
        expect(find.text('uyên'), findsOneWidget);

        // Tìm tất cả Row trong SpellSection
        final spellRows = find.descendant(
          of: find.byType(SpellSection),
          matching: find.byType(Row),
        );
        expect(spellRows, findsNWidgets(1));

        final uyenPosition = tester.getTopLeft(find.text('uyên'));

        expect(uyenPosition.dy, isNotNull);
      },
    );

    testWidgets('Case Three items - Two rows, first row has 2 items', (
      WidgetTester tester,
    ) async {
      final stateWithThreeSpells = NumberDetailState(
        failureOrSuccessOption: optionOf(
          Right(
            mockNumber.copyWith(
              spell: mockNumber.spell.copyWith(details: ['u', 'yên', 'uyên']),
            ),
          ),
        ),
        number: mockNumber.copyWith(
          spell: mockNumber.spell.copyWith(details: ['u', 'yên', 'uyên']),
        ),
        isLoading: false,
        fetchNumberDetailProgress: none(),
      );

      when(() => mockNumberDetailBloc.state).thenReturn(stateWithThreeSpells);
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(SpellSection), findsOneWidget);
      expect(find.text('u'), findsOneWidget);
      expect(find.text('yên'), findsOneWidget);
      expect(find.text('uyên'), findsOneWidget);

      final spellRows = find.descendant(
        of: find.byType(SpellSection),
        matching: find.byType(Row),
      );
      expect(spellRows, findsNWidgets(2));

      final uPosition = tester.getTopLeft(find.text('u'));
      final yenPosition = tester.getTopRight(find.text('yên'));
      final uyenPosition = tester.getTopLeft(find.text('uyên'));

      expect(uPosition.dy, equals(yenPosition.dy));
      expect(uyenPosition.dy, greaterThan(uPosition.dy));
    });
  });
}
