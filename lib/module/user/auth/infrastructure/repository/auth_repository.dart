import 'package:dartz/dartz.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/user/auth/domain/repository/i_auth_repository.dart';
import 'package:vietlite/module/user/auth/infrastructure/datasource/auth_remote.dart';

@Injectable(as: IAuthRepository)
class AuthRepository extends IAuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Stream<AppUser> userChanges() {
    return remoteDataSource.userChanges();
  }

  @override
  Future<Either<AppFailure, Unit>> upsertUser({
    required AppUser appUser,
  }) async {
    try {
      await remoteDataSource.upsertUser(appUser: appUser);
      return const Right(unit);
    } catch (ex) {
      return Left(FailureHandler.handleFailure(ex));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, PremiumConfig>> getPremiumConfig({
    required String userId,
  }) async {
    try {
      final premiumConfig = await remoteDataSource.getPremiumConfig(
        userId: userId,
      );
      return Right(premiumConfig);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
