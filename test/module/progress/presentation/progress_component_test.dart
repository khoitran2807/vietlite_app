import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/progress/presentation/discover_progress_component.dart';
import 'package:vietlite/module/progress/presentation/home_progress_component.dart';
import 'package:vietlite/module/progress/presentation/lesson_card_component.dart';
import 'package:vietlite/module/progress/presentation/letter_progress_component.dart';
import 'package:vietlite/module/progress/presentation/number_progress_component.dart';
import 'package:vietlite/module/progress/presentation/word_match_progress_component.dart';
import 'package:vietlite/module/progress/presentation/word_selection_progress_component.dart';
import 'package:vietlite/module/root/domain/enum/nav_item.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';
import 'package:vietlite/module/words_and_sentences/word_selection/word_selection_list/domain/entities/word_selection.dart';
import 'package:vietlite/plugin/firebase/remote_config_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vietlite/module/root/application/tab_view_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/progress/presentation/progress_component.dart';

import '../../../utils/common_mocks.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late MockAuthBloc mockAuthBloc;
  late MockTabviewBloc mockTabViewBloc;
  late AppRouterMock appRouterMock;
  late MockProgressBloc mockProgressBloc;
  late MockRemoteConfigService mockRemoteConfigService;

  final numberA = Number.empty().copyWith(id: 'N1', title: '1');
  final numberB = Number.empty().copyWith(id: 'N2', title: '2');
  final letterA = Letter.empty().copyWith(id: 'L1', title: 'A', order: 1);
  final letterB = Letter.empty().copyWith(id: 'L2', title: 'B', order: 2);
  final thingA = Thing.empty().copyWith(id: 'T1', name: 'xanh', order: 1);
  final thingB = Thing.empty().copyWith(id: 'T2', name: 'do', order: 2);
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
  final progressLetter = UserProgress.empty().copyWith(
    exerciseType: ExerciseType.letter,
    id: 'L1',
  );
  final progressNumber = UserProgress.empty().copyWith(
    id: 'N1',
    exerciseType: ExerciseType.number,
  );
  final progressThing = UserProgress.empty().copyWith(
    id: 'T1',
    exerciseType: ExerciseType.things,
  );
  final progressWordMatch = UserProgress.empty().copyWith(
    id: 'WM1',
    exerciseType: ExerciseType.wordMatch,
  );
  final progressWordSelection = UserProgress.empty().copyWith(
    id: 'WS1',
    exerciseType: ExerciseType.wordSelection,
  );

  setUpAll(() {
    mockAuthBloc = MockAuthBloc();
    mockTabViewBloc = MockTabviewBloc();
    appRouterMock = AppRouterMock();
    mockProgressBloc = MockProgressBloc();
    mockRemoteConfigService = MockRemoteConfigService();

    GetIt.instance.registerFactory<ProgressBloc>(() => mockProgressBloc);
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    GetIt.instance.registerSingleton<AuthBloc>(mockAuthBloc);
    GetIt.instance.registerSingleton<TabViewBloc>(mockTabViewBloc);
    GetIt.instance.registerSingleton<RemoteConfigService>(
      mockRemoteConfigService,
    );

    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    when(() => mockRemoteConfigService.letters).thenReturn(26);
    when(() => mockRemoteConfigService.numbers).thenReturn(10);
    when(() => mockRemoteConfigService.things).thenReturn(5);
    when(() => mockRemoteConfigService.wordMatches).thenReturn(5);
    when(() => mockRemoteConfigService.wordSelections).thenReturn(5);
    when(() => mockRemoteConfigService.wordNSentences).thenReturn(5);
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>.value(value: mockAuthBloc),
        BlocProvider<TabViewBloc>.value(value: mockTabViewBloc),
        BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
      ],
      child: const Scaffold(body: ProgressComponent()),
    );
  }

  testWidgets('returns empty when user is not logged in with email', (
    WidgetTester tester,
  ) async {
    when(() => mockAuthBloc.state).thenReturn(
      AuthState.initial().copyWith(
        appUser: AppUser.empty().copyWith(id: 'user_id'),
      ),
    );
    await tester.pumpWidget(createWidgetUnderTest());
    expect(find.byType(SizedBox), findsOneWidget);
  });
  testWidgets('ProgressComponent rebuilds when selectedTab changes', (
    tester,
  ) async {
    // Arrange user login email
    when(() => mockAuthBloc.state).thenReturn(
      AuthState.initial().copyWith(
        appUser: AppUser.empty().copyWith(
          id: 'user_id',
          email: 'test@example.com',
        ),
      ),
    );

    when(() => mockProgressBloc.state).thenReturn(
      ProgressState.initial().copyWith(
        userProgresses: [UserProgress.empty().copyWith(id: 'L1')],
        letters: [Letter.empty().copyWith(id: 'L1', title: 'A', order: 1)],
      ),
    );

    const initialTabState = TabViewState(
      selectedTab: NavItem.home,
      selectedChildTab: NavChildItem.letters,
      tabs: [],
      isTablet: true,
    );

    const updatedTabState = TabViewState(
      selectedTab: NavItem.lettersNNumbers,
      selectedChildTab: NavChildItem.letters,
      tabs: [],
      isTablet: true,
    );

    // Fake stream phát ra state ban đầu và state mới
    whenListen(
      mockTabViewBloc,
      Stream.fromIterable([initialTabState, updatedTabState]),
      initialState: initialTabState,
    );

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.byType(LetterProgressComponent), findsOneWidget);
  });

  testWidgets(
    'shows LetterProgressComponent when user is logged in and tab is letter',
    (WidgetTester tester) async {
      // Arrange
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(
            id: 'user_id',
            email: 'test@example.com',
            isAnonymous: false,
          ),
        ),
      );
      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
          isTablet: true,
          selectedTab: NavItem.lettersNNumbers,
          selectedChildTab: NavChildItem.letters,
        ),
      );

      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          selectedTab: NavItem.lettersNNumbers,
          selectedChildTab: NavChildItem.letters,
          tabs: [],
          isTablet: true,
        ),
      );

      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle(); // ensure rebuild

      // Assert
      expect(find.byType(LetterProgressComponent), findsOneWidget);
      expect(find.byType(NumberProgressComponent), findsNothing);
    },
  );

  testWidgets(
    'shows NumberProgressComponent when user is logged in and tab is number',
    (WidgetTester tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(
            id: 'user_id',
            email: 'test@example.com',
            isAnonymous: false,
          ),
        ),
      );
      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
          isTablet: true,
          selectedTab: NavItem.lettersNNumbers,
          selectedChildTab: NavChildItem.numbers,
        ),
      );

      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          selectedTab: NavItem.lettersNNumbers,
          selectedChildTab: NavChildItem.numbers,
          tabs: [],
          isTablet: true,
        ),
      );

      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(NumberProgressComponent), findsOneWidget);
      expect(find.byType(LetterProgressComponent), findsNothing);
    },
  );

  testWidgets(
    'shows DiscoverProgressComponent when user is logged in and tab is discover',
    (WidgetTester tester) async {
      // Arrange
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(
            id: 'user_id',
            email: 'test@example.com',
            isAnonymous: false,
          ),
        ),
      );
      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
          isTablet: true,
          selectedTab: NavItem.discover,
          selectedChildTab: NavChildItem.letters,
        ),
      );

      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          selectedTab: NavItem.discover,
          selectedChildTab: NavChildItem.letters,
          tabs: [],
          isTablet: true,
        ),
      );

      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle(); // ensure rebuild

      // Assert
      expect(find.byType(DiscoverProgressComponent), findsOneWidget);
      expect(find.byType(NumberProgressComponent), findsNothing);
    },
  );

  testWidgets(
    'shows WordSelectionProgressComponent when user is logged in and tab isWordSelection',
    (WidgetTester tester) async {
      // Arrange
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(
            id: 'user_id',
            email: 'test@example.com',
            isAnonymous: false,
          ),
        ),
      );
      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
          isTablet: true,
          selectedTab: NavItem.wordsNSentences,
          selectedChildTab: NavChildItem.wordSelection,
        ),
      );

      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          selectedTab: NavItem.wordsNSentences,
          selectedChildTab: NavChildItem.wordSelection,
          tabs: [],
          isTablet: true,
        ),
      );

      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle(); // ensure rebuild

      // Assert
      expect(find.byType(WordSelectionProgressComponent), findsOneWidget);
      expect(find.byType(WordMatchProgressComponent), findsNothing);
    },
  );

  testWidgets(
    'shows WordMatchProgressComponent when user is logged in and tab isWordMatch',
    (WidgetTester tester) async {
      // Arrange
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(
            id: 'user_id',
            email: 'test@example.com',
            isAnonymous: false,
          ),
        ),
      );
      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          tabs: [
            NavItem.lettersNNumbers,
            NavItem.wordsNSentences,
            NavItem.home,
            NavItem.discover,
            NavItem.setting,
          ],
          isTablet: true,
          selectedTab: NavItem.wordsNSentences,
          selectedChildTab: NavChildItem.wordMatch,
        ),
      );

      when(() => mockTabViewBloc.state).thenReturn(
        const TabViewState(
          selectedTab: NavItem.wordsNSentences,
          selectedChildTab: NavChildItem.wordMatch,
          tabs: [],
          isTablet: true,
        ),
      );

      when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

      // Act
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle(); // ensure rebuild

      // Assert
      expect(find.byType(WordMatchProgressComponent), findsOneWidget);
      expect(find.byType(WordSelectionProgressComponent), findsNothing);
    },
  );

  group('TabViewState buildWhen logic', () {
    bool buildWhen(TabViewState previous, TabViewState current) {
      return previous.selectedTab != current.selectedTab ||
          previous.selectedChildTab != current.selectedChildTab ||
          previous.tabs != current.tabs;
    }

    test('rebuilds when selectedTab changes', () {
      const previous = TabViewState(
        tabs: [],
        isTablet: false,
        selectedTab: NavItem.home,
        selectedChildTab: NavChildItem.letters,
      );

      final current = previous.copyWith(selectedTab: NavItem.setting);

      expect(buildWhen(previous, current), isTrue);
    });

    test('rebuilds when selectedChildTab changes', () {
      const previous = TabViewState(
        tabs: [],
        isTablet: false,
        selectedTab: NavItem.home,
        selectedChildTab: NavChildItem.letters,
      );

      final current = previous.copyWith(selectedChildTab: NavChildItem.numbers);

      expect(buildWhen(previous, current), isTrue);
    });

    test('rebuilds when tabs change', () {
      const previous = TabViewState(
        tabs: [NavItem.home],
        isTablet: false,
        selectedTab: NavItem.home,
        selectedChildTab: NavChildItem.letters,
      );

      final current = previous.copyWith(tabs: [NavItem.home, NavItem.setting]);

      expect(buildWhen(previous, current), isTrue);
    });

    test('does not rebuild when nothing changes', () {
      const previous = TabViewState(
        tabs: [NavItem.home],
        isTablet: false,
        selectedTab: NavItem.home,
        selectedChildTab: NavChildItem.letters,
      );

      const current = previous;

      expect(buildWhen(previous, current), isFalse);
    });
  });

  group('HomeProgressComponent UI', () {
    testWidgets('returns SizedBox when userProgresses is empty', (
      tester,
    ) async {
      when(
        () => mockProgressBloc.state,
      ).thenReturn(ProgressState.initial().copyWith(userProgresses: []));

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            BlocProvider<TabViewBloc>.value(value: mockTabViewBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)), // Website layout
            child: Scaffold(body: HomeProgressComponent()),
          ),
        ),
      );
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('renders all lesson cards', (tester) async {
      final state = ProgressState.initial().copyWith(
        letters: [letterA, letterB],
        numbers: [numberA],
        things: [thingA],
        wordSelections: [wordSelectionA],
        wordMatches: [wordMatchA],
        userProgresses: [
          progressLetter,
          progressNumber,
          progressThing,
          progressWordMatch,
          progressWordSelection,
        ],
      );

      when(() => mockProgressBloc.state).thenReturn(state);

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            BlocProvider<TabViewBloc>.value(value: mockTabViewBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(body: HomeProgressComponent()),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(LessonCardComponent), findsNWidgets(4));

      expect(find.text('Letters'), findsOneWidget);
      expect(find.text('Numbers'), findsOneWidget);
      expect(find.text('Words & Sentences'), findsOneWidget);
      expect(find.text('Discover'), findsOneWidget);
    });

    testWidgets('rebuilds when userProgresses change', (
      WidgetTester tester,
    ) async {
      final initialState = ProgressState.initial().copyWith(
        letters: [letterA],
        numbers: [numberA],
        things: [thingA],
        wordSelections: [wordSelectionA],
        wordMatches: [wordMatchA],
        userProgresses: [
          progressLetter,
          progressNumber,
          progressThing,
          progressWordMatch,
          progressWordSelection,
        ],
      );

      final updatedState = initialState.copyWith(
        letters: [letterA, letterB],
        numbers: [numberA, numberB],
        things: [thingA, thingB],
        wordSelections: [wordSelectionA, wordSelectionB],
        wordMatches: [wordMatchA, wordMatchB],
        userProgresses: [
          progressLetter,
          progressNumber,
          progressThing,
          progressWordMatch,
          progressWordSelection,
        ],
      );

      when(() => mockProgressBloc.state).thenReturn(initialState);

      whenListen(
        mockProgressBloc,
        Stream.fromIterable([initialState, updatedState]),
        initialState: initialState,
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            BlocProvider<TabViewBloc>.value(value: mockTabViewBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(body: HomeProgressComponent()),
          ),
        ),
      );
      expect(find.byType(LessonCardComponent), findsNWidgets(4));
      await tester.pumpAndSettle();
      expect(find.byType(LessonCardComponent), findsNWidgets(4));
    });
  });

  group('NumberProgressComponent UI', () {
    testWidgets(
      'NumberProgressComponent rebuilds when numbers or numberProgress change',
      (WidgetTester tester) async {
        final initialState = ProgressState.initial().copyWith(
          numbers: [numberA],
          userProgresses: [progressNumber],
        );

        final updatedState = initialState.copyWith(
          numbers: [numberA, numberB],
          userProgresses: [progressNumber],
        );

        whenListen(
          mockProgressBloc,
          Stream.fromIterable([initialState, updatedState]),
          initialState: initialState,
        );

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: NumberProgressComponent()),
            ),
          ),
        );
        expect(find.byType(LessonCardComponent), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.byType(LessonCardComponent), findsNWidgets(2));
      },
    );
    testWidgets(
      'NumberProgressComponent returns SizedBox when lastLearnedNumber is null',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: NumberProgressComponent()),
            ),
          ),
        );

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(LessonCardComponent), findsNothing);
      },
    );
    testWidgets('renders both last and next lesson cards when data available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          numbers: [numberA, numberB],
          userProgresses: [progressNumber],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)), // Website layout
            child: Scaffold(body: NumberProgressComponent()),
          ),
        ),
      );

      // Expect two lesson cards: last learned & next suggested
      expect(find.byType(LessonCardComponent), findsNWidgets(2));
      expect(find.textContaining('Number 1'), findsOneWidget);
      expect(find.textContaining('Number 2'), findsOneWidget);
    });

    testWidgets('renders only last lesson card when no next lesson available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          numbers: [numberA],
          userProgresses: [progressNumber],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)), // Website layout
            child: Scaffold(body: NumberProgressComponent()),
          ),
        ),
      );
      // Expect only one card because nextLearnedNumber is null
      expect(find.byType(LessonCardComponent), findsOneWidget);
      expect(find.textContaining('Number 1'), findsOneWidget);
    });

    testWidgets('renders SizedBox when no numbers learned yet', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          numbers: [Number.empty().copyWith(id: 'N1', title: '1')],
          userProgresses: [],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const NumberProgressComponent(),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(LessonCardComponent), findsNothing);
    });
    testWidgets(
      'tapping last lesson card navigates to NumberDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            numbers: [numberA],
            userProgresses: [progressNumber],
          ),
        );
        when(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'N1')),
        ).thenAnswer((_) => Future.value());
        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: NumberProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'N1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card navigates to NumberDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            numbers: [numberA, numberB],
            userProgresses: [progressNumber],
          ),
        );

        when(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'N2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: NumberProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'N2')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping last lesson card of ROW navigates to NumberDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            numbers: [numberA],
            userProgresses: [progressNumber],
          ),
        );
        when(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'N1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: NumberProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'N1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card of ROW navigates to NumberDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            numbers: [numberA, numberB],
            userProgresses: [progressNumber],
          ),
        );

        when(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'N2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: NumberProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'N2')),
        ).called(1);
      },
    );
  });

  group('LetterProgressComponent UI', () {
    testWidgets(
      'LetterProgressComponent rebuilds when letters or letterProgress change',
      (WidgetTester tester) async {
        final initialState = ProgressState.initial().copyWith(
          letters: [letterA],
          userProgresses: [progressLetter],
        );

        final updatedState = initialState.copyWith(
          letters: [letterA, letterB],
          userProgresses: [progressLetter],
        );

        when(() => mockProgressBloc.state).thenReturn(initialState);

        whenListen(
          mockProgressBloc,
          Stream.fromIterable([initialState, updatedState]),
          initialState: initialState,
        );

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: LetterProgressComponent()),
            ),
          ),
        );
        // Expect initial render
        expect(find.byType(LessonCardComponent), findsOneWidget);

        await tester.pumpAndSettle();

        // Expect rebuild after updated state
        expect(find.byType(LessonCardComponent), findsNWidgets(2));
      },
    );

    testWidgets(
      'LetterProgressComponent returns SizedBox when lastLearnedLetter is null',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)),
              child: Scaffold(
                // or Scaffold
                body: LetterProgressComponent(),
              ),
            ),
          ),
        );

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(LessonCardComponent), findsNothing);
      },
    );
    testWidgets('renders both last and next lesson cards when data available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          letters: [letterA, letterB],
          userProgresses: [progressLetter],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(
              // or Scaffold
              body: LetterProgressComponent(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      // Expect two lesson cards: last learned & next suggested
      expect(find.byType(LessonCardComponent), findsNWidgets(2));
    });

    testWidgets('renders only last lesson card when no next lesson available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          letters: [letterA],
          userProgresses: [progressLetter],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(
              // or Scaffold
              body: LetterProgressComponent(),
            ),
          ),
        ),
      );
      // Expect only one card because nextLearnedLetter is null
      expect(find.byType(LessonCardComponent), findsOneWidget);
      expect(find.textContaining('Letter A'), findsOneWidget);
    });

    testWidgets('renders SizedBox when no letters learned yet', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          letters: [Letter.empty().copyWith(id: 'L1', title: 'A', order: 1)],
          userProgresses: [],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const LetterProgressComponent(),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(LessonCardComponent), findsNothing);
    });
    testWidgets(
      'tapping last lesson card navigates to LetterDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            letters: [letterA],
            userProgresses: [progressLetter],
          ),
        );
        when(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'L1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)),
              child: Scaffold(body: LetterProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'L1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card navigates to LetterDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            letters: [letterA, letterB],
            userProgresses: [progressLetter],
          ),
        );

        when(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'L2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: LetterProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'L2')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping last lesson card of ROW navigates to LetterDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            letters: [letterA],
            userProgresses: [progressLetter],
          ),
        );
        when(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'L1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: LetterProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'L1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card of ROW navigates to LetterDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            letters: [letterA, letterB],
            userProgresses: [progressLetter],
          ),
        );

        when(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'L2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: LetterProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'L2')),
        ).called(1);
      },
    );
  });
  group('DiscoverProgressComponent UI', () {
    testWidgets(
      'DiscoverProgressComponent rebuilds when things or thingProgress change',
      (WidgetTester tester) async {
        final initialState = ProgressState.initial().copyWith(
          things: [thingA],
          userProgresses: [progressThing],
        );

        final updatedState = initialState.copyWith(
          things: [thingA, thingB],
          userProgresses: [progressThing],
        );

        whenListen(
          mockProgressBloc,
          Stream.fromIterable([initialState, updatedState]),
          initialState: initialState,
        );

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: DiscoverProgressComponent()),
            ),
          ),
        );
        expect(find.byType(LessonCardComponent), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.byType(LessonCardComponent), findsNWidgets(2));
      },
    );
    testWidgets(
      'DiscoverProgressComponent returns SizedBox when lastLearnedThing is null',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)),
              child: Scaffold(
                // or Scaffold
                body: DiscoverProgressComponent(),
              ),
            ),
          ),
        );

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(LessonCardComponent), findsNothing);
      },
    );
    testWidgets('renders both last and next lesson cards when data available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          things: [thingA, thingB],
          userProgresses: [progressThing],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(
              // or Scaffold
              body: DiscoverProgressComponent(),
            ),
          ),
        ),
      );

      // Expect two lesson cards: last learned & next suggested
      expect(find.byType(LessonCardComponent), findsNWidgets(2));
      expect(find.textContaining('xanh'), findsOneWidget);
      expect(find.textContaining('do'), findsOneWidget);
    });

    testWidgets('renders only last lesson card when no next lesson available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          things: [thingA],
          userProgresses: [progressThing],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(
              // or Scaffold
              body: DiscoverProgressComponent(),
            ),
          ),
        ),
      );
      // Expect only one card because nextLearnedLetter is null
      expect(find.byType(LessonCardComponent), findsOneWidget);
      expect(find.textContaining('xanh'), findsOneWidget);
    });

    testWidgets('renders SizedBox when no things learned yet', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          things: [Thing.empty().copyWith(id: 'T1', name: 'xanh', order: 1)],
          userProgresses: [],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const DiscoverProgressComponent(),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(LessonCardComponent), findsNothing);
    });
    testWidgets(
      'tapping last lesson card navigates to ThingDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            things: [thingA],
            userProgresses: [progressThing],
          ),
        );
        when(
          () => appRouterMock.push(ThingDetailScreenRoute(id: 'T1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)),
              child: Scaffold(body: DiscoverProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(ThingDetailScreenRoute(id: 'T1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card navigates to ThingDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            things: [thingA, thingB],
            userProgresses: [progressThing],
          ),
        );

        when(
          () => appRouterMock.push(ThingDetailScreenRoute(id: 'T2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: DiscoverProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(ThingDetailScreenRoute(id: 'T2')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping last lesson card of ROW navigates to ThingDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            things: [thingA],
            userProgresses: [progressThing],
          ),
        );
        when(
          () => appRouterMock.push(ThingDetailScreenRoute(id: 'T1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: DiscoverProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(ThingDetailScreenRoute(id: 'T1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card of ROW navigates to ThingDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            things: [thingA, thingB],
            userProgresses: [progressThing],
          ),
        );

        when(
          () => appRouterMock.push(ThingDetailScreenRoute(id: 'T2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: DiscoverProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(ThingDetailScreenRoute(id: 'T2')),
        ).called(1);
      },
    );
  });
  group('WordMatchProgressComponent UI', () {
    testWidgets(
      'WordMatchProgressComponent rebuilds when letters or wordMatchProgress change',
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

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: WordMatchProgressComponent()),
            ),
          ),
        );

        // Expect initial render
        expect(find.byType(LessonCardComponent), findsOneWidget);

        await tester.pumpAndSettle();

        // Expect rebuild after updated state
        expect(find.byType(LessonCardComponent), findsNWidgets(2));
      },
    );
    testWidgets(
      'WordMatchProgressComponent returns SizedBox when lastLearnedWordMatch is null',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)),
              child: Scaffold(
                // or Scaffold
                body: WordMatchProgressComponent(),
              ),
            ),
          ),
        );

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(LessonCardComponent), findsNothing);
      },
    );
    testWidgets('renders both last and next lesson cards when data available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          wordMatches: [wordMatchA, wordMatchB],
          userProgresses: [progressWordMatch],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(
              // or Scaffold
              body: WordMatchProgressComponent(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Expect two lesson cards: last learned & next suggested
      expect(find.byType(LessonCardComponent), findsNWidgets(2));
    });

    testWidgets('renders only last lesson card when no next lesson available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          wordMatches: [wordMatchA],
          userProgresses: [progressWordMatch],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(
              // or Scaffold
              body: WordMatchProgressComponent(),
            ),
          ),
        ),
      ); // Expect only one card because nextLearnedNumber is null
      expect(find.byType(LessonCardComponent), findsOneWidget);
      expect(find.textContaining('A'), findsOneWidget);
    });

    testWidgets('renders SizedBox when no wordMatches learned yet', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          wordMatches: [WordMatch.empty().copyWith(id: 'WM1', title: 'A')],
          userProgresses: [],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const WordMatchProgressComponent(),
        ),
      );
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(LessonCardComponent), findsNothing);
    });
    testWidgets(
      'tapping last lesson card navigates to WordMatchDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            wordMatches: [wordMatchA],
            userProgresses: [progressWordMatch],
          ),
        );
        when(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'WM1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)),
              child: Scaffold(body: WordMatchProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'WM1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card navigates to WordMatchDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            wordMatches: [wordMatchA, wordMatchB],
            userProgresses: [progressWordMatch],
          ),
        );

        when(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'WM2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: WordMatchProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'WM2')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping last lesson card of ROW navigates to WordMatchDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            wordMatches: [wordMatchA],
            userProgresses: [progressWordMatch],
          ),
        );
        when(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'WM1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: WordMatchProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'WM1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card of ROW navigates to WordMatchDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            wordMatches: [wordMatchA, wordMatchB],
            userProgresses: [progressWordMatch],
          ),
        );

        when(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'WM2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: WordMatchProgressComponent()),
            ),
          ),
        );
        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordMatchDetailScreenRoute(id: 'WM2')),
        ).called(1);
      },
    );
  });
  group('WordSelectionProgressComponent UI', () {
    testWidgets(
      'WordSelectionProgressComponent rebuilds when letters or wordSelectionProgress change',
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

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: WordSelectionProgressComponent()),
            ),
          ),
        );

        // Expect initial render
        expect(find.byType(LessonCardComponent), findsOneWidget);

        await tester.pumpAndSettle();

        // Expect rebuild after updated state
        expect(find.byType(LessonCardComponent), findsNWidgets(2));
      },
    );
    testWidgets(
      'WordSelectionProgressComponent returns SizedBox when lastLearnedWordMatch is null',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(ProgressState.initial());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)),
              child: Scaffold(
                // or Scaffold
                body: WordSelectionProgressComponent(),
              ),
            ),
          ),
        );

        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(LessonCardComponent), findsNothing);
      },
    );
    testWidgets('renders both last and next lesson cards when data available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          wordSelections: [wordSelectionA, wordSelectionB],
          userProgresses: [progressWordSelection],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(
              // or Scaffold
              body: WordSelectionProgressComponent(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Expect two lesson cards: last learned & next suggested
      expect(find.byType(LessonCardComponent), findsNWidgets(2));
    });

    testWidgets('renders only last lesson card when no next lesson available', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          wordSelections: [wordSelectionA],
          userProgresses: [progressWordSelection],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const MediaQuery(
            data: MediaQueryData(size: Size(1200, 800)),
            child: Scaffold(
              // or Scaffold
              body: WordSelectionProgressComponent(),
            ),
          ),
        ),
      ); // Expect only one card because nextLearnedNumber is null
      expect(find.byType(LessonCardComponent), findsOneWidget);
      expect(find.textContaining('A'), findsOneWidget);
    });

    testWidgets('renders SizedBox when no wordSelections learned yet', (
      WidgetTester tester,
    ) async {
      when(() => mockProgressBloc.state).thenReturn(
        ProgressState.initial().copyWith(
          wordSelections: [
            WordSelection.empty().copyWith(id: 'WS1', title: 'A'),
          ],
          userProgresses: [],
        ),
      );

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
          ],
          child: const WordSelectionProgressComponent(),
        ),
      );
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(LessonCardComponent), findsNothing);
    });
    testWidgets(
      'tapping last lesson card navigates to WordSelectionDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            wordSelections: [wordSelectionA],
            userProgresses: [progressWordSelection],
          ),
        );
        when(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'WS1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)),
              child: Scaffold(body: WordSelectionProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'WS1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card navigates to WordSelectionDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            wordSelections: [wordSelectionA, wordSelectionB],
            userProgresses: [progressWordSelection],
          ),
        );

        when(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'WS2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: const MediaQuery(
              data: MediaQueryData(size: Size(1200, 800)), // Website layout
              child: Scaffold(body: WordSelectionProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'WS2')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping last lesson card of ROW navigates to WordSelectionDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            wordSelections: [wordSelectionA],
            userProgresses: [progressWordSelection],
          ),
        );
        when(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'WS1')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: WordSelectionProgressComponent()),
            ),
          ),
        );

        await tester.tap(find.byType(LessonCardComponent).first);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'WS1')),
        ).called(1);
      },
    );

    testWidgets(
      'tapping next lesson card of ROW navigates to WordSelectionDetailScreenRoute with correct id',
      (WidgetTester tester) async {
        when(() => mockProgressBloc.state).thenReturn(
          ProgressState.initial().copyWith(
            wordSelections: [wordSelectionA, wordSelectionB],
            userProgresses: [progressWordSelection],
          ),
        );

        when(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'WS2')),
        ).thenAnswer((_) => Future.value());

        await tester.pumpWidget(
          WidgetUtils.getScopedWidget(
            providers: [
              BlocProvider<ProgressBloc>.value(value: mockProgressBloc),
            ],
            child: MediaQuery(
              data: MediaQueryData(size: WidgetUtils.mobileTestSize),
              // mobile layout
              child: const Scaffold(body: WordSelectionProgressComponent()),
            ),
          ),
        );
        await tester.tap(find.byType(LessonCardComponent).last);
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(WordSelectionDetailScreenRoute(id: 'WS2')),
        ).called(1);
      },
    );
  });
}
