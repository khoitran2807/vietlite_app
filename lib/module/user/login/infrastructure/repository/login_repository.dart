import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/user/login/domain/repository/i_login_repository.dart';
import 'package:vietlite/module/user/login/infrastructure/datasource/login_remote.dart';

@Injectable(as: ILoginRepository)
class LoginRepository extends ILoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, Unit>> anonymousSignIn() async {
    try {
      await remoteDataSource.anonymousSignIn();
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await remoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> signInWithGoogle() async {
    try {
      await remoteDataSource.signInWithGoogle();
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
