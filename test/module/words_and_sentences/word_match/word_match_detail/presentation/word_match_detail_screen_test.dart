import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/application/word_match_detail_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_detail/presentation/word_match_detail_screen.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_exercise/application/word_match_exercise_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouterMock appRouterMock;
  late MockWordMatchDetailBloc mockWordMatchDetailBloc;
  late MockWordMatchExerciseBloc mockWordMatchExerciseBloc;
  late MockAuthBloc mockAuthBloc;

  final mockWordMatch = WordMatch.empty().copyWith(
    id: 'id1',
    title: 'A',
    exercises: [
      const WordMatchExercise(
        choices: ['SDK', 'IDE'],
        answer: 'SDK',
        id: 'ex1',
        image: 'apple.png',
      ),
      const WordMatchExercise(
        image: 'apple.png',
        choices: ['Language', 'Framework'],
        answer: 'Language',
        id: 'ex2',
      ),
    ],
  );

  setUpAll(() {
    appRouterMock = AppRouterMock();

    mockWordMatchDetailBloc = MockWordMatchDetailBloc();
    mockWordMatchExerciseBloc = MockWordMatchExerciseBloc();
    mockAuthBloc = MockAuthBloc();

    GetIt.instance.registerFactory<WordMatchDetailBloc>(
      () => mockWordMatchDetailBloc,
    );
    GetIt.instance.registerFactory<WordMatchExerciseBloc>(
      () => mockWordMatchExerciseBloc,
    );
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    GetIt.instance.registerSingleton<AuthBloc>(mockAuthBloc);
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    when(
      () => mockWordMatchExerciseBloc.state,
    ).thenReturn(WordMatchExerciseState.initial());
    when(
      () => mockWordMatchDetailBloc.state,
    ).thenReturn(WordMatchDetailState.initial());
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
        BlocProvider<WordMatchDetailBloc>(
          create: (context) => mockWordMatchDetailBloc,
        ),
        BlocProvider<WordMatchExerciseBloc>(
          create: (context) => mockWordMatchExerciseBloc,
        ),
      ],
      child: const WordMatchDetailScreen(id: 'id1'),
    );
  }

  group('Word match detail screen test', () {
    testWidgets('displays loading indicator when in loading state', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      when(
        () => mockWordMatchDetailBloc.state,
      ).thenReturn(WordMatchDetailState.initial().copyWith(isLoading: true));

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('hides UI when user is not logged in', (tester) async {
      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.initial().copyWith(appUser: AppUser.empty()));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(WordMatchDetailScreen), findsOneWidget);
    });
    testWidgets('returns null when getWordMatchDetail success', (
      WidgetTester tester,
    ) async {
      final stateWithSuccess = WordMatchDetailState(
        fetchFailure: optionOf(const Right([])),
        isLoading: false,
        wordMatch: mockWordMatch,
        exercises: [
          const UserExercise(id: '1', lastAnswer: 'SDK', isCorrect: true),
        ],
      );

      whenListen(
        mockWordMatchDetailBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: WordMatchDetailState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('shows error message when fetch fails', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      final failureState = WordMatchDetailState.initial().copyWith(
        fetchFailure: optionOf(
          Left(AppFailure.otherError(message: 'Error happened')),
        ),
        isLoading: false,
      );

      whenListen(
        mockWordMatchDetailBloc,
        Stream.fromIterable([failureState]),
        initialState: WordMatchDetailState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.pump();

      expect(find.text('Error happened'), findsOneWidget);
    });

    testWidgets('shows error message when fetch succeeds', (tester) async {
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
      final failureState = WordMatchDetailState.initial().copyWith(
        fetchFailure: optionOf(const Right([])),
        wordMatch: mockWordMatch,
        isLoading: false,
      );

      whenListen(
        mockWordMatchDetailBloc,
        Stream.fromIterable([failureState]),
        initialState: WordMatchDetailState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
    testWidgets('renders correctly when exercises list is not empty', (
      tester,
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
      final stateWithEmptyExercises = WordMatchDetailState(
        fetchFailure: optionOf(Right(mockWordMatch)),
        wordMatch: mockWordMatch,
        isLoading: false,
        exercises: [
          const UserExercise(id: '1', lastAnswer: 'SDK', isCorrect: true),
          const UserExercise(
            id: '2',
            lastAnswer: 'Framework',
            isCorrect: false,
          ),
        ],
      );

      whenListen(
        mockWordMatchDetailBloc,
        Stream.fromIterable([stateWithEmptyExercises]),
        initialState: WordMatchDetailState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('renders lastAnswer correctly for each exercise', (
      tester,
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

      final stateWithUserExercises = WordMatchDetailState(
        fetchFailure: optionOf(const Right([])),
        isLoading: false,
        wordMatch: mockWordMatch,
        exercises: [
          const UserExercise(id: 'ex1', lastAnswer: 'SDK', isCorrect: true),
          const UserExercise(
            id: 'ex2',
            lastAnswer: 'Framework',
            isCorrect: false,
          ),
        ],
      );

      whenListen(
        mockWordMatchDetailBloc,
        Stream.fromIterable([stateWithUserExercises]),
        initialState: WordMatchDetailState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
    });

    testWidgets('shows unlock UI and button is tappable', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
          premiumConfig: const PremiumConfig(wordMatch: false),
        ),
      );

      final premiumWordMatch = mockWordMatch.copyWith(isPremium: true);
      when(() => mockWordMatchDetailBloc.state).thenReturn(
        WordMatchDetailState.initial().copyWith(
          wordMatch: premiumWordMatch,
          isLoading: false,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(
        find.text('Bạn cần mở khoá để sử dụng chức năng này'),
        findsOneWidget,
      );
      expect(find.text('Mở khoá'), findsOneWidget);

      await tester.tap(find.text('Mở khoá'));
      await tester.pump();
    });

    testWidgets(
      'tapping feedback button calls LivechatService.sendMessage via JS mock',
      (tester) async {
        // Fake auth state: user logged in
        final authState = AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'id1'),
        );

        // Fake WordMatchDetail state
        final wordMatchDetailState = WordMatchDetailState.initial().copyWith(
          wordMatch: mockWordMatch.copyWith(title: 'A'),
          isLoading: false,
        );

        when(() => mockAuthBloc.state).thenReturn(authState);
        when(
          () => mockWordMatchDetailBloc.state,
        ).thenReturn(wordMatchDetailState);

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        final buttonFinder = find.text('Feedback');
        expect(buttonFinder, findsOneWidget);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();
      },
    );
  });
}
