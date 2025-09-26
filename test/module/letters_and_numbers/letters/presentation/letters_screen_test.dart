import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letters/application/letters_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/letters/presentation/letters_screen.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  group('LettersScreen Widget Tests', () {
    late AppRouterMock appRouterMock;
    late MockLettersBloc mockLettersBloc;
    late MockProgressBloc mockProgressBloc;
    late MockAuthBloc mockAuthBloc;
    final letters = [
      Letter.empty().copyWith(id: 'id1', title: 'title1'),
      Letter.empty().copyWith(id: 'id2', title: 'title2'),
    ];

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      appRouterMock = AppRouterMock();
      mockLettersBloc = MockLettersBloc();
      mockProgressBloc = MockProgressBloc();
      mockAuthBloc = MockAuthBloc();
      GetIt.instance.registerFactory<AuthBloc>(() => mockAuthBloc);
      GetIt.instance.registerFactory<LettersBloc>(() => mockLettersBloc);
      GetIt.instance.registerFactory<ProgressBloc>(() => mockProgressBloc);
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    });

    Widget createWidgetUnderTest() {
      return WidgetUtils.getScopedWidget(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<LettersBloc>(create: (context) => mockLettersBloc),
          BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
        ],
        child: const Scaffold(body: LettersScreen()),
      );
    }

    testWidgets('Shows toast when an error occurs', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      final stateWithFailure = LettersState(
        fetchFailure: optionOf(Left(AppFailure.otherError(message: 'Error!'))),
        letters: [],
        isLoading: false,
      );

      whenListen(
        mockLettersBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: LettersState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: ScaffoldMessenger(child: createWidgetUnderTest())),
      );

      await tester.pump();

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('returns null when getLetters success', (
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
      final stateWithSuccess = LettersState(
        fetchFailure: optionOf(Right(letters)),
        letters: letters,
        isLoading: false,
      );

      whenListen(
        mockLettersBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: LettersState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Rebuilds UI only when relevant state changes', (tester) async {
      whenListen(
        mockLettersBloc,
        Stream.fromIterable([LettersState.initial().copyWith(isLoading: true)]),
        initialState: LettersState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
    });

    testWidgets(
      'Navigates to LetterDetailScreenRoute when a letter is tapped',
      (WidgetTester tester) async {
        when(() => mockLettersBloc.state).thenReturn(
          LettersState(
            letters: letters,
            isLoading: false,
            fetchFailure: optionOf(Right(letters)),
          ),
        );

        when(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'id1')),
        ).thenAnswer((_) async {
          return null;
        });

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.text('title1'), findsOneWidget);

        await tester.tap(find.text('title1'));
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(LetterDetailScreenRoute(id: 'id1')),
        ).called(1);
      },
    );

    testWidgets(
      'Navigates to AlphabetScreenRoute when Alphabet button is tapped',
      (WidgetTester tester) async {
        when(() => mockAuthBloc.state).thenReturn(
          AuthState.initial().copyWith(
            appUser: AppUser.empty().copyWith(id: 'user_id'),
          ),
        );

        when(() => mockLettersBloc.state).thenReturn(
          LettersState(
            letters: letters,
            isLoading: false,
            fetchFailure: optionOf(Right(letters)),
          ),
        );

        when(
          () => appRouterMock.push(const AlphabetScreenRoute()),
        ).thenAnswer((_) async => null);

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.text('Alphabet'), findsOneWidget);

        // Tap vào nút
        await tester.tap(find.text('Alphabet'));
        await tester.pumpAndSettle();

        verify(() => appRouterMock.push(const AlphabetScreenRoute())).called(1);
      },
    );
  });
}
