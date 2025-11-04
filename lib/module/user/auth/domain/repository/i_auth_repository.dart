import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/user/auth/domain/entities/app_user.dart';
import 'package:vietlite/module/user/auth/domain/entities/premium_config.dart';

abstract class IAuthRepository {
  Stream<AppUser> userChanges();

  Future<Either<AppFailure, void>> signOut();

  Future<void> upsertUser({required AppUser appUser});

  Future<Either<AppFailure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<AppFailure, PremiumConfig>> getPremiumConfig({
    required String userId,
  });

  Future<Either<AppFailure, Unit>> deleteUser();
}
