import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_exercise/application/word_match_exercise_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_exercise/presentation/word_match_exercise_item.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../../utils/common_mocks.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouterMock appRouterMock;
  late MockWordMatchExerciseBloc mockWordMatchExerciseBloc;
  late MockProgressBloc mockProgressBloc;
  late WordMatchExercise exercise;
  late WordMatch wordMatch;
  late MockAuthBloc mockAuthBloc;

  setUpAll(() {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    binding.window.physicalSizeTestValue = const Size(1200, 2000);
    binding.window.devicePixelRatioTestValue = 1.0;
    appRouterMock = AppRouterMock();
    mockWordMatchExerciseBloc = MockWordMatchExerciseBloc();
    mockAuthBloc = MockAuthBloc();
    mockProgressBloc = MockProgressBloc();

    exercise = const WordMatchExercise(
      id: '123',
      answer: 'C',
      choices: ['A', 'B', 'C', 'D'],
      image: '',
    );

    wordMatch = WordMatch(
      id: '123',
      title: 'Sample title',
      exercises: [exercise],
      totalExercises: 1,
      order: 1,
    );
    GetIt.instance.registerFactory<WordMatchExerciseBloc>(
      () => mockWordMatchExerciseBloc,
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
        BlocProvider<WordMatchExerciseBloc>(
          create: (context) => mockWordMatchExerciseBloc,
        ),
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
        BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
      ],
      child: Scaffold(
        body: WordMatchExerciseItem(
          exercise: exercise.copyWith(image: 'https://example.com/test.png'),
          wordMatch: wordMatch,
        ),
      ),
    );
  }

  group('WordMatchExerciseItem UI Tests', () {
    testWidgets('renders initial UI correctly', (tester) async {
      when(() => mockWordMatchExerciseBloc.state).thenReturn(
        WordMatchExerciseState.initial().copyWith(exercise: exercise),
      );

      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();
      });
    });

    testWidgets('displays correct match UI when the answer is correct', (
      tester,
    ) async {
      whenListen(
        mockWordMatchExerciseBloc,
        Stream.fromIterable([
          WordMatchExerciseState.initial().copyWith(
            exercise: exercise,
            selectedAnswer: "C",
          ),
          WordMatchExerciseState.initial().copyWith(
            exercise: exercise,
            isAnswered: true,
            selectedAnswer: "C",
            isLoading: false,
          ),
        ]),
        initialState: WordMatchExerciseState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('choice_2')));
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('Confirm selection'));
      await tester.pumpAndSettle();

      // Define MaterialColor shades
      const testColor = MaterialColor(0xFF31AD62, {100: Color(0xFFE5F6EA)});

      final expectedBackgroundColor = testColor[100];
      const expectedTextColor = testColor;

      final containerFinder = find.descendant(
        of: find.byKey(const Key('choice_2')),
        matching: find.byType(Container),
      );

      final container = tester.widget<Container>(containerFinder.first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(expectedBackgroundColor));

      final textFinder = find.descendant(
        of: find.byKey(const Key('choice_2')),
        matching: find.byKey(const Key('choice_text_2')),
      );

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.color, equals(expectedTextColor));

      expect(
        find.descendant(
          of: find.byType(WordMatchExerciseItem),
          matching: find.byIcon(Icons.check_circle),
        ),
        findsOneWidget,
      );
    });
    testWidgets('Shows toast when an error occurs', (tester) async {
      whenListen(
        mockWordMatchExerciseBloc,
        Stream.fromIterable([
          WordMatchExerciseState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              Left(AppFailure.otherError(message: 'Error!')),
            ),
          ),
        ]),
        initialState: WordMatchExerciseState.initial(),
      );

      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());

        await tester.pump();

        expect(find.text('Error!'), findsOneWidget);
      });
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

        final initialState = WordMatchExerciseState.initial();

        final newState = initialState.copyWith(
          failureOrSuccessOption: some(right(unit)),
          exercise: exercise,
          selectedAnswer: "C",
          isAnswered: true,
        );

        when(() => mockWordMatchExerciseBloc.state).thenReturn(newState);
        whenListen(
          mockWordMatchExerciseBloc,
          Stream.fromIterable([initialState, newState]),
          initialState: initialState,
        );

        when(
          () => mockAuthBloc.state,
        ).thenReturn(AuthState.initial().copyWith(appUser: mockUser));

        await mockNetworkImages(() async {
          await tester.pumpWidget(createWidgetUnderTest());
          await tester.pump(); // cho BlocListener chạy
        });

        // Assert: ProgressBloc nhận đúng event updateProgress
        verify(
          () => mockProgressBloc.add(
            any(
              that: isA<ProgressEvent>().having(
                (e) => e.maybeMap(
                  updateProgress: (v) => v.progress.exerciseType,
                  orElse: () => null,
                ),
                'exerciseType',
                ExerciseType.wordMatch,
              ),
            ),
          ),
        ).called(1);
      },
    );

    // testWidgets('returns null when getWordMatches success', (
    //   WidgetTester tester,
    // ) async {
    //   whenListen(
    //     mockWordMatchExerciseBloc,
    //     Stream.fromIterable([
    //       WordMatchExerciseState.initial().copyWith(
    //         failureOrSuccessOption: some(right(unit)),
    //       ),
    //     ]),
    //     initialState: WordMatchExerciseState.initial(),
    //   );
    //
    //   await mockNetworkImages(() async {
    //     await tester.pumpWidget(createWidgetUnderTest());
    //     await tester.pumpAndSettle();
    //
    //     expect(find.byType(CircularProgressIndicator), findsNothing);
    //   });
    // });
    testWidgets('Selecting  answer updates UI', (tester) async {
      when(() => mockWordMatchExerciseBloc.state).thenReturn(
        WordMatchExerciseState.initial().copyWith(
          selectedAnswer: 'A',
          isAnswered: false,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('Displays network image when exercise.image is valid', (
      tester,
    ) async {
      final stateWithWordMatchExerciseState = WordMatchExerciseState(
        failureOrSuccessOption: optionOf(
          Right(exercise.copyWith(image: 'https://example.com/test.png')),
        ),
        isLoading: false,
        selectedAnswer: 'C',
        isAnswered: true,
        exercise: WordMatchExercise.empty().copyWith(
          image: 'https://example.com/test.png',
        ),
      );

      when(
        () => mockWordMatchExerciseBloc.state,
      ).thenReturn(stateWithWordMatchExerciseState);

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

    testWidgets('Displays default image when exercise.image is empty', (
      tester,
    ) async {
      final stateWithDefaultImage = WordMatchExerciseState(
        failureOrSuccessOption: optionOf(Right(exercise)),
        isLoading: false,
        selectedAnswer: null,
        isAnswered: false,
        exercise: exercise,
      );

      when(
        () => mockWordMatchExerciseBloc.state,
      ).thenReturn(stateWithDefaultImage);
      Widget createWidgetUnderTestPrivate() {
        return WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<WordMatchExerciseBloc>(
              create: (context) => mockWordMatchExerciseBloc,
            ),
            BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          ],
          child: Scaffold(
            body: WordMatchExerciseItem(
              exercise: exercise,
              wordMatch: wordMatch,
            ),
          ),
        );
      }

      await tester.pumpWidget(createWidgetUnderTestPrivate());
      await tester.pump();

      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Image).evaluate().single.widget, isA<Image>());
    });
  });

  testWidgets(
    'calls checkAnswer and updateAnswerProgress when wordMatch is confirmed and user has email',
    (tester) async {
      final mockUser = AppUser.empty().copyWith(
        id: 'user123',
        email: 'user@example.com',
      );
      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.initial().copyWith(appUser: mockUser));

      whenListen(
        mockWordMatchExerciseBloc,
        Stream.fromIterable([
          WordMatchExerciseState.initial().copyWith(
            exercise: exercise,
            selectedAnswer: 'C',
            isLoading: false,
          ),
        ]),
        initialState: WordMatchExerciseState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Tap on an answer
      final answerFinder = find.descendant(
        of: find.byType(WordMatchExerciseItem),
        matching: find.text('C'),
      );
      await tester.tap(answerFinder.first);

      await tester.pumpAndSettle();

      // Tap confirm
      await tester.tap(find.textContaining('Confirm selection'));
      await tester.pumpAndSettle();

      verify(
        () => mockWordMatchExerciseBloc.add(
          const WordMatchExerciseEvent.checkAnswer(),
        ),
      ).called(greaterThanOrEqualTo(1));

      verify(
        () => mockWordMatchExerciseBloc.add(
          const WordMatchExerciseEvent.updateAnswerProgress(
            userId: 'user123',
            progressId: '123',
            totalExercises: 1,
          ),
        ),
      ).called(1);
    },
  );

  testWidgets('tapping on exercise image opens dialog with correct content', (
    tester,
  ) async {
    when(
      () => mockWordMatchExerciseBloc.state,
    ).thenReturn(WordMatchExerciseState.initial().copyWith(exercise: exercise));

    await mockNetworkImages(() async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final imageFinder = find.byType(AspectRatio);
      expect(imageFinder, findsOneWidget);

      await tester.tap(imageFinder);
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);

      final interactiveViewerFinder = find.descendant(
        of: find.byType(Dialog),
        matching: find.byType(InteractiveViewer),
      );
      expect(interactiveViewerFinder, findsOneWidget);

      final networkImageFinder = find.descendant(
        of: interactiveViewerFinder,
        matching: find.byWidgetPredicate(
          (widget) => widget is Image && widget.image is NetworkImage,
        ),
      );
      expect(networkImageFinder, findsOneWidget);
    });
  });
  testWidgets(
    'opens dialog with width = screenWidth - 64 when device is not tablet',
    (tester) async {
      const screenWidth = 400.0;
      final stateWithExercise = WordMatchExerciseState.initial().copyWith(
        exercise: exercise.copyWith(image: 'https://example.com/test.png'),
      );

      when(() => mockWordMatchExerciseBloc.state).thenReturn(stateWithExercise);

      await mockNetworkImages(() async {
        await tester.pumpWidget(
          MediaQuery(
            data: const MediaQueryData(size: Size(screenWidth, 800)),
            child: MaterialApp(home: createWidgetUnderTest()),
          ),
        );
        await tester.pumpAndSettle();

        // Tìm image và tap
        final imageFinder = find.byType(AspectRatio);
        expect(imageFinder, findsOneWidget);
        await tester.tap(imageFinder);
        await tester.pumpAndSettle();

        final dialogFinder = find.byType(Dialog);
        expect(dialogFinder, findsOneWidget);

        final containerFinder = find.descendant(
          of: dialogFinder,
          matching: find.byType(Container),
        );
        expect(containerFinder, findsWidgets);

        final containerWidth = tester.getSize(containerFinder.first).width;
        expect(containerWidth, closeTo(screenWidth - 64, 1.0));
      });
    },
  );
}
