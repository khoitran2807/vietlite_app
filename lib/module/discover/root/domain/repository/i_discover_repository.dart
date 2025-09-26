import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';

abstract class IDiscoverRepository {
  Future<Either<AppFailure, List<Thing>>> getThings();

  Future<Either<AppFailure, List<UserProgress>>> getUserProgress({
    required String userId,
  });
}
