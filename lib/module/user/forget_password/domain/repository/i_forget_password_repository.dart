import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';

abstract class IForgetPasswordRepository {
  Future<Either<AppFailure, void>> forgetPassword({required String email});
}
