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
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_exercise/application/word_selection_exercise_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_exercise/presentation/word_selection_exercise_item.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouterMock appRouterMock;
  late MockWordSelectionExerciseBloc mockWordSelectionExerciseBloc;
  late MockProgressBloc mockProgressBloc;
  late WordSelectionExercise exercise;
  late WordSelection wordSelection;
  late MockAuthBloc mockAuthBloc;

  setUpAll(() {
    appRouterMock = AppRouterMock();
    mockWordSelectionExerciseBloc = MockWordSelectionExerciseBloc();
    mockAuthBloc = MockAuthBloc();
    mockProgressBloc = MockProgressBloc();

    exercise = const WordSelectionExercise(
      id: '123',
      question: 'This is a ... test',
      answer: 'mocktail',
      choices: ['unit', 'widget', 'mocktail', 'integration'],
    );
    wordSelection = WordSelection(
      id: '123',
      title: 'Sample title',
      exercises: [exercise],
      totalExercises: 1,
      order: 1,
      isPremium: false,
    );
    GetIt.instance.registerFactory<WordSelectionExerciseBloc>(
      () => mockWordSelectionExerciseBloc,
    );
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    GetIt.instance.registerSingleton<AuthBloc>(mockAuthBloc);
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    registerFallbackValue(FakeProgressEvent());
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<WordSelectionExerciseBloc>(
          create: (context) => mockWordSelectionExerciseBloc,
        ),
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
        BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
      ],
      child: Scaffold(
        body: WordSelectionExerciseItem(
          exercise: exercise,
          wordSelection: wordSelection,
        ),
      ),
    );
  }

  group('WordExerciseItem UI Tests', () {
    testWidgets('renders initial UI correctly', (tester) async {
      when(() => mockWordSelectionExerciseBloc.state).thenReturn(
        WordSelectionExerciseState.initial().copyWith(exercise: exercise),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
    });

    testWidgets('displays correct selection UI when the answer is correct', (
      tester,
    ) async {
      whenListen(
        mockWordSelectionExerciseBloc,
        Stream.fromIterable([
          WordSelectionExerciseState.initial().copyWith(
            exercise: exercise,
            selectedAnswer: "mocktail",
          ),
          WordSelectionExerciseState.initial().copyWith(
            exercise: exercise,
            isAnswered: true,
            selectedAnswer: "mocktail",
            isLoading: false,
          ),
        ]),
        initialState: WordSelectionExerciseState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.tap(find.text('mocktail'));
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('Confirm selection'));
      await tester.pumpAndSettle();

      // Define MaterialColor shades
      const testColor = MaterialColor(0xFF31AD62, {100: Color(0xFFE5F6EA)});

      final expectedBackgroundColor = testColor[100];
      const expectedTextColor = testColor;

      final containerFinder = find.descendant(
        of: find.byType(WordSelectionExerciseItem),
        matching: find.byType(Container),
      );

      final container = tester.widget<Container>(containerFinder.first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(expectedBackgroundColor));

      final textFinder = find.descendant(
        of: find.byType(WordSelectionExerciseItem),
        matching: find.textContaining('This is a mocktail test'),
      );

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.color, equals(expectedTextColor));

      expect(
        find.descendant(
          of: find.byType(WordSelectionExerciseItem),
          matching: find.byIcon(Icons.check_circle),
        ),
        findsOneWidget,
      );
    });

    testWidgets('displays incorrect selection UI when the answer is wrong', (
      tester,
    ) async {
      whenListen(
        mockWordSelectionExerciseBloc,
        Stream.fromIterable([
          WordSelectionExerciseState.initial().copyWith(
            exercise: exercise,
            selectedAnswer: "mocktail",
          ),
          WordSelectionExerciseState.initial().copyWith(
            exercise: exercise,
            isAnswered: true,
            selectedAnswer: "unit",
            isLoading: false,
          ),
        ]),
        initialState: WordSelectionExerciseState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.tap(find.text('unit'));
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('Confirm selection'));
      await tester.pumpAndSettle();

      // Define MaterialColor shades
      const redColor = MaterialColor(0xFFE96565, {100: Color(0xFFFCEEEE)});

      final expectedBackgroundColor = redColor[100];
      const expectedTextColor = redColor;

      final containerFinder = find.descendant(
        of: find.byType(WordSelectionExerciseItem),
        matching: find.byType(Container),
      );

      final container = tester.widget<Container>(containerFinder.first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(expectedBackgroundColor));

      final textFinder = find.descendant(
        of: find.byType(WordSelectionExerciseItem),
        matching: find.textContaining('This is a unit test'),
      );

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.color, equals(expectedTextColor));

      expect(
        find.descendant(
          of: find.byType(WordSelectionExerciseItem),
          matching: find.byIcon(Icons.cancel_rounded),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Shows toast when an error occurs', (tester) async {
      whenListen(
        mockWordSelectionExerciseBloc,
        Stream.fromIterable([
          WordSelectionExerciseState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              Left(AppFailure.otherError(message: 'Error!')),
            ),
          ),
        ]),
        initialState: WordSelectionExerciseState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.pump();

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets(
      'should dispatch updateDetailProgress to ProgressBloc when  success',
      (WidgetTester tester) async {
        // Arrange
        const mockUser = AppUser(
          id: 'user123',
          email: 'test@example.com',
          name: 'Tester',
          avatar: '',
          isAnonymous: false,
        );

        final initialState = WordSelectionExerciseState.initial();

        final newState = initialState.copyWith(
          failureOrSuccessOption: some(right(unit)),
          exercise: exercise,
          selectedAnswer: "C",
          isAnswered: true,
        );

        when(() => mockWordSelectionExerciseBloc.state).thenReturn(newState);
        whenListen(
          mockWordSelectionExerciseBloc,
          Stream.fromIterable([initialState, newState]),
          initialState: initialState,
        );

        when(
          () => mockAuthBloc.state,
        ).thenReturn(AuthState.initial().copyWith(appUser: mockUser));
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pump();

        verify(
          () => mockProgressBloc.add(
            any(
              that: isA<ProgressEvent>().having(
                (e) => e.maybeMap(
                  updateProgress: (v) => v.progress.exerciseType,
                  orElse: () => null,
                ),
                'exerciseType',
                ExerciseType.wordSelection,
              ),
            ),
          ),
        ).called(1);
      },
    );
  });

  testWidgets(
    'calls checkAnswer and updateAnswerProgress when selection is confirmed and user has email',
    (tester) async {
      final mockUser = AppUser.empty().copyWith(
        id: 'user123',
        email: 'user@example.com',
      );
      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.initial().copyWith(appUser: mockUser));

      whenListen(
        mockWordSelectionExerciseBloc,
        Stream.fromIterable([
          WordSelectionExerciseState.initial().copyWith(
            exercise: exercise,
            selectedAnswer: 'mocktail',
            isLoading: false,
          ),
        ]),
        initialState: WordSelectionExerciseState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Tap on an answer
      await tester.tap(find.text('mocktail'));
      await tester.pumpAndSettle();

      // Tap confirm
      await tester.tap(find.textContaining('Confirm selection'));
      await tester.pumpAndSettle();

      verify(
        () => mockWordSelectionExerciseBloc.add(
          const WordSelectionExerciseEvent.checkAnswer(),
        ),
      ).called(greaterThanOrEqualTo(1));

      verify(
        () => mockWordSelectionExerciseBloc.add(
          const WordSelectionExerciseEvent.updateAnswerProgress(
            userId: 'user123',
            progressId: '123',
            totalExercises: 1,
          ),
        ),
      ).called(1);
    },
  );
}
