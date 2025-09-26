import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';

abstract class IThingDetailRepository {
  Future<Either<AppFailure, Thing>> getThingDetail({required String id});
}
