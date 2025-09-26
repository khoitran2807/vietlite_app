import 'package:vietlite/common/error/app_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/user/register/domain/repository/i_register_repository.dart';
import 'package:vietlite/module/user/register/infrastructure/datasource/register_remote.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IRegisterRepository)
class RegisterRepository extends IRegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, Unit>> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await remoteDataSource.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
