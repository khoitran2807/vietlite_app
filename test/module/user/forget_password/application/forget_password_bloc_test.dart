import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/value/value_objects.dart';
import 'package:vietlite/module/user/forget_password/application/forget_password_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/common_mocks.dart';

void main() {
  late ForgetPasswordBloc forgetPasswordBloc;
  late MockForgetPasswordRepository mockRepository;
  late AppFailure apiError;
  setUp(() {
    mockRepository = MockForgetPasswordRepository();
    forgetPasswordBloc = ForgetPasswordBloc(repository: mockRepository);
    apiError = AppFailure.otherError(message: 'error happened');
  });

  tearDown(() {
    forgetPasswordBloc.close();
  });

  group('ForgetPasswordBloc', () {
    const testEmail = 'test@example.com';
    final validEmail = EmailAddress(testEmail);
    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      'emits loading and success state when forgetPassword succeeds',
      setUp: () {
        when(
          () => mockRepository.forgetPassword(email: testEmail),
        ).thenAnswer((_) async => const Right(unit));
      },
      build: () => forgetPasswordBloc,
      act:
          (bloc) =>
              bloc.add(ForgetPasswordEvent.forgetPassword(email: validEmail)),
      expect:
          () => [
            ForgetPasswordState.initial().copyWith(
              isForgetPassword: true,
              failureOrSuccessOption: none(),
            ),
            ForgetPasswordState.initial().copyWith(
              isForgetPassword: false,
              failureOrSuccessOption: optionOf(const Right(unit)),
            ),
          ],
      verify: (_) {
        verify(() => mockRepository.forgetPassword(email: testEmail)).called(1);
      },
    );
    blocTest<ForgetPasswordBloc, ForgetPasswordState>(
      'emits loading and failure state when forgetPassword fails',
      setUp: () {
        when(
          () => mockRepository.forgetPassword(email: testEmail),
        ).thenAnswer((_) async => Left(apiError));
      },
      build: () => forgetPasswordBloc,
      act:
          (bloc) =>
              bloc.add(ForgetPasswordEvent.forgetPassword(email: validEmail)),
      expect:
          () => [
            ForgetPasswordState.initial().copyWith(
              isForgetPassword: true,
              failureOrSuccessOption: none(),
            ),
            ForgetPasswordState.initial().copyWith(
              isForgetPassword: false,
              failureOrSuccessOption: optionOf(Left(apiError)),
            ),
          ],
      verify: (_) {
        verify(() => mockRepository.forgetPassword(email: testEmail)).called(1);
      },
    );
  });
}
