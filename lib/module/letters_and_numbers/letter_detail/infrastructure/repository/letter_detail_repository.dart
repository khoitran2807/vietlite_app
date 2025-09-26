import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/infrastructure/datasource/letter_detail_remote.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:injectable/injectable.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/letters_and_numbers/letter_detail/domain/repository/i_letter_detail_repository.dart';

@Injectable(as: ILetterDetailRepository)
class LetterDetailRepository extends ILetterDetailRepository {
  final LetterDetailRemoteDataSource remoteDataSource;

  LetterDetailRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, Letter>> getLetterDetail({
    required String id,
  }) async {
    try {
      final letter = await remoteDataSource.getLetterDetail(id: id);
      return Right(letter);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
