import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/thing_detail/domain/i_thing_detail_repository.dart';
import 'package:vietlite/module/discover/thing_detail/infrastructure/datasource/thing_detail_remote.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/failure_handler.dart';

@Injectable(as: IThingDetailRepository)
class ThingDetailRepository extends IThingDetailRepository {
  final ThingDetailRemoteDataSource remoteDataSource;

  ThingDetailRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, Thing>> getThingDetail({required String id}) async {
    try {
      final thing = await remoteDataSource.getThingDetail(id: id);
      return Right(thing);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
