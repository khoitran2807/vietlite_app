import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/app/router/app_router.gr.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/application/number_bloc.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/presentation/numbers_screen.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  group('NumbersScreen Widget Tests', () {
    late AppRouterMock appRouterMock;
    late MockNumbersBloc mockNumbersBloc;
    late MockProgressBloc mockProgressBloc;
    late MockAuthBloc mockAuthBloc;
    final numbers = [
      Number.empty().copyWith(id: 'id1', title: 'title1'),
      Number.empty().copyWith(id: 'id2', title: 'title2'),
    ];

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      appRouterMock = AppRouterMock();
      mockNumbersBloc = MockNumbersBloc();
      mockProgressBloc = MockProgressBloc();
      mockAuthBloc = MockAuthBloc();
      GetIt.instance.registerFactory<NumbersBloc>(() => mockNumbersBloc);
      GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
      GetIt.instance.registerFactory<AuthBloc>(() => mockAuthBloc);
      GetIt.instance.registerFactory<ProgressBloc>(() => mockProgressBloc);
      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    });

    Widget createWidgetUnderTest() {
      return WidgetUtils.getScopedWidget(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
          BlocProvider<NumbersBloc>(create: (context) => mockNumbersBloc),
          BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
        ],
        child: const Scaffold(body: NumbersScreen()),
      );
    }

    testWidgets('Shows toast when an error occurs', (tester) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      final stateWithFailure = NumberState(
        fetchFailure: optionOf(Left(AppFailure.otherError(message: 'Error!'))),
        numbers: [],
        isLoading: false,
      );

      whenListen(
        mockNumbersBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: NumberState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: ScaffoldMessenger(child: createWidgetUnderTest())),
      );

      await tester.pump();

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('returns null when getNumbers success', (
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
      final stateWithSuccess = NumberState(
        fetchFailure: optionOf(Right(numbers)),
        numbers: numbers,
        isLoading: false,
      );

      whenListen(
        mockNumbersBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: NumberState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('Rebuilds UI only when relevant state changes', (tester) async {
      whenListen(
        mockNumbersBloc,
        Stream.fromIterable([NumberState.initial().copyWith(isLoading: true)]),
        initialState: NumberState.initial(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
    });
    testWidgets(
      'Navigates to NumberDetailScreenRoute when a letter is tapped',
      (WidgetTester tester) async {
        when(() => mockNumbersBloc.state).thenReturn(
          NumberState(
            numbers: numbers,
            isLoading: false,
            fetchFailure: optionOf(Right(numbers)),
          ),
        );

        when(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'id1')),
        ).thenAnswer((_) async {
          return null;
        });

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.text('title1'), findsOneWidget);

        await tester.tap(find.text('title1'));
        await tester.pumpAndSettle();

        verify(
          () => appRouterMock.push(NumberDetailScreenRoute(id: 'id1')),
        ).called(1);
      },
    );
  });
}
