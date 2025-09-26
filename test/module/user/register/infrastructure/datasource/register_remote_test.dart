import 'package:flutter_test/flutter_test.dart';
import 'package:vietlite/module/user/register/infrastructure/datasource/register_remote.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/common_mocks.dart';

void main() {
  late RegisterRemoteDataSource remoteDataSource;
  late MockAuthService mockAuthService;
  late MockUser mockUser;

  setUp(() {
    mockUser = MockUser();
    mockAuthService = MockAuthService();
    remoteDataSource = RegisterRemoteDataSource(authService: mockAuthService);
  });
  group('RegisterRemoteDataSource', () {
    test(
      'calls registerWithEmailAndPassword on authService with correct email and password',
      () async {
        const testEmail = 'test@example.com';
        const testPassword = 'password123';
        const testName = 'abc';

        when(
          () => mockAuthService.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).thenAnswer((_) async => mockUser);

        //act
        await remoteDataSource.registerWithEmailAndPassword(
          email: testEmail,
          password: testPassword,
          name: testName,
        );

        //assert
        verify(
          () => mockAuthService.registerWithEmailAndPassword(
            email: testEmail,
            password: testPassword,
            name: testName,
          ),
        ).called(1);
      },
    );
  });
}
