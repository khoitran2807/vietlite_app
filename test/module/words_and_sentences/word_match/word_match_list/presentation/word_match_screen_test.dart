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
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/application/word_match_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/presentation/word_match_screen.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  group('WordMatchScreen Widget Tests', () {
    late AppRouterMock appRouterMock;
    late MockWordMatchBloc mockWordMatchBloc;
    late MockAuthBloc mockAuthBloc;
    late MockProgressBloc mockProgressBloc;

    final wordMatches = [
      WordMatch.empty().copyWith(
        id: 'id1',
        title: 'title1',
        exercises: [
          const WordMatchExercise(
            id: 'id_w1',
            choices: ['A', 'B', 'C', 'D'],
            answer: 'A',
            image: 'apple.png',
          ),
          const WordMatchExercise(
            id: 'id_w2',
            choices: ['A', 'B', 'C', 'D'],
            answer: 'B',
            image: 'apple.png',
          ),
        ],
      ),
      WordMatch.empty().copyWith(
        id: 'id2',
        title: 'title2',
        exercises: [
          const WordMatchExercise(
            id: 'id_w3',
            choices: ['A', 'B', 'C', 'D'],
            image: 'apple.png',
            answer: 'C',
          ),
          const WordMatchExercise(
            id: 'id_w4',
            choices: ['A', 'B', 'C', 'D'],
            image: 'apple.png',
            answer: 'D',
          ),
        ],
      ),
    ];

    final wordMatchA = WordMatch.empty().copyWith(
      id: 'WM1',
      title: 'A',
      order: 1,
    );
    final wordMatchB = WordMatch.empty().copyWith(
      id: 'WM2',
      title: 'B',
      order: 2,
    );

    final progressWordMatch = UserProgress.empty().copyWith(
      id: 'WM1',
      exerciseType: ExerciseType.wordMatch,
    );

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      appRouterMock = AppRouterMock();
      mockAuthBloc = MockAuthBloc();
      mockProgressBloc = MockProgressBloc();

      mockWordMatchBloc = MockWordMatchBloc();
      GetIt.instance.registerFactory<AuthBloc>(() => mockAuthBloc);
      GetIt.instance.registerFactory<ProgressBloc>(() => mockProgressBloc);

      GetIt.instance.registerFactory<WordMatchBloc>(() => mockWordMatchBloc);
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());
    });

    Widget createWidgetUnderTest() {
      return WidgetUtils.getScopedWidget(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
          BlocProvider<WordMatchBloc>(create: (context) => mockWordMatchBloc),
        ],
        child: const Scaffold(body: WordMatchScreen()),
      );
    }

    testWidgets('Shows toast when an error occurs', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      final stateWithFailure = WordMatchState(
        fetchFailure: optionOf(
          Left(AppFailure.otherError(message: 'Error happened')),
        ),
        wordMatches: [],
        isLoading: false,
      );

      whenListen(
        mockWordMatchBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: WordMatchState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: ScaffoldMessenger(child: createWidgetUnderTest())),
      );

      await tester.pump();

      expect(find.text('Error happened'), findsOneWidget);
    });

    testWidgets('returns null when getWordMatches success', (
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
      final stateWithSuccess = WordMatchState(
        fetchFailure: optionOf(const Right([])),
        isLoading: false,
        wordMatches: wordMatches,
      );

      whenListen(
        mockWordMatchBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: WordMatchState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets(
      'Navigates to WordMatchDetailScreenRoute when a wordMatch is tapped',
      (WidgetTester tester) async {
        when(() => mockWordMatchBloc.state).thenReturn(
          WordMatchState(
            isLoading: false,
            fetchFailure: optionOf(Right(wordMatches)),
            wordMatches: wordMatches,
          ),
        );

        when(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'id1')),
        ).thenAnswer((_) async {
          return null;
        });

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.text('title1'), findsOneWidget);

        await tester.tap(find.text('title1'));
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'id1')),
        ).called(1);
      },
    );

    testWidgets(
      'Displays completed, in progress, and not started statuses correctly',
      (tester) async {
        final stateWithData = WordMatchState(
          isLoading: false,
          fetchFailure: optionOf(Right(wordMatches)),
          wordMatches: wordMatches,
        );

        whenListen(
          mockWordMatchBloc,
          Stream.fromIterable([stateWithData]),
          initialState: WordMatchState.initial(),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();
      },
    );

    testWidgets('Shows correct progress status for word matches', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      whenListen(
        mockWordMatchBloc,
        Stream.fromIterable([
          WordMatchState.initial().copyWith(
            wordMatches: [
              const WordMatch(
                id: 'id2',
                title: 'title2',
                exercises: [
                  WordMatchExercise(
                    id: 'id_w3',
                    choices: ['A', 'B', 'C', 'D'],
                    image: 'apple.png',
                    answer: 'C',
                  ),
                  WordMatchExercise(
                    id: 'id_w4',
                    choices: ['A', 'B', 'C', 'D'],
                    image: 'apple.png',
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
        initialState: WordMatchState.initial(),
      );

      debugPrint(
        'Initial WordSelections: ${WordMatchState.initial().wordMatches}',
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('title2'), findsOneWidget);
    });

    testWidgets(
      'WordMatchScreen rebuilds when wordMatches or loading state changes',
      (WidgetTester tester) async {
        final initialState = ProgressState.initial().copyWith(
          wordMatches: [wordMatchA],
          userProgresses: [progressWordMatch],
        );

        final updatedState = initialState.copyWith(
          wordMatches: [wordMatchA, wordMatchB],
          userProgresses: [progressWordMatch],
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

    testWidgets('shows unlock UI and button is tappable', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
          premiumConfig: const PremiumConfig(wordMatch: false),
        ),
      );

      final premiumWordMatch = wordMatchA.copyWith(isPremium: true);
      when(() => mockWordMatchBloc.state).thenReturn(
        WordMatchState.initial().copyWith(
          wordMatches: [premiumWordMatch],
          isLoading: false,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('Unlock'), findsOneWidget);

      await tester.tap(find.text('Unlock'));
      await tester.pump();
    });
  });
}
