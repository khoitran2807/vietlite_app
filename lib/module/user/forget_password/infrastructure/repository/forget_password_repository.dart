import 'package:dartz/dartz.dart';
import 'package:vietlite/module/user/forget_password/domain/repository/i_forget_password_repository.dart';
import 'package:vietlite/module/user/forget_password/infrastructure/datasource/forget_password_remote.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';

@Injectable(as: IForgetPasswordRepository)
class ForgetPasswordRepository extends IForgetPasswordRepository {
  final ForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepository({required this.remoteDataSource});
  @override
  Future<Either<AppFailure, Unit>> forgetPassword({
    required String email,
  }) async {
    try {
      await remoteDataSource.forgetPassword(email: email);
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
