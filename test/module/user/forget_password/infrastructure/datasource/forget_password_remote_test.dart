import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/user/forget_password/infrastructure/datasource/forget_password_remote.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late ForgetPasswordRemoteDataSource remoteDataSource;
  late MockAuthService mockAuthService;
  setUp(() {
    mockAuthService = MockAuthService();
    remoteDataSource = ForgetPasswordRemoteDataSource(
      authService: mockAuthService,
    );
  });

  group('ForgetPasswordDataSource', () {
    const testEmail = 'test@gmail.com';
    test(
      "calls forgetPassword on authService when forgetPassword is invoked",
      () async {
        when(
          () => mockAuthService.forgetPassword(testEmail),
        ).thenAnswer((_) async => {});

        await remoteDataSource.forgetPassword(email: testEmail);

        verify(() => mockAuthService.forgetPassword(testEmail)).called(1);
      },
    );
  });
}
