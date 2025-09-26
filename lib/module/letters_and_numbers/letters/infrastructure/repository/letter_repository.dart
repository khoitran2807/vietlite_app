import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/common/error/failure_handler.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/repository/i_letter_repository.dart';
import 'package:vietlite/module/letters_and_numbers/letters/infrastructure/datasource/letter_remote.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ILetterRepository)
class LetterRepository extends ILetterRepository {
  final LetterRemoteDataSource remoteDataSource;

  LetterRepository({required this.remoteDataSource});

  @override
  Future<Either<AppFailure, List<Letter>>> getLetters() async {
    try {
      final List<Letter> letters = await remoteDataSource.getLetters();
      return Right(letters);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
