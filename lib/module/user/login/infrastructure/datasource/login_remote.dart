import 'package:injectable/injectable.dart';
import 'package:vietlite/plugin/firebase/auth_service.dart';

@injectable
class LoginRemoteDataSource {
  final AuthService authService;

  const LoginRemoteDataSource({required this.authService});

  Future<void> anonymousSignIn() async {
    await authService.signInAnonymously();
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithGoogle() async {
    await authService.signInWithGoogle();
  }
}
