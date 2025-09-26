import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/application/word_selection_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/presentation/word_selection_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  group('WordSelectionScreen Widget Tests', () {
    late AppRouterMock appRouterMock;
    late MockWordSelectionBloc mockWordSelectionBloc;
    late MockAuthBloc mockAuthBloc;
    late MockProgressBloc mockProgressBloc;

    final wordSelections = [
      WordSelection.empty().copyWith(
        id: 'id1',
        title: 'title1',
        exercises: [
          const WordSelectionExercise(
            id: 'id_w1',
            choices: ['A', 'B', 'C', 'D'],
            question: 'what is correct? ',
            answer: 'A',
          ),
          const WordSelectionExercise(
            id: 'id_w2',
            choices: ['A', 'B', 'C', 'D'],
            question: 'what is correct? ',
            answer: 'B',
          ),
        ],
      ),
      WordSelection.empty().copyWith(
        id: 'id2',
        title: 'title2',
        exercises: [
          const WordSelectionExercise(
            id: 'id_w3',
            choices: ['A', 'B', 'C', 'D'],
            question: 'what is correct? ',
            answer: 'C',
          ),
          const WordSelectionExercise(
            id: 'id_w4',
            choices: ['A', 'B', 'C', 'D'],
            question: 'what is correct? ',
            answer: 'D',
          ),
        ],
      ),
    ];

    final wordSelectionA = WordSelection.empty().copyWith(
      id: 'WS1',
      title: 'A',
      order: 1,
    );
    final wordSelectionB = WordSelection.empty().copyWith(
      id: 'WS2',
      title: 'B',
      order: 2,
    );

    final progressWordSelection = UserProgress.empty().copyWith(
      id: 'WS1',
      exerciseType: ExerciseType.wordMatch,
    );

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      appRouterMock = AppRouterMock();
      mockAuthBloc = MockAuthBloc();
      mockProgressBloc = MockProgressBloc();
      mockWordSelectionBloc = MockWordSelectionBloc();
      GetIt.instance.registerFactory<AuthBloc>(() => mockAuthBloc);
      GetIt.instance.registerFactory<WordSelectionBloc>(
        () => mockWordSelectionBloc,
      );
      GetIt.instance.registerFactory<ProgressBloc>(() => mockProgressBloc);
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());
    });

    Widget createWidgetUnderTest() {
      return WidgetUtils.getScopedWidget(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
          BlocProvider<WordSelectionBloc>(
            create: (context) => mockWordSelectionBloc,
          ),
        ],
        child: const Scaffold(body: WordSelectionScreen()),
      );
    }

    testWidgets('Shows toast when an error occurs', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      final stateWithFailure = WordSelectionState(
        fetchFailure: optionOf(
          Left(AppFailure.otherError(message: 'Error happened')),
        ),
        wordSelections: [],
        isLoading: false,
      );

      whenListen(
        mockWordSelectionBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: WordSelectionState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: ScaffoldMessenger(child: createWidgetUnderTest())),
      );
      await tester.pump(); // pump the widget tree
      expect(find.text('Error happened'), findsOneWidget); // works for SnackBar
    });

    testWidgets('returns null when getWordSelections success', (
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
      final stateWithSuccess = WordSelectionState(
        fetchFailure: optionOf(const Right([])),
        wordSelections: wordSelections,
        isLoading: false,
      );

      whenListen(
        mockWordSelectionBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: WordSelectionState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets(
      'Navigates to WordSelectionDetailScreenRoute when a wordSelection is tapped',
      (WidgetTester tester) async {
        when(() => mockWordSelectionBloc.state).thenReturn(
          WordSelectionState(
            wordSelections: wordSelections,
            isLoading: false,
            fetchFailure: optionOf(Right(wordSelections)),
          ),
        );

        when(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'id1')),
        ).thenAnswer((_) async {
          return null;
        });

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.text('title1'), findsOneWidget);

        await tester.tap(find.text('title1'));
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'id1')),
        ).called(1);
      },
    );

    testWidgets(
      'Displays completed, in progress, and not started statuses correctly',
      (tester) async {
        final stateWithData = WordSelectionState(
          wordSelections: wordSelections,
          isLoading: false,
          fetchFailure: optionOf(Right(wordSelections)),
        );

        whenListen(
          mockWordSelectionBloc,
          Stream.fromIterable([stateWithData]),
          initialState: WordSelectionState.initial(),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();
      },
    );

    testWidgets('Shows correct progress status for word selections', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      whenListen(
        mockWordSelectionBloc,
        Stream.fromIterable([
          WordSelectionState.initial().copyWith(
            wordSelections: [
              const WordSelection(
                id: 'id2',
                title: 'title2',
                exercises: [
                  WordSelectionExercise(
                    id: 'id_w3',
                    choices: ['A', 'B', 'C', 'D'],
                    question: 'what is correct? ',
                    answer: 'C',
                  ),
                  WordSelectionExercise(
                    id: 'id_w4',
                    choices: ['A', 'B', 'C', 'D'],
                    question: 'what is correct? ',
                    answer: 'D',
                  ),
                ],
                totalExercises: 2,
                order: 1,
                isPremium: false,
              ),
            ],
            isLoading: false,
          ),
        ]),
        initialState: WordSelectionState.initial(),
      );

      debugPrint(
        'Initial WordSelections: ${WordSelectionState.initial().wordSelections}',
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('title2'), findsOneWidget);
    });

    testWidgets(
      'WordSelectionScreen rebuilds when wordSelections or loading state changes',
      (WidgetTester tester) async {
        final initialState = ProgressState.initial().copyWith(
          wordSelections: [wordSelectionA],
          userProgresses: [progressWordSelection],
        );

        final updatedState = initialState.copyWith(
          wordSelections: [wordSelectionA, wordSelectionB],
          userProgresses: [progressWordSelection],
        );

        when(() => mockProgressBloc.state).thenReturn(initialState);
        whenListen(
          mockProgressBloc,
          Stream.fromIterable([initialState, updatedState]),
          initialState: initialState,
        );

        await tester.pumpWidget(createWidgetUnderTest());
      },
    );
  });
}
