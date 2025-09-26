import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:vietlite/module/discover/things/domain/repository/i_things_repository.dart';
import 'package:vietlite/module/discover/things/infrastructure/datasource/things_remote.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IThingsRepository)
class ThingsRepository extends IThingsRepository {
  final ThingsRemoteDataSource remoteDataSource;

  ThingsRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, List<Thing>>> getThings({
    required ThingType type,
  }) async {
    try {
      final List<Thing> things = await remoteDataSource.getThings(type);

      return Right(things);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
