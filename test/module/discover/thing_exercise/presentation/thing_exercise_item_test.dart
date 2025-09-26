import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vietlite/app/res/images.dart';
import 'package:vietlite/app/router/app_router.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/thing_exercise/application/thing_exercise_bloc.dart';
import 'package:vietlite/module/discover/thing_exercise/presentation/thing_exercise_item.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/progress/application/progress_bloc.dart';
import 'package:vietlite/module/progress/domain/enum/exercise_type.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../utils/common_mocks.dart';
import '../../../../utils/widget_utils.dart';

class FakeThingExerciseEvent extends Fake implements ThingExerciseEvent {}

class FakeThingExerciseState extends Fake implements ThingExerciseState {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppRouterMock appRouterMock;
  late MockAuthBloc mockAuthBloc;
  late MockProgressBloc mockProgressBloc;
  late MockThingExerciseBloc mockThingExerciseBloc;

  final mockExercise = ThingExercise.empty().copyWith(
    id: 'ex1',
    question: 'What color is the apple?',
    choices: ['red', 'green'],
    answer: 'red',
    image: 'https://example.com/apple.png',
  );

  final mockThing = Thing.empty().copyWith(
    id: 'thing1',
    name: 'Apple',
    exercises: [mockExercise],
  );

  setUpAll(() {
    appRouterMock = AppRouterMock();
    mockAuthBloc = MockAuthBloc();
    mockProgressBloc = MockProgressBloc();
    mockThingExerciseBloc = MockThingExerciseBloc();

    GetIt.instance.registerSingleton<AuthBloc>(mockAuthBloc);
    GetIt.instance.registerSingleton<AppRouter>(appRouterMock);
    GetIt.instance.registerSingleton<ProgressBloc>(mockProgressBloc);
    GetIt.instance.registerFactory<ThingExerciseBloc>(
      () => mockThingExerciseBloc,
    );
    when(() => mockAuthBloc.state).thenReturn(AuthState.initial());
    when(
      () => mockThingExerciseBloc.state,
    ).thenReturn(ThingExerciseState.initial().copyWith(exercise: mockExercise));

    registerFallbackValue(FakeProgressEvent());
    registerFallbackValue(FakeThingExerciseEvent());
    registerFallbackValue(FakeThingExerciseState());
  });

