import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/infrastructure/datasource/number_remote.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/repository/i_number_repository.dart';

@Injectable(as: INumberRepository)
class NumberRepository extends INumberRepository {
  final NumberRemoteDataSource remoteDataSource;

  NumberRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, List<Number>>> getNumbers() async {
    try {
      final List<Number> numbers = await remoteDataSource.getNumbers();
      return Right(numbers);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
