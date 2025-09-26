import 'package:vietlite/plugin/firebase/auth_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterRemoteDataSource {
  final AuthService authService;

  const RegisterRemoteDataSource({required this.authService});

  Future<void> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    await authService.registerWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
  }
}
