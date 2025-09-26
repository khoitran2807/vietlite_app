import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';

abstract class INumberDetailRepository {
  Future<Either<AppFailure, Number>> getNumberDetail({required String id});
}