  Widget createWidgetUnderTest() {
    return WidgetUtils.getScopedWidget(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
        BlocProvider<ProgressBloc>(create: (_) => mockProgressBloc),
        BlocProvider<ThingExerciseBloc>(create: (_) => mockThingExerciseBloc),
      ],
      child: Scaffold(
        body: ThingExerciseItem(exercise: mockExercise, thing: mockThing),
      ),
    );
  }

  group('ThingExerciseItem', () {
    testWidgets('displays question and image', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.text('What color is the apple?'), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      });
    });

    testWidgets('displays choice options', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('red'), findsOneWidget);
      expect(find.text('green'), findsOneWidget);
    });

    testWidgets('tapping a choice sends selectAnswer event', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.tap(find.text('red'));
      await tester.pump();

      verify(
        () => mockThingExerciseBloc.add(
          const ThingExerciseEvent.selectAnswer(selectedAnswer: 'red'),
        ),
      ).called(1);
    });

    testWidgets('confirm button is enabled when answer is selected', (
      tester,
    ) async {
      when(() => mockThingExerciseBloc.state).thenReturn(
        ThingExerciseState.initial().copyWith(
          selectedAnswer: 'red',
          exercise: mockExercise,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('Confirm selection'), findsOneWidget);
    });

    testWidgets('tapping confirm sends checkAnswer event', (tester) async {
      when(() => mockThingExerciseBloc.state).thenReturn(
        ThingExerciseState.initial().copyWith(
          selectedAnswer: 'red',
          exercise: mockExercise,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.tap(find.text('Confirm selection'));
      await tester.pump();

      verify(
        () => mockThingExerciseBloc.add(const ThingExerciseEvent.checkAnswer()),
      ).called(1);
    });

    testWidgets('shows login required message when user not logged in', (
      tester,
    ) async {
      when(
        () => mockAuthBloc.state,
      ).thenReturn(AuthState.initial().copyWith(appUser: AppUser.empty()));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(
        find.text('Bạn cần đăng nhập để lưu lại tiến độ học tập!'),
        findsOneWidget,
      );
    });

    testWidgets('displays correct answer result', (tester) async {
      when(() => mockThingExerciseBloc.state).thenReturn(
        ThingExerciseState.initial().copyWith(
          isAnswered: true,
          selectedAnswer: 'red',
          exercise: mockExercise,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('displays wrong answer result', (tester) async {
      when(() => mockThingExerciseBloc.state).thenReturn(
        ThingExerciseState.initial().copyWith(
          isAnswered: true,
          selectedAnswer: 'green',
          exercise: mockExercise,
        ),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.cancel_rounded), findsOneWidget);
    });

    testWidgets('calls showToast on failure', (tester) async {
      final stateWithFailure = ThingExerciseState(
        failureOrSuccessOption: optionOf(
          Left(AppFailure.otherError(message: 'Error!')),
        ),
        isLoading: false,
        selectedAnswer: '',
        isAnswered: false,
        exercise: mockExercise,
      );
      whenListen(
        mockThingExerciseBloc,
        Stream.fromIterable([stateWithFailure]),
        initialState: ThingExerciseState.initial(),
      );
      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        expect(find.text('Error!'), findsOneWidget);
      });
    });

    testWidgets(
      'dispatches updateProgress when ThingExerciseBloc emits success',
      (WidgetTester tester) async {
        when(() => mockAuthBloc.state).thenReturn(
          AuthState.initial().copyWith(
            appUser: AppUser.empty().copyWith(id: 'user_id'),
          ),
        );

        final initialState = ThingExerciseState.initial().copyWith(
          selectedAnswer: 'red',
          exercise: mockExercise,
        );

        final successState = initialState.copyWith(
          failureOrSuccessOption: some(right(mockThing)),
        );

        whenListen(
          mockThingExerciseBloc,
          Stream.fromIterable([successState]),
          initialState: initialState, // important: initial != success
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // verify add called
        final captured =
            verify(() => mockProgressBloc.add(captureAny())).captured;
        expect(captured.length, 1);

        final event = captured.first as ProgressEvent;
        event.mapOrNull(
          updateProgress: (update) {
            final progress = update.progress;
            expect(progress.id, mockThing.id);
            expect(progress.exerciseType, ExerciseType.things);
            expect(progress.exercises.length, 1);
            expect(progress.exercises.first.id, mockExercise.id);
            expect(progress.exercises.first.lastAnswer, 'red');
            expect(progress.exercises.first.isCorrect, true);
            expect(progress.writeAt, isNotNull);
          },
        );
      },
    );

    testWidgets('tapping image opens dialog with InteractiveViewer', (
      tester,
    ) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        final imageFinder = find.byType(AspectRatio);
        expect(imageFinder, findsOneWidget);
        await tester.tap(imageFinder);
        await tester.pumpAndSettle();

        expect(find.byType(Dialog), findsOneWidget);

        expect(find.byType(InteractiveViewer), findsOneWidget);

        final image = tester.widget<Image>(
          find.descendant(
            of: find.byType(InteractiveViewer),
            matching: find.byType(Image),
          ),
        );
        expect(image.image, isA<NetworkImage>());
        final networkImage = image.image as NetworkImage;
        expect(networkImage.url, mockExercise.image);
      });
    });

    testWidgets('displays default image when exercise image is null', (
      tester,
    ) async {
      final exerciseWithNoImage = mockExercise.copyWith(image: '');

      await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          providers: [
            BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
            BlocProvider<ProgressBloc>(create: (_) => mockProgressBloc),
            BlocProvider<ThingExerciseBloc>(
              create: (_) => mockThingExerciseBloc,
            ),
          ],
          child: Scaffold(
            body: ThingExerciseItem(
              exercise: exerciseWithNoImage,
              thing: mockThing,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final assetImageFinder = find.byWidgetPredicate((widget) {
        if (widget is Image && widget.image is AssetImage) {
          final asset = widget.image as AssetImage;
          return asset.assetName == AppImages.defaultImage;
        }
        return false;
      });

      expect(assetImageFinder, findsOneWidget);
    });

    testWidgets(
      'tapping confirm dispatches updateAnswerProgress when user is logged in with email',
      (tester) async {
        const userId = 'user_id';

        // Mock user logged in with email
        when(() => mockAuthBloc.state).thenReturn(
          AuthState.initial().copyWith(
            appUser: AppUser.empty().copyWith(
              id: userId,
              email: 'test@example.com',
            ),
          ),
        );

        // Mock selected answer
        when(() => mockThingExerciseBloc.state).thenReturn(
          ThingExerciseState.initial().copyWith(
            selectedAnswer: 'red',
            exercise: mockExercise,
            isLoading: false,
          ),
        );

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pumpAndSettle();

        // Tap the confirm button
        await tester.tap(find.text('Confirm selection'));
        await tester.pump();

        // Verify updateAnswerProgress is dispatched
        verify(
          () => mockThingExerciseBloc.add(
            ThingExerciseEvent.updateAnswerProgress(
              userId: userId,
              progressId: mockThing.id,
              totalExercises: mockThing.exercises.length,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets('shows dialog with half width on tablet', (tester) async {
      await mockNetworkImages(() async {
        // Set MediaQuery to tablet size
        await tester.pumpWidget(
          MediaQuery(
            data: const MediaQueryData(size: Size(1200, 800)), // tablet
            child: createWidgetUnderTest(),
          ),
        );
        await tester.pumpAndSettle();

        // Tap on the image
        await tester.tap(find.byType(AspectRatio));
        await tester.pumpAndSettle();

        // Verify dialog appears
        final dialogFinder = find.byType(Dialog);
        expect(dialogFinder, findsOneWidget);

        // Measure the width of the dialog's body
        final dialogBodyFinder = find.descendant(
          of: dialogFinder,
          matching: find.byType(InteractiveViewer),
        );
        final dialogBodySize = tester.getSize(dialogBodyFinder);

        // Expected width = MediaQuery width / 2
        expect(dialogBodySize.width, closeTo(1.0, 0.1));
      });
    });
  });
}
