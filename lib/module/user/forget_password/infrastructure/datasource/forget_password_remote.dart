import 'package:vietlite/plugin/firebase/auth_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordRemoteDataSource {
  final AuthService authService;
  const ForgetPasswordRemoteDataSource({required this.authService});

  Future<void> forgetPassword({required String email}) async {
    await authService.forgetPassword(email);
  }
}
