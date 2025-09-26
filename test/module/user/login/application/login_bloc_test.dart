import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/value/value_objects.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/user/login/application/login_bloc.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late LoginBloc loginBloc;
  late MockLoginRepository mockRepository;
  late AppFailure apiError;

  setUp(() {
    mockRepository = MockLoginRepository();
    loginBloc = LoginBloc(repository: mockRepository);
    apiError = AppFailure.otherError(message: 'error happened');
  });

  tearDown(() {
    loginBloc.close();
  });

  group('LoginBloc - anonymousSignIn', () {
    blocTest<LoginBloc, LoginState>(
      'emits loading and success state when anonymousSignIn succeeds',
      setUp: () {
        when(
          () => mockRepository.anonymousSignIn(),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginEvent.anonymousSignIn()),
      expect:
          () => [
            LoginState.initial().copyWith(
              isAnonymousSignIn: true,
              failureOrSuccessOption: none(),
            ),
            LoginState.initial().copyWith(
              isAnonymousSignIn: false,
              failureOrSuccessOption: optionOf(const Right(unit)),
            ),
          ],
      verify: (_) {
        verify(() => mockRepository.anonymousSignIn()).called(1);
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits loading and failure state when anonymousSignIn fails',
      setUp: () {
        when(
          () => mockRepository.anonymousSignIn(),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginEvent.anonymousSignIn()),
      expect:
          () => [
            LoginState.initial().copyWith(
              isAnonymousSignIn: true,
              failureOrSuccessOption: none(),
            ),
            LoginState.initial().copyWith(
              isAnonymousSignIn: false,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockRepository.anonymousSignIn()).called(1);
      },
    );
  });

  group('LoginBloc - signInWithEmailAndPassword', () {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';

    blocTest<LoginBloc, LoginState>(
      'emits loading and success state when signInWithEmailAndPassword succeeds',
      setUp: () {
        when(
          () => mockRepository.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: () => loginBloc,
      act:
          (bloc) => bloc.add(
            LoginEvent.signInWithEmailAndPassword(
              email: EmailAddress(testEmail),
              password: Password(testPassword),
            ),
          ),
      expect:
          () => [
            LoginState.initial().copyWith(
              isSignInWithEmailAndPassword: true,
              failureOrSuccessOption: none(),
            ),
            LoginState.initial().copyWith(
              isSignInWithEmailAndPassword: false,
              failureOrSuccessOption: optionOf(const Right(unit)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockRepository.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).called(1);
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits loading and failure state when signInWithEmailAndPassword fails',
      setUp: () {
        when(
          () => mockRepository.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => loginBloc,
      act:
          (bloc) => bloc.add(
            LoginEvent.signInWithEmailAndPassword(
              email: EmailAddress(testEmail),
              password: Password(testPassword),
            ),
          ),
      expect:
          () => [
            LoginState.initial().copyWith(
              isSignInWithEmailAndPassword: true,
              failureOrSuccessOption: none(),
            ),
            LoginState.initial().copyWith(
              isSignInWithEmailAndPassword: false,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockRepository.signInWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
          ),
        ).called(1);
      },
    );
  });

  group('LoginBloc - signInWithGoogle', () {
    blocTest<LoginBloc, LoginState>(
      'emits loading and success state when signInWithGoogle succeeds',
      setUp: () {
        when(
          () => mockRepository.signInWithGoogle(),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginEvent.signInWithGoogle()),
      expect:
          () => [
            LoginState.initial().copyWith(
              isSignInWithGoogle: true,
              failureOrSuccessOption: none(),
            ),
            LoginState.initial().copyWith(
              isSignInWithGoogle: false,
              failureOrSuccessOption: optionOf(const Right(unit)),
            ),
          ],
      verify: (_) {
        verify(() => mockRepository.signInWithGoogle()).called(1);
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits loading and failure state when signInWithGoogle fails',
      setUp: () {
        when(
          () => mockRepository.signInWithGoogle(),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => loginBloc,
      act: (bloc) => bloc.add(const LoginEvent.signInWithGoogle()),
      expect:
          () => [
            LoginState.initial().copyWith(
              isSignInWithGoogle: true,
              failureOrSuccessOption: none(),
            ),
            LoginState.initial().copyWith(
              isSignInWithGoogle: false,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockRepository.signInWithGoogle()).called(1);
      },
    );
  });
}
