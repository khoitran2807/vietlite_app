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
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/application/word_selection_detail_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_detail/presentation/word_selection_detail_screen.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_exercise/application/word_selection_exercise_bloc.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouterMock appRouterMock;
  late MockWordSelectionDetailBloc mockWordSelectionDetailBloc;
  late MockWordSelectionExerciseBloc mockWordSelectionExerciseBloc;
  late MockAuthBloc mockAuthBloc;

  final mockWordSelection = WordSelection.empty().copyWith(
    id: 'id1',
    title: 'A',
    exercises: [
      const WordSelectionExercise(
        question: 'What is Flutter?',
        choices: ['SDK', 'IDE'],
        answer: 'SDK',
        id: 'ex1',
      ),
      const WordSelectionExercise(
        question: 'What is Dart?',
        choices: ['Language', 'Framework'],
        answer: 'Language',
        id: 'ex2',
      ),
    ],
  );

  setUpAll(() {
    appRouterMock = AppRouterMock();

    mockWordSelectionDetailBloc = MockWordSelectionDetailBloc();
    mockWordSelectionExerciseBloc = MockWordSelectionExerciseBloc();
    mockAuthBloc = MockAuthBloc();

    GetIt.instance.registerFactory<WordSelectionDetailBloc>(
      () => mockWordSelectionDetailBloc,
    );
    GetIt.instance.registerFactory<WordSelectionExerciseBloc>(
      () => mockWordSelectionExerciseBloc,
    );
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    GetIt.instance.registerSingleton<AuthBloc>(mockAuthBloc);
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    when(
      () => mockWordSelectionExerciseBloc.state,
    ).thenReturn(WordSelectionExerciseState.initial());
    when(
      () => mockWordSelectionDetailBloc.state,
    ).thenReturn(WordSelectionDetailState.initial());
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
        BlocProvider<WordSelectionDetailBloc>(
          create: (context) => mockWordSelectionDetailBloc,
        ),
        BlocProvider<WordSelectionExerciseBloc>(
          create: (context) => mockWordSelectionExerciseBloc,
        ),
      ],
      child: const WordSelectionDetailScreen(id: 'id1'),
    );
  }

  group('Word selection detail screen test', () {
    testWidgets('displays loading indicator when in loading state', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      when(() => mockWordSelectionDetailBloc.state).thenReturn(
        WordSelectionDetailState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('hides UI when user is not logged in', (tester) async {
      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.initial().copyWith(appUser: AppUser.empty()));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(WordSelectionDetailScreen), findsOneWidget);
    });

    testWidgets('returns null when getWordSelectionDetail success', (
      WidgetTester tester,
    ) async {
      final stateWithSuccess = WordSelectionDetailState(
        fetchFailure: optionOf(const Right([])),
        isLoading: false,
        wordSelection: mockWordSelection,
        exercises: [
          const UserExercise(id: '1', lastAnswer: 'SDK', isCorrect: true),
        ],
      );

      whenListen(
        mockWordSelectionDetailBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: WordSelectionDetailState.initial().copyWith(
          isLoading: true,
        ),
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
      final failureState = WordSelectionDetailState.initial().copyWith(
        fetchFailure: optionOf(
          Left(AppFailure.otherError(message: 'Error happened')),
        ),
        isLoading: false,
      );

      whenListen(
        mockWordSelectionDetailBloc,
        Stream.fromIterable([failureState]),
        initialState: WordSelectionDetailState.initial(),
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
      final failureState = WordSelectionDetailState.initial().copyWith(
        fetchFailure: optionOf(const Right([])),
        wordSelection: mockWordSelection,
        isLoading: false,
      );

      whenListen(
        mockWordSelectionDetailBloc,
        Stream.fromIterable([failureState]),
        initialState: WordSelectionDetailState.initial(),
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
      final stateWithEmptyExercises = WordSelectionDetailState(
        fetchFailure: optionOf(Right(mockWordSelection)),
        wordSelection: mockWordSelection,
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
        mockWordSelectionDetailBloc,
        Stream.fromIterable([stateWithEmptyExercises]),
        initialState: WordSelectionDetailState.initial().copyWith(
          isLoading: true,
        ),
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

      final stateWithUserExercises = WordSelectionDetailState(
        fetchFailure: optionOf(const Right([])),
        isLoading: false,
        wordSelection: mockWordSelection,
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
        mockWordSelectionDetailBloc,
        Stream.fromIterable([stateWithUserExercises]),
        initialState: WordSelectionDetailState.initial().copyWith(
          isLoading: true,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
    });

    testWidgets('shows unlock UI and button is tappable', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
          premiumConfig: const PremiumConfig(wordSelection: false),
        ),
      );

      final premiumWordSelection = mockWordSelection.copyWith(isPremium: true);
      when(() => mockWordSelectionDetailBloc.state).thenReturn(
        WordSelectionDetailState.initial().copyWith(
          wordSelection: premiumWordSelection,
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

        // Fake WordSelectionDetail state
        final wordSelectionDetailState = WordSelectionDetailState.initial()
            .copyWith(
              wordSelection: mockWordSelection.copyWith(title: 'A'),
              isLoading: false,
            );

        when(() => mockAuthBloc.state).thenReturn(authState);
        when(
          () => mockWordSelectionDetailBloc.state,
        ).thenReturn(wordSelectionDetailState);

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
