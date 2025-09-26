import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/res/images.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/thing_detail/application/thing_detail_bloc.dart';
import 'package:vietlite/module/discover/thing_detail/presentation/thing_detail_screen.dart';
import 'package:vietlite/module/discover/thing_exercise/application/thing_exercise_bloc.dart';
import 'package:vietlite/module/discover/thing_exercise/presentation/thing_exercise_item.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouterMock appRouterMock;
  late MockAuthBloc mockAuthBloc;
  late MockThingDetailBloc mockThingDetailBloc;
  late MockProgressBloc mockProgressBloc;
  late MockThingExerciseBloc mockThingExerciseBloc;

  final mockThing = Thing.empty().copyWith(
    id: '1',
    name: 'do',
    order: 1,
    type: ThingType.color,
  );

  final mockThingSuccess = mockThing.copyWith(
    examples: [
      const CharacterExample(
        title: 'Ant',
        image: 'ant.png',
        audio:
            'https://res.cloudinary.com/dj1az0imt/video/upload/v1740358680/sample-3s_qrlmdr.mp3',
      ),
    ],
    audio: '',
    id: 'id1',
    name: 'do',
    type: ThingType.color,
  );

  setUpAll(() {
    appRouterMock = AppRouterMock();
    mockAuthBloc = MockAuthBloc();
    mockThingDetailBloc = MockThingDetailBloc();
    mockProgressBloc = MockProgressBloc();
    mockThingExerciseBloc = MockThingExerciseBloc();

    GetIt.instance.registerSingleton<AuthBloc>(mockAuthBloc);
    GetIt.instance.registerFactory<ThingDetailBloc>(() => mockThingDetailBloc);
    GetIt.instance.registerFactory<ThingExerciseBloc>(
      () => mockThingExerciseBloc,
    );
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    GetIt.instance.registerSingleton<ProgressBloc>(mockProgressBloc);

    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    when(
      () => mockThingExerciseBloc.state,
    ).thenReturn(ThingExerciseState.initial());
    registerFallbackValue(FakeProgressEvent());
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => mockAuthBloc),
        BlocProvider<ProgressBloc>(create: (context) => mockProgressBloc),
        BlocProvider<ThingDetailBloc>(create: (context) => mockThingDetailBloc),
        BlocProvider<ThingExerciseBloc>(
          create: (context) => mockThingExerciseBloc,
        ),
      ],
      child: const ThingDetailScreen(id: '1'),
    );
  }

  group('ThingDetailScreen', () {
    testWidgets('returns empty widget when user is not logged in', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(AuthState.initial());

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('displays loading indicator when in loading state', (
      tester,
    ) async {
      when(() => mockAuthBloc.state).thenReturn(
        AuthState.initial().copyWith(
          appUser: AppUser.empty().copyWith(id: 'user_id'),
        ),
      );
      when(
        () => mockThingDetailBloc.state,
      ).thenReturn(ThingDetailState.initial().copyWith(isLoading: true));

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('returns null when getThingDetail success', (
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

      final stateWithSuccess = ThingDetailState(
        failureOrSuccessOption: optionOf(Right(mockThingSuccess)),
        thing: mockThingSuccess,
        isLoading: false,
        exercises: [],
      );

      whenListen(
        mockThingDetailBloc,
        Stream.fromIterable([stateWithSuccess]),
        initialState: ThingDetailState.initial().copyWith(isLoading: true),
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
      final stateWithFailure = ThingDetailState(
        failureOrSuccessOption: optionOf(
          Left(AppFailure.otherError(message: 'Error!')),
        ),
        isLoading: false,
        thing: mockThing,
        exercises: [],
      );

      whenListen(
        mockThingDetailBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: ThingDetailState.initial(),
      );

      await tester.pumpWidget(
        MaterialApp(home: ScaffoldMessenger(child: createWidgetUnderTest())),
      );

      await tester.pump();

      expect(find.text('Error!'), findsOneWidget);
    });

    testWidgets('Displays network image when example.image is valid', (
      tester,
    ) async {
      final stateWithLetter = ThingDetailState(
        failureOrSuccessOption: optionOf(Right(mockThing)),
        thing: mockThing.copyWith(image: 'https://example.com/xanh.png'),
        isLoading: false,
        exercises: [],
      );

      when(() => mockThingDetailBloc.state).thenReturn(stateWithLetter);

      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pump();

        final imageFinder = find.byWidgetPredicate(
          (widget) => widget is Image && widget.image is NetworkImage,
        );

        expect(imageFinder, findsOneWidget);
      });
    });

    testWidgets('Tapping image shows dialog with InteractiveViewer', (
      tester,
    ) async {
      const testImageUrl = 'https://example.com/xanh.png';

      final stateWithLetter = ThingDetailState(
        failureOrSuccessOption: optionOf(Right(mockThing)),
        thing: mockThing.copyWith(image: testImageUrl),
        isLoading: false,
        exercises: [],
      );

      when(() => mockThingDetailBloc.state).thenReturn(stateWithLetter);

      await mockNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(home: createWidgetUnderTest()));
        await tester.pumpAndSettle();

        final imageFinder = find.byWidgetPredicate(
          (widget) => widget is Image && widget.image is NetworkImage,
        );
        expect(imageFinder, findsOneWidget);
        await tester.tap(imageFinder);
        await tester.pumpAndSettle();

        expect(find.byType(InteractiveViewer), findsOneWidget);
      });
    });

    testWidgets('Dialog width is half of screen width on tablet', (
      tester,
    ) async {
      final stateWithLetter = ThingDetailState(
        failureOrSuccessOption: optionOf(Right(mockThing)),
        thing: mockThing.copyWith(image: 'https://example.com/xanh.png'),
        isLoading: false,
        exercises: [],
      );

      when(() => mockThingDetailBloc.state).thenReturn(stateWithLetter);

      await mockNetworkImages(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: MediaQuery(
              data: const MediaQueryData(size: Size(1000, 768)),
              child: createWidgetUnderTest(),
            ),
          ),
        );

        await tester.pumpAndSettle();

        final imageFinder = find.byWidgetPredicate(
          (widget) => widget is Image && widget.image is NetworkImage,
        );
        expect(imageFinder, findsOneWidget);
        await tester.tap(imageFinder);
        await tester.pumpAndSettle();

        final dialogFinder = find.byType(Dialog);
        expect(dialogFinder, findsOneWidget);

        final box = tester.renderObject<RenderBox>(
          find.byType(Container).first,
        );
        expect(box.size.width, 768);
      });
    });
    testWidgets('Displays exercises list when thing.exercises is not empty', (
      tester,
    ) async {
      final mockExercises = [
        const ThingExercise(
          id: 'ex1',
          choices: ['A', 'B', 'C'],
          answer: 'A',
          image: 'https://example.com/ex1.png',
          question: 'Question 1',
        ),
        const ThingExercise(
          id: 'ex2',
          choices: ['X', 'Y', 'Z'],
          answer: 'Y',
          image: 'https://example.com/ex2.png',
          question: 'Question 2',
        ),
      ];

      final thingWithExercises = mockThing.copyWith(exercises: mockExercises);
      const userExercise = UserExercise(
        id: 'ex1',
        lastAnswer: 'B',
        isCorrect: true,
      );

      final stateWithExercises = ThingDetailState(
        failureOrSuccessOption: optionOf(Right(thingWithExercises)),
        thing: thingWithExercises,
        isLoading: false,
        exercises: [userExercise],
      );

      when(() => mockThingDetailBloc.state).thenReturn(stateWithExercises);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      // Check that lessons render
      expect(find.textContaining('Lesson 1'), findsOneWidget);
      expect(find.textContaining('Lesson 2'), findsOneWidget);

      // Check ThingExerciseItem widgets
      final items = find.byType(ThingExerciseItem);
      expect(items, findsNWidgets(2));

      // Check lastAnswer mapping
      final firstItem = tester.widget<ThingExerciseItem>(items.at(0));
      expect(firstItem.lastAnswer, equals('B')); // match with userExercise

      final secondItem = tester.widget<ThingExerciseItem>(items.at(1));
      expect(secondItem.lastAnswer, isNull);
    });

    testWidgets('Displays default image when thing.image is not http url', (
      tester,
    ) async {
      final thingWithInvalidImage = mockThing.copyWith(image: 'abc.png');

      final stateWithInvalidImage = ThingDetailState(
        failureOrSuccessOption: optionOf(Right(thingWithInvalidImage)),
        thing: thingWithInvalidImage,
        isLoading: false,
        exercises: [],
      );

      when(() => mockThingDetailBloc.state).thenReturn(stateWithInvalidImage);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final imageFinder = find.byWidgetPredicate(
        (widget) => widget is Image && widget.image is AssetImage,
      );
      expect(imageFinder, findsOneWidget);

      final assetImage =
          (tester.widget(imageFinder) as Image).image as AssetImage;
      expect(assetImage.assetName, equals(AppImages.defaultImage));
    });
  });
}
