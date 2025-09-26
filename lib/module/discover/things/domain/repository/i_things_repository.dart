import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/discover/root/domain/enum/thing_type.dart';
import 'package:vietlite/module/discover/things/domain/entities/thing.dart';

abstract class IThingsRepository {
  Future<Either<AppFailure, List<Thing>>> getThings({required ThingType type});
}
