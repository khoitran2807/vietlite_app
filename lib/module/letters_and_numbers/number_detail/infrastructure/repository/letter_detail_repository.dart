import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/domain/repository/i_number_detail_repository.dart';
import 'package:vietlite/module/letters_and_numbers/number_detail/infrastructure/datasource/number_detail_remote.dart';

@Injectable(as: INumberDetailRepository)
class NumberDetailRepository extends INumberDetailRepository {
  final NumberDetailRemoteDataSource remoteDataSource;

  NumberDetailRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, Number>> getNumberDetail({
    required String id,
  }) async {
    try {
      final number = await remoteDataSource.getNumberDetail(id: id);
      return Right(number);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
