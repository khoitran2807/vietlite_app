import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/value/value_objects.dart';
import 'package:vietlite/module/user/register/application/register_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late RegisterBloc registerBloc;
  late MockRegisterRepository mockRegisterRepository;
  late AppFailure apiError;

  setUp(() {
    mockRegisterRepository = MockRegisterRepository();
    registerBloc = RegisterBloc(repository: mockRegisterRepository);
    apiError = AppFailure.otherError(message: 'error happened');
  });

  tearDown(() {
    registerBloc.close();
  });

  group('RegisterBloc - registerWithEmailAndPassword', () {
    const testEmail = 'test@example.com';
    const testPassword = 'password123';
    const testName = 'abc';

    blocTest<RegisterBloc, RegisterState>(
      'emits loading and success state when registerWithEmailAndPassword succeeds',
      setUp: () {
        when(
          () => mockRegisterRepository.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: () => registerBloc,
      act:
          (bloc) => bloc.add(
            RegisterEvent.registerWithEmailAndPassword(
              email: EmailAddress(testEmail),
              password: Password(testPassword),
              name: testName,
            ),
          ),
      expect:
          () => [
            RegisterState.initial().copyWith(
              isRegister: true,
              failureOrSuccessOption: none(),
            ),
            RegisterState.initial().copyWith(
              isRegister: false,
              failureOrSuccessOption: optionOf(const Right(unit)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockRegisterRepository.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).called(1);
      },
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits loading and failure state when registerWithEmailAndPassword fails',
      setUp: () {
        when(
          () => mockRegisterRepository.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => registerBloc,
      act:
          (bloc) => bloc.add(
            RegisterEvent.registerWithEmailAndPassword(
              email: EmailAddress(testEmail),
              password: Password(testPassword),
              name: testName,
            ),
          ),
      expect:
          () => [
            RegisterState.initial().copyWith(
              isRegister: true,
              failureOrSuccessOption: none(),
            ),
            RegisterState.initial().copyWith(
              isRegister: false,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(
          () => mockRegisterRepository.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).called(1);
      },
    );
  });
}
