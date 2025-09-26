import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/discover/root/domain/repository/i_discover_repository.dart';
import 'package:vietlite/module/discover/root/infrastructure/datasource/discover_remote.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/progress/domain/entities/user_progress.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IDiscoverRepository)
class DiscoverRepository extends IDiscoverRepository {
  final DiscoverRemoteDataSource remoteDataSource;

  DiscoverRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, List<Thing>>> getThings() async {
    try {
      final List<Thing> things = await remoteDataSource.getThings();
      return Right(things);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, List<UserProgress>>> getUserProgress({
    required String userId,
  }) async {
    try {
      final List<UserProgress> thingProgress = await remoteDataSource
          .getUserProgress(userId: userId);
      return Right(thingProgress);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
