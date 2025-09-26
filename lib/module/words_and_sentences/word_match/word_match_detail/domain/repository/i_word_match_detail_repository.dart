import 'package:dartz/dartz.dart';
import 'package:vietlite/common/error/app_failure.dart';
import 'package:vietlite/module/words_and_sentences/word_match/word_match_list/domain/entities/word_match.dart';

abstract class IWordMatchDetailRepository {
  Future<Either<AppFailure, WordMatch>> getWordMatchDetail({
    required String id,
  });
}
