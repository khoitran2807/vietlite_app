import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';

abstract class IRegisterRepository {
  Future<Either<AppFailure, void>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}
