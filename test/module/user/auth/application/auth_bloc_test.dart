import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/user/auth/application/auth_bloc.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import '../../../../utils/common_mocks.dart';

void main() {
  late AuthBloc authBloc;
  late MockAuthRepository mockRepository;
  late AppFailure apiError;

  AppUser mockAppUser = AppUser.empty().copyWith(email: 'email@gmail.com');

  setUp(() {
    mockRepository = MockAuthRepository();
    authBloc = AuthBloc(repository: mockRepository);
    apiError = AppFailure.otherError(message: 'error happened');
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc', () {
    test('initial state is AuthState.initial', () {
      expect(authBloc.state, AuthState.initial());
    });

    blocTest<AuthBloc, AuthState>(
      'emits updated state when userChanges emits AppUser during initialize',
      setUp: () {
        when(
          () => mockRepository.userChanges(),
        ).thenAnswer((_) => Stream.value(AppUser.empty()));
      },
      build: () => AuthBloc(repository: mockRepository),
      act: (bloc) => bloc.add(const AuthEvent.initialize()),
      expect: () => [AuthState.initial().copyWith(appUser: AppUser.empty())],
      verify: (_) {
        verify(() => mockRepository.userChanges()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits correct state when updateUser is added',
      setUp: () {
        when(
          () => mockRepository.upsertUser(appUser: mockAppUser),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: () => authBloc,
      act: (bloc) => bloc.add(AuthEvent.updateUser(mockAppUser)),
      expect: () => [AuthState.initial().copyWith(appUser: mockAppUser)],
    );

    blocTest<AuthBloc, AuthState>(
      'emits updated state with failureOrSuccessOption on successful signOut',
      setUp: () {
        when(
          () => mockRepository.signOut(),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: () => authBloc,
      act: (bloc) => bloc.add(const AuthEvent.signOut()),
      expect:
          () => [
            AuthState.initial().copyWith(failureOrSuccessOption: none()),
            AuthState.initial().copyWith(
              appUser: AppUser.empty(),
              failureOrSuccessOption: optionOf(const Right(unit)),
            ),
          ],
      verify: (_) {
        verify(() => mockRepository.signOut()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits updated state with failureOrSuccessOption on failed signOut',
      setUp: () {
        when(
          () => mockRepository.signOut(),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => authBloc,
      act: (bloc) => bloc.add(const AuthEvent.signOut()),
      expect:
          () => [
            AuthState.initial().copyWith(failureOrSuccessOption: none()),
            AuthState.initial().copyWith(
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockRepository.signOut()).called(1);
      },
    );
    blocTest<AuthBloc, AuthState>(
      'emits updated state with failureOrSuccessOption on successful changePassword',
      setUp: () {
        when(
          () => mockRepository.changePassword(
            currentPassword: any(named: 'currentPassword'),
            newPassword: any(named: 'newPassword'),
          ),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: () => authBloc,
      act:
          (bloc) => bloc.add(
            const AuthEvent.changePassword(
              currentPassword: 'oldPassword',
              newPassword: 'newPassword123',
            ),
          ),
      expect:
          () => [
            AuthState.initial().copyWith(
              failureOrSuccessOption: none(),
              isLoading: true,
            ),
            AuthState.initial().copyWith(
              failureOrSuccessOption: optionOf(const Right(unit)),
              isLoading: false,
            ),
          ],
      verify: (_) {
        verify(
          () => mockRepository.changePassword(
            currentPassword: 'oldPassword',
            newPassword: 'newPassword123',
          ),
        ).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits updated state with failureOrSuccessOption on failed changePassword',
      setUp: () {
        when(
          () => mockRepository.changePassword(
            currentPassword: any(named: 'currentPassword'),
            newPassword: any(named: 'newPassword'),
          ),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => authBloc,
      act:
          (bloc) => bloc.add(
            const AuthEvent.changePassword(
              currentPassword: 'oldPassword',
              newPassword: 'newPassword123',
            ),
          ),
      expect:
          () => [
            AuthState.initial().copyWith(
              failureOrSuccessOption: none(),
              isLoading: true,
            ),
            AuthState.initial().copyWith(
              failureOrSuccessOption: optionOf(Left(apiError)),
              isLoading: false,
            ),
          ],
      verify: (_) {
        verify(
          () => mockRepository.changePassword(
            currentPassword: 'oldPassword',
            newPassword: 'newPassword123',
          ),
        ).called(1);
      },
    );
    blocTest<AuthBloc, AuthState>(
      'emits updated state with premiumConfig on successful getPremiumConfig',
      setUp: () {
        when(
          () => mockRepository.getPremiumConfig(userId: mockAppUser.id),
        ).thenAnswer((_) async => Right(PremiumConfig.empty()));
      },
      build: () => authBloc,
      seed: () => AuthState.initial().copyWith(appUser: mockAppUser),
      act: (bloc) => bloc.add(const AuthEvent.getPremiumConfig()),
      expect:
          () => [
            AuthState.initial().copyWith(
              appUser: mockAppUser,
              premiumConfig: PremiumConfig.empty(),
              failureOrSuccessOption: optionOf(Right(PremiumConfig.empty())),
            ),
          ],
      verify: (_) {
        verify(
          () => mockRepository.getPremiumConfig(userId: mockAppUser.id),
        ).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits updated state with failureOrSuccessOption on failed getPremiumConfig',
      setUp: () {
        when(
          () => mockRepository.getPremiumConfig(userId: mockAppUser.id),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => authBloc,
      seed: () => AuthState.initial().copyWith(appUser: mockAppUser),
      act: (bloc) => bloc.add(const AuthEvent.getPremiumConfig()),
      expect:
          () => [
            AuthState.initial().copyWith(
              appUser: mockAppUser,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockRepository.getPremiumConfig(userId: mockAppUser.id),
        ).called(1);
      },
    );
  });
}
