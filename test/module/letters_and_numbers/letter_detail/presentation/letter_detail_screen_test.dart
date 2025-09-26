import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/application/letter_detail_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/presentation/letter_detail_screen.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/widget/audio_button.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/example_section.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/hightlight_text.dart';
import 'package:vietlite/module/letters_and_numbers/root/presentation/widget/spell_section.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

void main() {
  const MethodChannel audioChannel = MethodChannel('com.example.audioplayer');

  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouterMock appRouterMock;
  late MockLetterDetailBloc mockLetterDetailBloc;
  late MockAuthBloc mockAuthBloc;
  late MockProgressBloc mockProgressBloc;

  final mockLetter = Letter.empty().copyWith(id: 'id1', title: 'A');
  final examples = [
    const CharacterExample(
      title: 'Ant',
      image: 'ant.png',
      audio:
          'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
    ),
  ];
  final mockLetterSuccess = mockLetter.copyWith(
    mainExample: const CharacterExample(
      title: 'Apple',
      image: 'Apple.png',
      audio:
          'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
    ),
    spell: const LetterSpell(
      accents: ['À', 'Á', 'Ả', 'Ã', 'Ạ'],
      audioAccent:
          'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      spells: ['u', 'yên', 'uyên'],
      audioSpell:
          'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
    ),
    examples: [
      const CharacterExample(
        title: 'Ant',
        image: 'ant.png',
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      ),
    ],
    audioTitle: '',
    id: 'id1',
    title: 'A',
  );

  setUpAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(audioChannel, (MethodCall methodCall) async {
          if (methodCall.method == 'play') {
            return 'audio_played';
          } else if (methodCall.method == 'pause') {
            return 'audio_paused';
          }
          return null;
        });
    appRouterMock = AppRouterMock();

    mockLetterDetailBloc = MockLetterDetailBloc();
    mockAuthBloc = MockAuthBloc();
    mockProgressBloc = MockProgressBloc();
    GetIt.instance.registerFactory<LetterDetailBloc>(
      () => mockLetterDetailBloc,
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
        BlocProvider<LetterDetailBloc>(
          create: (context) => mockLetterDetailBloc,
        ),
      ],
      child: const LetterDetailScreen(id: 'id1'),
    );
  }

  Widget createTabletWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
        BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
        BlocProvider<LetterDetailBloc>(
          create: (context) => mockLetterDetailBloc,
        ),
      ],
      child: const MediaQuery(
        data: MediaQueryData(size: Size(1200, 800)),
        child: LetterDetailScreen(id: 'id1'),
      ),
    );
  }

  group('letter detail screen test', () {
    testWidgets('displays loading indicator when in loading state', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      when(
        () => mockLetterDetailBloc.state,
      ).thenReturn(LetterDetailState.initial().copyWith(isLoading: true));

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('returns null when getLetterDetail success', (
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
      final stateWithSuccess = LetterDetailState(
        failureOrSuccessOption: optionOf(Right(mockLetterSuccess)),
        letter: mockLetterSuccess,
        isLoading: false,
        fetchLetterDetailProgress: none(),
      );

      whenListen(
        mockLetterDetailBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: LetterDetailState.initial().copyWith(isLoading: true),
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
      final stateWithFailure = LetterDetailState(
        failureOrSuccessOption: optionOf(
          Left(AppFailure.otherError(message: 'Error!')),
        ),
        isLoading: false,
        letter: mockLetter,
        fetchLetterDetailProgress: none(),
      );

      whenListen(
        mockLetterDetailBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: LetterDetailState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: ScaffoldMessenger(child: createWidgetUnderTest())),
      );

      await tester.pump();

      expect(find.text('Error!'), findsOneWidget);
    });

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
          mockLetterDetailBloc,
          Stream.fromIterable([
            LetterDetailState.initial(),
            LetterDetailState.initial().copyWith(
              failureOrSuccessOption: some(right(mockLetter)),
            ),
          ]),
          initialState: LetterDetailState.initial(),
        );

        when(
          () => mockAuthBloc.state,
        ).thenReturn(AuthState.initial().copyWith(appUser: mockUser));

        final updatedLetter = mockLetter.copyWith(id: 'progressId123');

        final stateWithNumber = LetterDetailState(
          letter: updatedLetter,
          isLoading: false,
          failureOrSuccessOption: optionOf(right(updatedLetter)),
          fetchLetterDetailProgress: none(),
        );

        when(() => mockLetterDetailBloc.state).thenReturn(stateWithNumber);

        await tester.pumpWidget(createWidgetUnderTest());

        verify(
          () => mockLetterDetailBloc.add(
            const LetterDetailEvent.updateLetterDetailProgress(
              userId: 'user123',
              progressId: 'id1',
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'should dispatch updateDetailProgress to ProgressBloc when fetchLetterDetailProgress is success',
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
        final initialState = LetterDetailState.initial();

        // New state where fetchNumberDetailProgress is Some(Right(unit))
        final newState = initialState.copyWith(
          fetchLetterDetailProgress: some(right(unit)),
        );

        when(() => mockLetterDetailBloc.state).thenReturn(newState);
        whenListen(
          mockLetterDetailBloc,
          Stream.fromIterable([initialState, newState]),
          initialState: initialState,
        );

        when(
          () => mockAuthBloc.state,
        ).thenReturn(AuthState.initial().copyWith(appUser: mockUser));

        await tester.pumpWidget(createWidgetUnderTest());

        await tester.pump(); // process BlocListener
        verify(
          () => mockProgressBloc.add(
            any(
              that: isA<ProgressEvent>().having(
                (e) => e.maybeMap(
                  updateProgress: (value) => value.progress.exerciseType,
                  orElse: () => null,
                ),
                'exerciseType',
                ExerciseType.letter,
              ),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets('Displays network image when imageUrl is valid', (
      tester,
    ) async {
      final stateWithLetter = LetterDetailState(
        failureOrSuccessOption: optionOf(Right(mockLetter)),
        letter: mockLetter.copyWith(
          mainExample: mockLetter.mainExample.copyWith(
            image: 'https://example.com/test.png',
          ),
        ),
        isLoading: false,
        fetchLetterDetailProgress: none(),
      );

      when(() => mockLetterDetailBloc.state).thenReturn(stateWithLetter);

      // Wrap with mockNetworkImages for testing network images
      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pump();

        // Check if the network image is displayed
        final imageFinder = find.byWidgetPredicate(
          (widget) => widget is Image && widget.image is NetworkImage,
        );

        expect(imageFinder, findsOneWidget);
      });
    });
    testWidgets('Displays network image when example.image is valid', (
      tester,
    ) async {
      final stateWithLetter = LetterDetailState(
        failureOrSuccessOption: optionOf(Right(mockLetter)),
        letter: mockLetter.copyWith(
          examples: [
            const CharacterExample(
              title: 'ccc',
              image: 'https://example.com/apple.png',
              audio: 'https://example.com/audio1.mp3',
            ),
          ],
        ),
        isLoading: false,
        fetchLetterDetailProgress: none(),
      );

      when(() => mockLetterDetailBloc.state).thenReturn(stateWithLetter);

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

    testWidgets('Displays separator between list items', (tester) async {
      final stateWithLetter = LetterDetailState(
        failureOrSuccessOption: optionOf(Right(mockLetter)),
        letter: mockLetter.copyWith(
          examples: [
            const CharacterExample(
              title: 'test1',
              image: 'https://example.com/test1.png',
              audio: 'https://example.com/test1.mp3',
            ),
            const CharacterExample(
              title: 'test2',
              image: 'https://example.com/test2.png',
              audio: 'https://example.com/test2.mp3',
            ),
          ],
        ),
        isLoading: false,
        fetchLetterDetailProgress: none(),
      );

      when(() => mockLetterDetailBloc.state).thenReturn(stateWithLetter);

      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pump();

        final separatorFinder = find.byWidgetPredicate((widget) {
          if (widget is SizedBox) {
            return widget.height == AppDimensions.s8;
          }
          return false;
        });

        expect(separatorFinder, findsNWidgets(3));
      });
    });
    testWidgets('tapping on image should open dialog with InteractiveViewer', (
      tester,
    ) async {
      final stateWithLetter = LetterDetailState(
        failureOrSuccessOption: optionOf(Right(mockLetter)),
        letter: mockLetter.copyWith(
          mainExample: mockLetter.mainExample.copyWith(
            image: 'http://example.com/test.png',
          ),
        ),
        isLoading: false,
        fetchLetterDetailProgress: none(),
      );

      when(() => mockLetterDetailBloc.state).thenReturn(stateWithLetter);
      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pump();
        await tester.tap(
          find.widgetWithImage(
            InkWell,
            const NetworkImage('http://example.com/test.png'),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(InteractiveViewer), findsOneWidget);
        expect(find.byType(Image), findsWidgets);
      });
    });

    testWidgets(
      'opens dialog with width = screenWidth / 2 when isTablet = true',
      (tester) async {
        final stateWithLetter = LetterDetailState(
          failureOrSuccessOption: optionOf(Right(mockLetter)),
          letter: mockLetter.copyWith(
            mainExample: mockLetter.mainExample.copyWith(
              image: 'https://example.com/test.png',
            ),
          ),
          isLoading: false,
          fetchLetterDetailProgress: none(),
        );

        when(() => mockLetterDetailBloc.state).thenReturn(stateWithLetter);

        await mockNetworkImages(() async {
          await tester.pumpWidget(createTabletWidgetUnderTest());

          await tester.tap(
            find
                .descendant(
                  of: find.byType(InkWell),
                  matching: find.byType(Image),
                )
                .first,
          );
          await tester.pumpAndSettle();

          final dialogFinder = find.byWidgetPredicate(
            (widget) => widget is Dialog || widget is AlertDialog,
          );
          expect(dialogFinder, findsOneWidget);

          final containerFinder = find.descendant(
            of: dialogFinder,
            matching: find.byType(Container),
          );
          expect(containerFinder, findsWidgets);

          final size = tester.getSize(containerFinder.first);
          expect(size.width, closeTo(600, 0.1));
        });
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
      final stateWithEmptySpells = LetterDetailState(
        failureOrSuccessOption: optionOf(
          Right(
            mockLetter.copyWith(spell: mockLetter.spell.copyWith(spells: [])),
          ),
        ),
        letter: mockLetter.copyWith(
          spell: mockLetter.spell.copyWith(spells: []),
        ),
        isLoading: false,
        fetchLetterDetailProgress: none(),
      );

      when(() => mockLetterDetailBloc.state).thenReturn(stateWithEmptySpells);
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(SpellSection), findsNothing);
    });
    testWidgets(
      'renders single spell in the second row when only one spell exists',
      (WidgetTester tester) async {
        final stateWithOneSpell = LetterDetailState(
          failureOrSuccessOption: optionOf(
            Right(
              mockLetter.copyWith(
                spell: mockLetter.spell.copyWith(spells: ['uyên']),
              ),
            ),
          ),
          letter: mockLetter.copyWith(
            spell: mockLetter.spell.copyWith(spells: ['uyên']),
          ),
          isLoading: false,
          fetchLetterDetailProgress: none(),
        );

        when(() => mockLetterDetailBloc.state).thenReturn(stateWithOneSpell);

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
      final stateWithThreeSpells = LetterDetailState(
        failureOrSuccessOption: optionOf(
          Right(
            mockLetter.copyWith(
              spell: mockLetter.spell.copyWith(spells: ['u', 'yên', 'uyên']),
            ),
          ),
        ),
        letter: mockLetter.copyWith(
          spell: mockLetter.spell.copyWith(spells: ['u', 'yên', 'uyên']),
        ),
        isLoading: false,
        fetchLetterDetailProgress: none(),
      );

      when(() => mockLetterDetailBloc.state).thenReturn(stateWithThreeSpells);
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(SpellSection), findsOneWidget);
      expect(find.text('u'), findsOneWidget);
      expect(find.text('yên'), findsOneWidget);
      expect(find.text('uyên'), findsOneWidget);

      final spellRows = find.descendant(
        of: find.byType(SpellSection),
        matching: find.byType(Row),
      );

      // print('count Row: ${spellRows.evaluate().length}');
      //
      // for (var row in spellRows.evaluate()) {
      //   final spellTexts = find.descendant(
      //     of: find.byWidget(row.widget),
      //     matching: find.byType(Text),
      //   );
      //   print('Row have ${spellTexts.evaluate().length} SpellBox');
      // }

      expect(spellRows, findsNWidgets(2));

      final uPosition = tester.getTopLeft(find.text('u'));
      final yenPosition = tester.getTopRight(find.text('yên'));
      final uyenPosition = tester.getTopLeft(find.text('uyên'));

      expect(uPosition.dy, equals(yenPosition.dy));
      expect(uyenPosition.dy, greaterThan(uPosition.dy));
    });

    testWidgets(
      'Case Four items - Two rows, second row has only the last item',
      (WidgetTester tester) async {
        final stateWithFourSpells = LetterDetailState(
          failureOrSuccessOption: optionOf(
            Right(
              mockLetter.copyWith(
                spell: mockLetter.spell.copyWith(spells: ['a', 'b', 'c', 'd']),
              ),
            ),
          ),
          letter: mockLetter.copyWith(
            spell: mockLetter.spell.copyWith(spells: ['a', 'b', 'c', 'd']),
          ),
          isLoading: false,
          fetchLetterDetailProgress: none(),
        );

        when(() => mockLetterDetailBloc.state).thenReturn(stateWithFourSpells);
        await tester.pumpWidget(createWidgetUnderTest());

        expect(find.byType(SpellSection), findsOneWidget);
        expect(find.text('a'), findsOneWidget);
        expect(find.text('b'), findsOneWidget);
        expect(find.text('c'), findsOneWidget);
        expect(find.text('d'), findsOneWidget);

        final spellRows = find.descendant(
          of: find.byType(SpellSection),
          matching: find.byType(Row),
        );

        expect(spellRows, findsNWidgets(2));

        final aPosition = tester.getTopLeft(find.text('a'));
        final bPosition = tester.getTopLeft(find.text('b'));
        final cPosition = tester.getTopLeft(find.text('c'));
        final dPosition = tester.getTopLeft(find.text('d'));

        expect(aPosition.dy, equals(bPosition.dy));
        expect(bPosition.dy, equals(cPosition.dy));

        expect(dPosition.dy, greaterThan(aPosition.dy));
      },
    );
  });

  group('Audio test', () {
    testWidgets('Shows toast when audio URL is empty', (
      WidgetTester tester,
    ) async {
      final stateWithFailure = LetterDetailState(
        failureOrSuccessOption: optionOf(
          Left(AppFailure.otherError(message: 'audio url is empty')),
        ),
        isLoading: false,
        fetchLetterDetailProgress: none(),
        letter: mockLetter,
      );

      when(() => mockLetterDetailBloc.state).thenReturn(stateWithFailure);
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.tap(find.byType(AudioButton).at(0));
      await tester.pump();

      await tester.pumpAndSettle();

      expect(find.text('audio url is empty'), findsOneWidget);
    });

    // testWidgets('AudioButton triggers play and pause',
    //     (WidgetTester tester) async {
    //   // Arrange: Mocking audioUrl
    //   final stateWithFailure = LetterDetailState(
    //     failureOrSuccessOption:
    //         optionOf(Right(mockLetter.copyWith(audioTilte: 'audio_url'))),
    //     isLoading: false,
    //     letter: mockLetter,
    //   );
    //
    //   when(() => mockLetterDetailBloc.state).thenReturn(stateWithFailure);
    //   await tester.pumpWidget(createWidgetUnderTest());
    //
    //   // Find the play/pause button
    //   final audioButton = find.byKey(WidgetKeys.audioTitle);
    //   expect(audioButton, findsOneWidget);
    //
    //   // Simulate tapping to play the audio
    //   await tester.tap(audioButton);
    //   await tester.pumpAndSettle(); // Ensure the UI updates
    //
    //   // Verify 'play' method is invoked on the MethodChannel
    //   verify(() => audioChannel.invokeMethod('play', 'audio_url')).called(1);
    //
    //   // Simulate tapping to pause the audio
    //   await tester.tap(audioButton);
    //   await tester.pumpAndSettle(); // Ensure the UI updates
    //
    //   // Verify 'pause' method is invoked on the MethodChannel
    //   verify(() => audioChannel.invokeMethod('pause')).called(1);
    // });
  });

  group('ExampleSection', () {
    testWidgets(
      'opens dialog with width = screenWidth / 2 when isTablet = true',
      (tester) async {
        final stateWithLetter = LetterDetailState(
          failureOrSuccessOption: optionOf(Right(mockLetter)),
          letter: mockLetter.copyWith(
            mainExample: mockLetter.mainExample.copyWith(
              image: 'https://example.com/test.png',
            ),
          ),
          isLoading: false,
          fetchLetterDetailProgress: none(),
        );

        when(() => mockLetterDetailBloc.state).thenReturn(stateWithLetter);

        await mockNetworkImages(() async {
          await tester.pumpWidget(
            WidgetUtils.getScopedWidget(
              providers: [
                BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
                BlocProvider<ProgressBloc>(
                  create: (context) => mockProgressBloc,
                ),
                BlocProvider<LetterDetailBloc>(
                  create: (context) => mockLetterDetailBloc,
                ),
              ],
              child: MediaQuery(
                data: const MediaQueryData(size: Size(1200, 800)),
                child: Scaffold(body: ExampleSection(examples: examples)),
              ),
            ),
          );

          await tester.tap(find.byType(InkWell).first);
          await tester.pumpAndSettle();

          // tìm Container thực sự bên trong dialog
          final dialogContainer =
              find
                  .descendant(
                    of: find.byType(Dialog),
                    matching: find.byType(Container),
                  )
                  .first;

          expect(dialogContainer, findsOneWidget);

          final size = tester.getSize(dialogContainer);
          expect(size.width, closeTo(600, 0.1)); // 1200 / 2 = 600
        });
      },
    );

    testWidgets('tapping on image should open dialog with InteractiveViewer', (
      tester,
    ) async {
      final stateWithLetter = LetterDetailState(
        failureOrSuccessOption: optionOf(Right(mockLetter)),
        letter: mockLetter.copyWith(
          mainExample: mockLetter.mainExample.copyWith(
            image: 'https://example.com/test.png',
          ),
        ),
        isLoading: false,
        fetchLetterDetailProgress: none(),
      );

      when(() => mockLetterDetailBloc.state).thenReturn(stateWithLetter);

      await mockNetworkImages(() async {
        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
              BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
              BlocProvider<LetterDetailBloc>(
                create: (context) => mockLetterDetailBloc,
              ),
            ],
            child: Scaffold(body: ExampleSection(examples: examples)),
          ),
        );
        await tester.pump();

        await tester.tap(find.byType(InkWell).first);
        await tester.pumpAndSettle();

        expect(find.byType(InteractiveViewer), findsOneWidget);
        expect(find.byType(Image), findsWidgets);
      });
    });
  });
}
