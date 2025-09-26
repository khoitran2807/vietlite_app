import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vietlite/plugin/google/google_service.dart';
import 'package:mocktail/mocktail.dart';

// Mock class
class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

void main() {
  late MockGoogleSignIn mockGoogleSignIn;
  late GoogleService googleService;

  setUp(() {
    mockGoogleSignIn = MockGoogleSignIn();
    googleService = GoogleService(googleSignIn: mockGoogleSignIn);
  });

  group('GoogleService', () {
    test('account returns currentUser from GoogleSignIn', () {
      final mockAccount = MockGoogleSignInAccount();
      when(() => mockGoogleSignIn.currentUser).thenReturn(mockAccount);

      final result = googleService.account;

      expect(result, mockAccount);
      verify(() => mockGoogleSignIn.currentUser).called(1);
    });

    test('signIn calls googleSignIn.signIn', () async {
      final mockAccount = MockGoogleSignInAccount();
      when(
        () => mockGoogleSignIn.signIn(),
      ).thenAnswer((_) async => mockAccount);

      final result = await googleService.signIn();

      expect(result, mockAccount);
      verify(() => mockGoogleSignIn.signIn()).called(1);
    });

    test('signInSilently calls googleSignIn.signInSilently', () async {
      final mockAccount = MockGoogleSignInAccount();
      when(
        () => mockGoogleSignIn.signInSilently(),
      ).thenAnswer((_) async => mockAccount);

      final result = await googleService.signInSilently();

      expect(result, mockAccount);
      verify(() => mockGoogleSignIn.signInSilently()).called(1);
    });

    test('signOut calls googleSignIn.signOut', () async {
      final mockAccount = MockGoogleSignInAccount();
      when(
        () => mockGoogleSignIn.signOut(),
      ).thenAnswer((_) async => mockAccount);

      final result = await googleService.signOut();

      expect(result, mockAccount);
      verify(() => mockGoogleSignIn.signOut()).called(1);
    });
  });
}
