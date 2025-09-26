import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';

abstract class INumberRepository {
  Future<Either<AppFailure, List<Number>>> getNumbers();
}
