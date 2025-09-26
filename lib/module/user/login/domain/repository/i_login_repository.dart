import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';

abstract class ILoginRepository {
  Future<Either<AppFailure, void>> anonymousSignIn();

  Future<Either<AppFailure, void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AppFailure, Unit>> signInWithGoogle();
}
