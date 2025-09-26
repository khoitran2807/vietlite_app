import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/letters_and_numbers/letters/domain/entities/letter.dart';

abstract class ILetterRepository {
  Future<Either<AppFailure, List<Letter>>> getLetters();
}
